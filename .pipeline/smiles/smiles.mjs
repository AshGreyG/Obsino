#!/usr/bin/env -S node --no-deprecation
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
import { JSDOM } from "jsdom";

const smiles = process.argv[2];
if (!smiles) {
  console.error("Error: Please provide a SMILES string as an argument.");
  process.exit(1);
} else {
  console.log(`→ Rendering ${smiles}`);
}

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const libraryPath = path.resolve(
  __dirname,
  "node_modules/smiles-drawer/dist/smiles-drawer.min.js"
);

if (!fs.existsSync(libraryPath)) {
  console.error(`Error: Cannot find smiles-drawer library at ${libraryPath}`);
  console.error(
    "Please ensure you run 'pnpm install smiles-drawer' in this directory."
  );
  process.exit(1);
}
const libraryCode = fs.readFileSync(libraryPath, "utf8");

const dom = new JSDOM(
  '<!DOCTYPE html><html><head></head><body><svg id="canvas"></svg></body></html>',
  { runScripts: "dangerously" }
);

global.window = dom.window;
global.document = dom.window.document;

// SVG viewBox tightener
// smiles-drawer produces SVGs with oversized viewBox padding and no
// explicit width/height attributes.  This function trims the viewBox to
// tightly fit the actual drawing content and adds proper width/height so
// Typst (via resvg) renders the molecule at a reasonable size.
function tightenViewBox(dom, padding = 12) {
  const svg = dom.window.document.querySelector("svg");
  if (!svg) return;

  // Collect all element bounding boxes, accounting for ancestor transforms
  const boxes = [];

  // Track current transform as we traverse
  function getTranslate(el) {
    let tx = 0,
      ty = 0;
    while (el && el.nodeType === 1) {
      const tr = el.getAttribute("transform") || "";
      // Match translate(X, Y)
      const m = tr.match(/translate\(\s*([\d.\-]+)\s*,\s*([\d.\-]+)\s*\)/);
      if (m) {
        tx += parseFloat(m[1]);
        ty += parseFloat(m[2]);
      }
      el = el.parentElement;
    }
    return { x: tx, y: ty };
  }

  // Consider visible drawing elements and mask circles (atom highlights).
  // Skip defs and mask background rects.
  const elements = svg.querySelectorAll("line, circle, rect, path, ellipse");
  for (const el of elements) {
    let parent = el.parentElement;
    let inDefs = false;
    let inMask = false;
    while (parent) {
      const tag = parent.tagName && parent.tagName.toLowerCase();
      if (tag === "defs") {
        inDefs = true;
        break;
      }
      if (tag === "mask") {
        inMask = true;
        break;
      }
      parent = parent.parentElement;
    }
    if (inDefs) continue;
    // In masks: include circles (atom highlights), skip rects (background)
    if (inMask) {
      if (el.tagName.toLowerCase() !== "circle") continue;
    }

    const t = getTranslate(el);
    const tag = el.tagName.toLowerCase();
    let b = null;

    if (tag === "line") {
      const x1 = parseFloat(el.getAttribute("x1")) + t.x;
      const y1 = parseFloat(el.getAttribute("y1")) + t.y;
      const x2 = parseFloat(el.getAttribute("x2")) + t.x;
      const y2 = parseFloat(el.getAttribute("y2")) + t.y;
      b = {
        minX: Math.min(x1, x2),
        maxX: Math.max(x1, x2),
        minY: Math.min(y1, y2),
        maxY: Math.max(y1, y2),
      };
    } else if (tag === "circle") {
      const cx = parseFloat(el.getAttribute("cx")) + t.x;
      const cy = parseFloat(el.getAttribute("cy")) + t.y;
      const r = parseFloat(el.getAttribute("r")) || 0;
      b = {
        minX: cx - r,
        maxX: cx + r,
        minY: cy - r,
        maxY: cy + r,
      };
    } else if (tag === "rect") {
      const x = parseFloat(el.getAttribute("x")) + t.x;
      const y = parseFloat(el.getAttribute("y")) + t.y;
      const w = parseFloat(el.getAttribute("width")) || 0;
      const h = parseFloat(el.getAttribute("height")) || 0;
      b = {
        minX: x,
        maxX: x + w,
        minY: y,
        maxY: y + h,
      };
    } else if (tag === "ellipse") {
      const cx = parseFloat(el.getAttribute("cx")) + t.x;
      const cy = parseFloat(el.getAttribute("cy")) + t.y;
      const rx = parseFloat(el.getAttribute("rx")) || 0;
      const ry = parseFloat(el.getAttribute("ry")) || 0;
      b = {
        minX: cx - rx,
        maxX: cx + rx,
        minY: cy - ry,
        maxY: cy + ry,
      };
    } else if (tag === "path") {
      // Skip path elements for now — they're part of masks/defs
      continue;
    }

    if (b) boxes.push(b);
  }

  if (boxes.length === 0) return;

  // Global min/max across all elements
  let minX = Infinity,
    minY = Infinity,
    maxX = -Infinity,
    maxY = -Infinity;
  for (const b of boxes) {
    if (b.minX < minX) minX = b.minX;
    if (b.minY < minY) minY = b.minY;
    if (b.maxX > maxX) maxX = b.maxX;
    if (b.maxY > maxY) maxY = b.maxY;
  }

  // Add padding
  minX -= padding;
  minY -= padding;
  maxX += padding;
  maxY += padding;

  const width = maxX - minX;
  const height = maxY - minY;

  // Update viewBox and add explicit width/height
  svg.setAttribute("viewBox", `${minX} ${minY} ${width} ${height}`);
  svg.setAttribute("width", `${width}`);
  svg.setAttribute("height", `${height}`);

  // Remove any CSS-style width/height that smiles-drawer may have set on the SVG
  const currentStyle = svg.getAttribute("style") || "";
  const cleaned = currentStyle
    .replace(/width:\s*[^;]+;?\s*/g, "")
    .replace(/height:\s*[^;]+;?\s*/g, "")
    .replace(/visibility:\s*[^;]+;?\s*/g, "")
    .trim();
  if (cleaned) {
    svg.setAttribute("style", cleaned);
  } else {
    svg.removeAttribute("style");
  }
}

try {
  const scriptElement = dom.window.document.createElement("script");
  scriptElement.textContent = libraryCode;
  dom.window.document.head.appendChild(scriptElement);

  const SmilesDrawer = dom.window.SmilesDrawer;

  if (!SmilesDrawer) {
    throw new Error(
      "Failed to clear container sandbox: SmilesDrawer didn't mount to window."
    );
  }

  const SvgDrawerClass = SmilesDrawer.SvgDrawer || SmilesDrawer.Drawer;

  const options = {
    width: 450,
    height: 450,
    padding: 10,
    bondThickness: 2,
    terminalCarbons: false,
    explicitHydrogens: false,
    debug: false,
  };

  const drawer = new SvgDrawerClass(options);

  SmilesDrawer.parse(
    smiles,
    (tree) => {
      const svgElement = document.getElementById("canvas");

      drawer.draw(tree, svgElement, "light", false);

      // CSS transform → SVG attribute transform
      // smiles-drawer positions text labels via CSS transform (translateX/translateY)
      // which is not supported by Typst's SVG renderer (resvg).
      const textGroups = svgElement.querySelectorAll('g[style*="transform"]');
      for (const g of textGroups) {
        const style = g.getAttribute("style") || "";
        const m = style.match(
          /transform:\s*translateX\(([\d.\-]+)px\)\s*translateY\(([\d.\-]+)px\)/
        );
        if (m) {
          g.setAttribute("transform", `translate(${m[1]}, ${m[2]})`);
          // Remove the style transform, keep other styles if any
          const cleaned = style
            .replace(
              /transform:\s*translateX\([^)]+\)\s*translateY\([^)]+\);?\s*/g,
              ""
            )
            .trim();
          if (cleaned) {
            g.setAttribute("style", cleaned);
          } else {
            g.removeAttribute("style");
          }
        }
      }

      // Tighten viewBox and add width/height
      tightenViewBox(dom);

      // Ensure XML namespace
      let svgContent = svgElement.outerHTML;
      if (!svgContent.includes('xmlns="http://www.w3.org/2000/svg"')) {
        svgContent = svgContent.replace(
          "<svg",
          '<svg xmlns="http://www.w3.org/2000/svg"'
        );
      }

      const filename = `structure-${Date.now()}.svg`;
      fs.writeFileSync(filename, svgContent, "utf8");

      console.log(
        `✅ Structural blueprint rendered successfully -> ${filename}`
      );
    },
    (err) => {
      console.error(
        "❌ Extraction parsing failed due to chemical formula anomalies:",
        err
      );
      process.exit(1);
    }
  );
} catch (error) {
  console.error(
    "❌ Severe runtime drawing engine failure:",
    error.message || error
  );
  process.exit(1);
}

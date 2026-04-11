{
  description = "🔮 Digital knowledge tree of AshGrey";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      # Define the systems you want to support
      allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      
      # A helper function to generate the shell for each system
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      packages = forAllSystems ({ pkgs }: {
        handbook = pkgs.writeShellApplication {
          name = "handbook";
          runtimeInputs = [ pkgs.cue pkgs.yq-go pkgs.typst pkgs.typstyle ];
          text = ''
            # Define workspace root (relative to where flake is)
            WORKSPACE_ROOT=$(pwd)
            BUILD_DIR="$WORKSPACE_ROOT/build"

            # Create build directory if it doesn't exist
            mkdir -p "$BUILD_DIR"

	          echo "→ Searching for Makefile symlink directory ..."

            # Find directories containing a Makefile that is symlink (-L follows
            # but we want to check the link itself). We use -xtype l to find
            # files that are symlinks
            find . -name "Makefile" -type l | while read -r makefile_path; do
              dir=$(dirname "$makefile_path")
              echo "  → Found symlink Makefile in: $dir"

              # Move into the directory
              pushd "$dir" > /dev/null

              echo "    → Running 'make clean' ..."
              make clean > /dev/null
              echo "    → Running 'make handbook' ..."
              if make handbook >/dev/null 2>&1; then
                # Assuming the compiled book is a PDF, we copy any pdf found in
                # that directory to our external build folder.
                find . -maxdepth 1 -name "*.pdf" -exec cp {} "$BUILD_DIR/" \;
                echo "    → Compiled book copied to build/"
              else
                echo "    x Make failed in $dir"
              fi

              popd > /dev/null
            done
          '';
        };
        clean = pkgs.writeShellApplication {
          name = "clean";
          text = ''
	          echo "→ Cleaning up build directory"
            if ls build/ >/dev/null 2>&1; then
              rm -rf build
              echo "✅ clean successfully"
            else
              echo "❌ failed to clean because there are no matched files"
            fi
          '';
        };
      });

      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            cue
            yq-go
            typst
            typstyle
          ];

          shellHook = ''
            echo "→ Environment has been set up"
            cue version
            yq --version
            typst --version
            typstyle --version
          '';
        };
      });
    };
}
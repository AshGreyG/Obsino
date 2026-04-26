---
name: create-pr
description: >-
  Generate and create a pull request from a branch to master. Use when the user
  says "create a PR", "make a pull request", "open a PR", or references
  generating a PR from the current branch. Accepts an optional branch name as
  argument (e.g., "/create-pr my-branch"), otherwise uses the current branch.
---

# Create Pull Request

Generate a PR from a branch to `master` following the project's PR template at
`.github/PULL_REQUEST_TEMPLATE.md`. Derives the summary, type of change, and
file list from the commit log and diff between the branch and master.

## Workflow

### 1. Determine the branch

If an argument was provided, use it as the branch name. Otherwise, detect the
current branch with `git rev-parse --abbrev-ref HEAD`.

Validate that the branch exists locally (or remotely with `git branch -r`).

### 2. Gather information

Run these commands in parallel to collect PR context:

```bash
# Recent commits on the branch not in master
git log master..<branch> --oneline --no-decorate

# Summary of changed files
git diff master..<branch> --stat

# Full diff stat showing added/removed lines
git diff master..<branch> --numstat

# List of changed files (for the PR template)
git diff master..<branch> --name-only

# PR template content (already known from .github/PULL_REQUEST_TEMPLATE.md)
```

### 3. Categorize the PR

Analyze the commit messages to determine the PR type. Commits in this project
use the format `:<emoji>: <type>(<scope>): <message>`.

Map commit types to PR template checkboxes:

| Commit `type`    | Template checkbox |
| ---------------- | ----------------- |
| `feat`           | `feat`            |
| `fix`            | `fix`             |
| `docs`           | `docs`            |
| `style`          | `style`           |
| `refactor`       | `refactor`        |
| `test`           | `test`            |
| `chore`, `build` | `chore`           |

If the branch name contains a directory path (e.g.,
`biology/molecular-biology`), auto-detect the relevant course/directory
checkboxes.

Emoji lists for specific domain:

| Emoji name      | Specific domain                 |
| --------------- | ------------------------------- |
| :dna:           | biochemistry, molecular-biology |
| :pill:          | pharmacy/..                     |
| :space_invader: | physics/..                      |
| :chess_pawn:    | algorithm                       |

Here `pharmacy/..` represents for subfield of pharmacy like pharmaceutics etc.

### 4. Generate the PR body

Create a PR description following the template structure:

```markdown
## Summary

<Concise summary derived from commit messages — 1-3 sentences about what
this PR does and why.>

## Type of Change

- [<x or space>] `<type>` - <description>

## Course/Directories Affected

- [<x or space>] <course>
  - [<x or space>] <subject>
    - [<x or space>] <subcategory>

## Files Changed

\`\`\`bash
<list of changed files>
\`\`\`

## Testing

- [x] Code runs without errors
- [ ] Files in `src` directory can run successfully
- [ ] Run `nix .#clean` and `nix .#handbook` successfully at local environment

## Checklist

- [x] My code follows the project's style guidelines (see `.editorconfig`, `.prettierrc`)
- [x] I have performed a self-review of my code
- [ ] I have commented my code where necessary
- [ ] I have updated the documentation (if applicable)
- [x] My changes generate no new warnings
- [ ] I have tested my changes locally
```

### 5. Show and confirm

Present the generated PR body to the user. Include the PR title (derived from
the first line of the most significant commit, or a summary of the branch).

Ask whether they want to:

- Create the PR as-is
- Edit the title or body
- Cancel

### 6. Create the PR

If confirmed, push the branch (if not already pushed) and create the PR:

```bash
gh pr create \
  --title "<PR title>" \
  --body "<PR body>" \
  --base master
```

Report the PR URL to the user when done.

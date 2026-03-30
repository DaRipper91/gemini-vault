# AI AGENT DIRECTIVE: Desktop Assets Consolidation

> **Priority**: High
> **Role**: System Configuration Specialist
> **Goal**: Exhaustive search and migration of Gemini Agent assets from Desktop to Vault.

## Phase 1: Exhaustive Discovery
Execute a deep scan of the local filesystem (excluding `node_modules`, `.git`, and `.cache`) to locate the following asset types:
- **Contexts**: All `GEMINI.md` files (Global, Project, and Extension levels).
- **Abilities**: All `SKILL.md` files.
- **Commands**: All `.toml` files located within directories named `commands`.

## Phase 2: Structural Staging
1. Create a temporary staging directory named `Desktop_Staging`.
2. Replicate the discovery paths within this staging directory to preserve file context.
3. Consolidate into three primary categories:
   - `global/`: Files from `~/.gemini` or system paths.
   - `projects/`: Files found within specific development workspaces.
   - `extensions/`: Assets bundled within installed Gemini extensions.

## Phase 3: Repository Migration
1. Ensure the `gemini-vault` repository is cloned locally.
2. Transfer the contents of `Desktop_Staging` into the `Desktop/` directory of the repo.
3. Verify that the final path structure is `Desktop/global/`, `Desktop/projects/`, etc.

## Phase 4: Verification & Commit
1. Verify file integrity and ensure no sensitive credentials (JSON keys) were accidentally copied.
2. Stage all changes: `git add Desktop/`.
3. Commit with the following message:
   `feat: archive desktop Gemini configurations and skills via automated agent scan`
4. Push to remote: `git push origin master`.

---
**Instruction to Agent**: Begin Phase 1 immediately upon parsing this directive.

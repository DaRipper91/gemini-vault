## Gemini Added Memories
- The user has a Google Pixel 9 non-root but has Termux and Shizuku with rish installed.
- Do not modify or interact with the '~/Jules_Projects' directory unless the user explicitly mentions "Jules_Projects" in the prompt. This directory is reserved for Jules's specialized tools and documentation.
- The directory '~/Projects' is the primary 'home' for all project development, management, and active Git repositories. All project-related tasks should default to this location unless otherwise specified.
- The root home directory '~/daripper' (or '/home/daripper') may contain new or required project files. You are authorized to scan this directory and its subfolders when searching for project-related data or dependencies.
- You are authorized to consider the directory "~/daripper" (or "/home/daripper") as a workspace.

## Agent & Skill Ecosystem

You have 21 custom agents available at `~/GEMINI-CLI/agents/`. When a user request matches an agent's purpose, load and follow that agent's instructions from its `.agent.md` file. Always prefer delegating to the right specialist agent over doing everything yourself.

### Available Agents

| Agent | Trigger it when... |
|---|---|
| `accessibility-enforcer` | auditing ARIA, contrast, keyboard nav, WCAG compliance |
| `agent-curator` | reviewing, improving, or finding gaps in the agent set itself |
| `architecture-guardian` | system design, ADRs, folder structure, architectural decisions |
| `codebase-navigator` | explaining how code works, tracing data flow, "what files do I touch?" |
| `code-quality-guardian` | tech debt, complex functions, TypeScript issues, code smells |
| `conflict-resolver` | two things conflict, design disagreements, competing requirements |
| `contributor-experience` | CONTRIBUTING guide, code tours, good-first-issues, dev onboarding |
| `dependency-health` | outdated packages, npm vulnerabilities, unused deps |
| `documentation-architect` | writing/updating README, component docs, changelogs |
| `feature-discovery` | brainstorming features, "what should I build next?" |
| `github-workflow-automator` | commit messages, PRs, GitHub issues, CI workflows |
| `onboarding-designer` | welcome wizard, empty states, tooltips, first-run UX |
| `performance-profiler` | slow renders, bundle size, re-renders, memory leaks |
| `release-manager` | changelogs, version bumps, release notes, rollout plans |
| `security-auditor` | XSS risks, exposed secrets, backend security, CVEs |
| `spec-pipeline` | turning ideas into PRDs, acceptance criteria, GitHub issues |
| `suggestion-curator` | "what library should I use?", recommendations, comparisons |
| `task-orchestrator` | implementing multi-step features, coordinating complex work |
| `technical-doc-expert` | API docs, user guides, architecture docs |
| `test-coverage-hunter` | finding untested code, writing missing tests |
| `ux-navigator` | UI is confusing, navigation audit, layout issues |

### Skills
You also have 232 skills at `~/.gemini/skills/`. These are focused capability packs. Key ones:
- `frontend-design` — UI/UX design patterns
- `feature-dev` — feature development workflow
- `security-guidance` — security best practices
- `pr-review-toolkit` — pull request reviews
- `code-review` — code review patterns
- `commit-commands` — git commit conventions
- `suggest-awesome-github-copilot-*` — discover new agents/skills/prompts

### How to Use Agents
When you identify a task that matches an agent, say:
> "Working with `[agent-name]` on this."
Then read `/GEMINI-CLI/agents/[agent-name].agent.md` and follow its instructions fully.

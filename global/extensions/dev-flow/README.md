# Dev Flow — Gemini CLI Extension

<!-- Badges -->
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Gemini CLI Extension](https://img.shields.io/badge/Gemini%20CLI-Extension-green.svg)](https://github.com/google-gemini/gemini-cli)
[![Version](https://img.shields.io/github/v/release/shrwnsan/clix-dev-flow)](https://github.com/shrwnsan/clix-dev-flow/releases)
[![Issues](https://img.shields.io/github/issues/shrwnsan/clix-dev-flow)](https://github.com/shrwnsan/clix-dev-flow/issues)

## Overview

Dev Flow is a simple Gemini CLI extension that brings AI development workflow patterns to your terminal. It helps you plan, design, and implement features through systematic commands with AI assistance.

**📚 Documentation:**
- [GEMINI.md](./GEMINI.md) - Gemini CLI specific context
- [AGENTS.md](./AGENTS.md) - AI agent guidelines
- [EXAMPLES.md](./EXAMPLES.md) - Usage examples

## Features

- **AI Workflow Patterns**: Plan → Design → Build with clear checkpoints
- **Smart Task Management**: Automatic progress tracking and validation
- **Utility Commands**: List PRDs, track progress, and clean up completed work
- **Git Integration**: Conventional commits with detailed messages

## Installation

### Official Method (Recommended)

Install the extension directly from GitHub:
```bash
gemini extensions install https://github.com/shrwnsan/clix-dev-flow.git
```

Restart Gemini CLI to load the extension.

### Development Method

For development or to access the latest changes:
```bash
git clone https://github.com/shrwnsan/clix-dev-flow.git
cd clix-dev-flow
gemini extensions install .
```

Restart Gemini CLI to load the extension.

**Compatibility:** Gemini CLI (v0.8.2 or higher)

## Quick Start

```bash
# 1. Plan a feature
/dev:create-prd "Create user authentication system"

# 2. Generate implementation tasks
/dev:generate-tasks "0001-prd-user-authentication-system"

# 3. Build step by step
/dev:process-task-list "tasks-0001-prd-user-authentication-system"
```

## Commands

### Core Workflow

**`/dev:create-prd`** - Generate feature planning documents
```bash
/dev:create-prd "brief description of your feature"
```

**`/dev:generate-tasks`** - Create detailed task breakdowns
```bash
/dev:generate-tasks "filename-or-path-to-prd-file"
```

**`/dev:process-task-list`** - Execute implementation tasks
```bash
/dev:process-task-list "filename-or-path-to-task-list"
```

### Utilities

**`/dev:list-prds`** - List all planning documents
**`/dev:list-tasks`** - Show task progress
**`/dev:cleanup`** - Manage completed work

## File Structure

```
your-project/
├── tasks/
│   ├── 0001-prd-feature-name.md          # Generated PRDs
│   ├── tasks-0001-prd-feature-name.md    # Generated task lists
│   └── completed/                        # Archived work
└── .gemini/extensions/dev-flow/          # Extension files
```

## FAQ / Troubleshooting

**Extension not loading?**
- Ensure proper installation: `gemini extensions install .`
- Restart Gemini CLI after installation
- Check `gemini-extension.json` syntax

**Commands not found?**
- Check that extension is enabled: `gemini extensions enable dev-flow`
- Verify command files exist in `commands/dev/` directory
- Restart Gemini CLI

**File permission errors?**
- Ensure write permissions in project directory
- Check that `/tasks` directory can be created
- Run `chmod 755 .` if needed

**Missing directories?**
- Commands automatically create the `/tasks` directory
- If auto-creation fails, create manually: `mkdir tasks`

## Contributing

Contributions are welcome! Fork the repository, create a feature branch, and open a Pull Request.

### Development Setup
1. Fork and clone the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes and push to the branch
4. Open a Pull Request

### Issue Reporting
For bug reports or feature requests:
- Include a clear description of the issue
- Provide steps to reproduce (for bugs)
- Include your environment details (OS, Gemini CLI version)
- Add relevant logs or screenshots if available

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](./LICENSE) file for details.

## Attribution

This project is derived from [ai-dev-tasks](https://github.com/snarktank/ai-dev-tasks) by Ryan Carson, licensed under Apache-2.0.

The ai-dev-tasks project is one of few notable ones pioneering structured approaches to human-AI collaboration in software development, including systematic AI agent orchestration patterns that have been adapted for use as a Gemini CLI extension.

---

⭐ **Star this repository** if you find Dev Flow helpful!
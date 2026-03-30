# AI Agent Guidelines

This document provides essential guidelines for AI agents working with the Dev Flow extension project development and maintenance.

**Purpose:** This file documents how AI agents should interact with and contribute to this Dev Flow project itself (development, documentation, code reviews, etc.).

**Extension Version:** 1.1.0

**Related Documentation:**
- [GEMINI.md](./GEMINI.md) - Gemini CLI extension context (loaded automatically by Gemini CLI)
- [README.md](./README.md) - User-facing documentation and command reference

## Project Structure

```
dev-flow/
├── README.md                    # User-facing documentation
├── AGENTS.md                    # This file - AI agent guidelines
├── GEMINI.md                    # Gemini CLI extension context
├── EXAMPLES.md                  # Usage examples
├── CHANGELOG.md                 # Version history
├── NOTICE                       # Attribution notice
├── gemini-extension.json        # Extension configuration
├── commands/dev/                # Command definitions (.toml files)
└── tasks/                       # Created during runtime (not tracked)
```

## Core Extension Workflow

The Dev Flow extension follows a simple three-step process for users:

1. **Plan** (`/dev:create-prd`) - Generate feature planning documents
2. **Design** (`/dev:generate-tasks`) - Create task breakdowns
3. **Build** (`/dev:process-task-list`) - Execute implementation

## Agent Guidelines for Project Work

### When Contributing to This Project
- Focus on maintaining simplicity - this is intentionally a lightweight CLI extension
- Keep documentation clear and concise
- Test changes thoroughly before committing
- Follow established patterns in the codebase

### Documentation Updates
- Update README.md for user-facing changes
- Update GEMINI.md for extension context changes
- Update AGENTS.md when changing how agents should work with the project
- Keep CHANGELOG.md updated with version changes

### Code Reviews and Development
- Prioritize user experience and simplicity
- Ensure commands work reliably across different environments
- Test with actual Gemini CLI installation when possible
- Verify documentation accuracy after changes

## Best Practices

### When Creating PRDs
- Focus on clear, measurable requirements
- Include acceptance criteria
- Consider edge cases and error scenarios

### When Generating Tasks
- Break features into logical, sequential steps
- Ensure tasks are actionable and testable
- Include verification steps

### During Implementation
- Follow task sequences precisely
- Verify completion before proceeding
- Handle errors constructively
- Maintain clear communication

## Common Issues

**Missing directories**: Automatically create `/tasks` directory
**File creation failures**: Provide clear error messages and retry
**Stream processing**: Handle incomplete responses gracefully

## File Structure

```
your-project/
├── tasks/
│   ├── 0001-prd-feature-name.md          # Generated PRDs
│   ├── tasks-0001-prd-feature-name.md    # Generated task lists
│   └── completed/                        # Archived work
└── .gemini/extensions/dev-flow/          # Extension files
```

---

**File Purpose Clarification:**
- **GEMINI.md**: Provides context to Gemini CLI about the extension's functionality (loaded automatically)
- **AGENTS.md**: Guidelines for AI agents working on this project's development and maintenance
- **README.md**: User-facing documentation for installing and using the extension
- **EXAMPLES.md**: Comprehensive usage examples and real-world scenarios

This project aims to provide a simple, structured development workflow while maintaining clarity and ease of use. Focus on simplicity and reliability in all contributions.
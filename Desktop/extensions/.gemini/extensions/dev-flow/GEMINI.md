# Dev Flow Extension

A Gemini CLI extension that brings structured development workflow to your terminal, providing systematic feature development with AI assistance.

**Version:** 1.1.0 | **Compatibility:** Gemini CLI (v0.8.2 or higher)

## Overview

This extension streamlines AI-assisted development workflows through structured feature planning, detailed design, and implementation processes. It helps you move from concept to completion with clear, actionable steps.

**Related Documentation:**
- [README.md](./README.md) - Comprehensive user guide and command reference
- [AGENTS.md](./AGENTS.md) - AI agent guidelines and development patterns

## Quick Start

### Installation
```bash
gemini extensions install `<path-to-this-extension>`
```

### Basic Workflow
1. **Plan a Feature**: Generate comprehensive feature planning
   ```bash
   /dev:create-prd "Create user authentication system"
   ```

2. **Design Tasks**: Break down the feature into detailed implementation steps
   ```bash
   /dev:generate-tasks "0001-prd-user-authentication-system"
   ```

3. **Build Implementation**: Execute the planned implementation
   ```bash
   /dev:process-task-list "tasks-0001-prd-user-authentication-system"
   ```

## Commands

### `/dev:create-prd`
Generate comprehensive Product Requirements Documents for new features.

**Usage:**
```bash
/dev:create-prd "brief description of your feature"
```

**Features:**
- Asks clarifying questions to understand requirements
- Generates a detailed PRD with user stories, technical requirements, and acceptance criteria
- Saves the PRD as `[n]-prd-[feature-name].md` in the `/tasks` directory

### `/dev:generate-tasks`
Create detailed task breakdowns from existing PRDs.

**Usage:**
```bash
/dev:generate-tasks "path-to-prd-file"
```

**Features:**
- Analyzes the PRD and current codebase
- Generates high-level tasks and waits for your confirmation ("Go")
- Creates detailed sub-tasks with file recommendations
- Saves as `tasks-[prd-file-name].md` in the `/tasks` directory

### `/dev:process-task-list`
Execute implementation tasks step by step.

**Usage:**
```bash
/dev:process-task-list "path-to-task-list"
```

**Features:**
- Works through tasks one at a time
- Waits for your approval before moving to the next task
- Marks completed tasks and commits changes
- Handles testing and validation

## File Structure

The extension creates and manages files in this structure:

```
your-project/
├── tasks/
│   ├── 0001-prd-feature-name.md          # Generated PRDs
│   ├── 0002-prd-another-feature.md
│   ├── tasks-0001-prd-feature-name.md    # Generated task lists
│   └── tasks-0002-prd-another-feature.md
└── .gemini/extensions/dev-flow/      # Extension files
```

## Best Practices

### For PRD Generation
- Provide clear, concise feature descriptions
- Answer clarifying questions thoroughly
- Consider edge cases and error scenarios
- Define measurable success criteria

### For Task Creation
- Review generated high-level tasks before proceeding
- Ensure task dependencies make sense
- Consider your existing codebase patterns
- Plan for testing and validation

### For Implementation
- Work through tasks sequentially
- Review each sub-task before approving
- Test changes before committing
- Keep communication clear with the AI

## Error Handling

### Common Issues and Solutions

**Missing /tasks directory**
- The extension automatically creates this directory
- If permissions issues occur, create it manually: `mkdir tasks`

**File naming conflicts**
- The extension uses zero-padded 4-digit numbering (0001, 0002, etc.)
- Existing files are automatically skipped

**Command not found**
- Ensure the extension is properly installed
- Restart Gemini CLI after installation
- Check that command files exist in `commands/dev/`

**Stream processing errors**
- Try the command again if it fails
- Check file permissions in your project directory
- Ensure sufficient disk space is available

## Advanced Features

### Utility Commands

#### `/dev:list-prds`
List all available PRDs with their status.

**Features:**
- Shows all PRDs in `/tasks` directory
- Indicates whether task lists exist
- Displays brief summaries
- Interactive options for next steps

#### `/dev:list-tasks`
Show task progress and completion status.

**Features:**
- Displays progress percentages for all active features
- Shows completed, in-progress, and pending tasks
- Identifies abandoned or blocked tasks
- Overall project progress summary

#### `/dev:cleanup`
Manage and organize completed work.

**Features:**
- Identifies completed features for archiving
- Finds orphaned files and abandoned tasks
- Safe deletion with confirmations
- Archive structure for completed work

### Customization

You can customize the workflow by:
- Modifying the prompt templates in `commands/dev/`
- Adding industry-specific PRD templates
- Configuring git integration settings
- Setting up custom test frameworks

## Development Guidelines

### File Organization
- PRDs use format: `[n]-prd-[feature-name].md`
- Task lists use format: `tasks-[prd-file-name].md`
- All files are stored in the `/tasks` directory
- Use descriptive feature names in filenames

### Git Integration
The extension automatically:
- Commits completed parent tasks
- Uses conventional commit format
- Includes detailed commit messages
- References task numbers and PRD context

### Testing Integration
Supports various test frameworks:
- Jest (JavaScript/TypeScript)
- Pytest (Python)
- Rails test (Ruby)
- And others via configuration

## Troubleshooting

### Extension Loading Issues
1. Verify `gemini-extension.json` syntax
2. Check file permissions
3. Ensure proper directory structure
4. Restart Gemini CLI

### Command Execution Problems
1. Verify command files exist in `commands/dev/`
2. Check TOML file syntax
3. Ensure proper file paths
4. Review error messages for guidance

### File System Errors
1. Check directory permissions
2. Ensure sufficient disk space
3. Verify file naming conventions
4. Create missing directories manually

## Error Recovery

If a command fails:
1. Check the error message for specific guidance
2. Verify file paths and naming conventions
3. Use utility commands to assess current state
4. Restart the workflow from the last successful step

## Contributing

When contributing to this extension:
1. Follow established patterns and conventions
2. Maintain consistency with existing code style
3. Update documentation for any changes
4. Test thoroughly before submitting

## License

This project is licensed under the Apache License 2.0, maintaining compatibility with structured development workflows and Ryan Carson's original ai-dev-tasks concept.

## Support

For issues, questions, or feature requests:
- Check the troubleshooting section above
- Open an issue on the GitHub repository
- Review the command documentation in `commands/dev/`

---

**Note**: This extension is designed to augment, not replace, good development practices and human judgment. Always review AI-generated code and decisions before implementing them in production.

## Related Documentation

- [README.md](./README.md) - Complete user guide and command reference
- [AGENTS.md](./AGENTS.md) - AI agent guidelines and development patterns
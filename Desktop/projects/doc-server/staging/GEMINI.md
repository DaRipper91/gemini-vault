# Workspace Overview: DA-OMNI-SCOUT COMMAND CENTER

This directory serves as the primary workspace for a highly customized, AI-native developer environment. It is optimized for autonomous system reconnaissance, documentation synthesis, and cross-platform development (x86_64, ARM64, and Android).

## Core Architecture
The environment is powered by the **DA-OMNI-SCOUT ENGINE**, which integrates the Gemini CLI with custom Fish shell automation to create a recursive intelligence layer for the system.

### Key Components
- **Gems (`~/ops/gems/`):** Specialized markdown files that define AI personas (System Prompts). 
    - `scout.md`: The flagship reconnaissance engine.
- **Fish Config (`~/Projects/fish-config/`):** The source of truth for the shell environment, providing high-signal terminal tools.
- **Hardware Registry:** The workspace manages a heterogeneous mesh of devices:
    - **Anchor:** HP EliteDesk (x86_64) for high-bandwidth I/O.
    - **Controller:** Pixel 9 (Android) for restricted, battery-efficient operations.

## Common Operations

### AI & Documentation Commands
- **`dagem <gem_name> "<prompt>"`**: Invokes a specific persona from `~/ops/gems/` with a user prompt. It handles background execution, provides a "Thinking..." spinner, and logs history to `~/ops/archive/raw/chat_history.jsonl`.
- **`scout`**: Executes the `Da-Omni-Scout Engine` to generate "8-5-4" manuals for any given subject.
- **`da-index.fish` / `da-stats.fish`**: Custom scripts for indexing and analyzing the workspace state.

### 8-5-4 Documentation Standard
Every manual generated within this workspace strictly adheres to the following hierarchy:
1. **Tier 8 (Core Patterns):** 8 essential usage patterns for reliability and speed.
2. **Tier 5 (Dev-Level Flags):** 5 flags for debugging, profiling, or socket binding.
3. **Tier 4 (Scout Weapons):** 4 obscure flags or complex pipes for maximum efficiency.

## Development Conventions
- **Fish Shell First:** All automation must be implemented as Fish shell functions or scripts (`.fish`).
- **Zero-Trust Posture:** All communications should be conceptualized within a Tailscale (WireGuard) 100.x.y.z subnet.
- **Multi-Arch Awareness:** Code and documentation must account for behavioral differences between x86_64, ARM64, and Android architectures.
- **Gem-Driven Personas:** AI behavior is strictly defined via markdown "Gems" rather than ad-hoc system prompts.

## Key Files & Directories
- `package.json`: Manages specialized tools like `@google/jules`.
- `llama.cpp/`: Local LLM inference and development.
- `Projects/Starship-Command/`: Primary repository for starship-themed command interfaces.
- `adb_commands.md` / `adb_helper.py`: Resources for Android device interaction and flashing.

## Current Objectives
- We are now going to start cleaning up the filesystem on this machine.

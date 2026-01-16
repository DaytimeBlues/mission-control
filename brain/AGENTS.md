# Agent Conventions

## Code Style
- **Language**: Dart 3.x
- **Framework**: Flutter 3.x
- **Linter**: `flutter_lints` (strict)
- **State Management**: Riverpod 2.x (Code Generation preferred)
- **Architecture**: Feature-First (Domain-Driven Design)
- **Naming**: `snake_case` for files, `PascalCase` for classes, `camelCase` for variables.

## Communication Protocol
- **Artifacts**: The primary medium for memory and planning.
- **Thought Signatures**: Agents must "sign" their complex reasoning in artifacts.
- **User Gates**: All destructive or high-risk actions require user approval.

## Agent Boundaries
- **Planner**: Read-only access to code. Owns `plan.md` and `spec.md`.
- **Builder**: Write access to `apps/` and `packages/`. Updates `plan.md`.
- **Tester**: Verification only. Owns `test/` directories and report artifacts.

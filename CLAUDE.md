# ai-skills

This repository contains reusable AI skills following the Agent Skills open standard.

Skills are in `skills/<name>/SKILL.md`. Each skill has YAML frontmatter with `name` and `description`.

When modifying skills:
- Keep SKILL.md under 500 lines
- Put detailed references in `references/` subdirectory
- The `name` field must match the parent directory name
- Test with both Claude Code and Codex CLI

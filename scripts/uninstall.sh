#!/usr/bin/env bash
set -euo pipefail

# ai-skills uninstaller
# Removes symlinks created by install.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$REPO_DIR/skills"

echo "=== ai-skills uninstaller ==="

for skill_dir in "$SKILLS_DIR"/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name="$(basename "$skill_dir")"

    for target_dir in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
        target="$target_dir/$skill_name"
        if [ -L "$target" ]; then
            rm "$target"
            echo "  [removed] $target"
        fi
    done
done

# Remove command aliases
for alias in "$HOME/.claude/commands/전문가소환.md" "$HOME/.claude/commands/prompt-forge.md"; do
    if [ -L "$alias" ]; then
        rm "$alias"
        echo "  [removed] $alias"
    fi
done

echo "=== Uninstall complete ==="

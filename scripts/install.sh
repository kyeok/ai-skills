#!/usr/bin/env bash
set -euo pipefail

# ai-skills installer
# Symlinks skills into Claude Code and Codex CLI directories

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_DIR="$REPO_DIR/skills"

CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
CODEX_SKILLS_DIR="$HOME/.agents/skills"

# Also support Claude Code legacy commands (for slash command aliases)
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"

echo "=== ai-skills installer ==="
echo "Source: $SKILLS_DIR"
echo ""

install_skills() {
    local target_dir="$1"
    local tool_name="$2"

    mkdir -p "$target_dir"

    for skill_dir in "$SKILLS_DIR"/*/; do
        [ -d "$skill_dir" ] || continue
        skill_name="$(basename "$skill_dir")"
        target="$target_dir/$skill_name"

        if [ -L "$target" ]; then
            echo "  [update] $skill_name -> removing old symlink"
            rm "$target"
        elif [ -d "$target" ]; then
            echo "  [skip] $skill_name -> directory exists (not a symlink, skipping)"
            continue
        fi

        ln -s "$skill_dir" "$target"
        echo "  [link] $skill_name -> $target"
    done

    echo "  Done ($tool_name)"
    echo ""
}

# Install command aliases for Claude Code (전문가소환 -> expert-panel)
install_command_aliases() {
    mkdir -p "$CLAUDE_COMMANDS_DIR"

    # 전문가소환 alias -> expert-panel SKILL.md
    local alias_file="$CLAUDE_COMMANDS_DIR/전문가소환.md"
    if [ -L "$alias_file" ]; then
        rm "$alias_file"
    fi
    if [ ! -f "$alias_file" ]; then
        ln -s "$SKILLS_DIR/expert-panel/SKILL.md" "$alias_file"
        echo "  [alias] /전문가소환 -> expert-panel"
    fi

    # prompt-forge alias
    local alias_file2="$CLAUDE_COMMANDS_DIR/prompt-forge.md"
    if [ -L "$alias_file2" ]; then
        rm "$alias_file2"
    fi
    if [ ! -f "$alias_file2" ]; then
        ln -s "$SKILLS_DIR/prompt-forge/SKILL.md" "$alias_file2"
        echo "  [alias] /prompt-forge -> prompt-forge"
    fi

    echo "  Done (command aliases)"
    echo ""
}

echo "[1/3] Installing for Claude Code..."
install_skills "$CLAUDE_SKILLS_DIR" "Claude Code"

echo "[2/3] Installing for Codex CLI..."
install_skills "$CODEX_SKILLS_DIR" "Codex CLI"

echo "[3/3] Installing command aliases..."
install_command_aliases

echo "=== Installation complete ==="
echo ""
echo "Usage:"
echo "  Claude Code: /전문가소환 [topic]  or  /prompt-forge [topic]"
echo "  Codex CLI:   Skills auto-discovered from ~/.agents/skills/"

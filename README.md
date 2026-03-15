# ai-skills

Evidence-based AI skills for Claude Code and Codex CLI.

## Skills

| Skill | Command | Description |
|-------|---------|-------------|
| [expert-panel](skills/expert-panel/) | `/전문가소환` | Evidence-based expert panel discussion (EBP approach) |
| [prompt-forge](skills/prompt-forge/) | `/prompt-forge` | Expert prompt engineer using 7-step pipeline |

## Installation

```bash
git clone https://github.com/harleykim/ai-skills.git
cd ai-skills
chmod +x scripts/install.sh
./scripts/install.sh
```

This creates symlinks in:
- `~/.claude/skills/` (Claude Code)
- `~/.agents/skills/` (Codex CLI)
- `~/.claude/commands/` (slash command aliases)

## Uninstall

```bash
./scripts/uninstall.sh
```

## Compatibility

Built on the [Agent Skills Open Standard](https://agentskills.io).

| Tool | Status |
|------|--------|
| Claude Code | Supported |
| Codex CLI | Supported |
| Other Agent Skills-compatible tools | Should work |

## Structure

```
ai-skills/
├── skills/
│   ├── expert-panel/       # /전문가소환
│   │   ├── SKILL.md
│   │   └── references/
│   └── prompt-forge/       # /prompt-forge
│       ├── SKILL.md
│       └── references/
├── scripts/
│   ├── install.sh
│   └── uninstall.sh
├── CLAUDE.md
├── AGENTS.md
└── README.md
```

## Adding a New Skill

1. Create `skills/<skill-name>/SKILL.md` with required frontmatter
2. Add `references/` subdirectory if needed
3. Run `./scripts/install.sh` to symlink
4. Skill name in frontmatter must match directory name

## License

MIT

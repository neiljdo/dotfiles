# Claude Code Setup Guide

> Companion to `README.md`. Covers CLI installation, dotfiles integration,
> settings structure, statusline, and cmux workspace config.

---

## 1. Installation

Use the **native installer** — not Homebrew. Claude Code manages its own update lifecycle
and plugin/MCP ecosystem internally.

```bash
curl -fsSL https://claude.ai/install.sh | bash
exec -l $SHELL   # restart shell to pick up PATH changes
```

Verify:
```bash
claude --version
```

---

## 2. Dotfiles Integration

The bootstrap script handles all symlinks automatically. To set them up manually:

```bash
ln -sf ~/dotfiles/.claude/settings.user.json    ~/.claude/settings.json
ln -sf ~/dotfiles/.claude/statusline-command.sh ~/.claude/statusline-command.sh
```

---

## 3. Settings Structure

**User-level** (`~/.claude/settings.json` → `dotfiles/.claude/settings.user.json`):
Generic settings shared across all projects — plugins, statusline, effort level, theme,
memory directory. Committed to the public dotfiles repo; must contain no project-specific
or private references.

**Project-level** (`.claude/settings.json` inside a repo):
Per-project overrides — extra marketplaces, project-specific MCP servers, permissions.
Takes precedence over user-level settings. Not committed to dotfiles.

---

## 4. Statusline

The custom statusline script at `~/.claude/statusline-command.sh` displays:

```
user@host | cwd
[wt:name] | branch | model | ctx:Nk (N%) | $cost | 5h:N% (→Xm) | wk:N% (→Xd)
```

- **ctx** — token count (k-formatted) with percentage; color-coded green/yellow/red by threshold
- **5h / wk** — rate-limit usage with reset countdowns; color-coded at 75% (yellow) and 90% (red)
- **[wt:]** — worktree tag suppressed when it duplicates the branch name

Wired up in `settings.user.json`:
```json
"statusLine": {
  "type": "command",
  "command": "bash ~/.claude/statusline-command.sh"
}
```

---

## 5. cmux Integration

Claude Code sessions run inside cmux workspaces. The global cmux config at
`~/.config/cmux/cmux.json` (→ `dotfiles/.config/cmux/cmux.json`) includes:

- **Claude Code integration** enabled (`automation.claudeCodeIntegration: true`)
- **Workspace commands**: `Claude + Dev` (Claude + shell + logs pane layout)
- **Tab bar button**: quick-launch new Claude tab from any workspace

**Manual symlink** (handled by bootstrap):
```bash
ln -sf ~/dotfiles/.config/cmux/cmux.json ~/.config/cmux/cmux.json
```

**Per-project layout** — drop a workspace template into any repo:
```bash
cp ~/dotfiles/.config/cmux/project-template.cmux.json <repo>/.cmux/cmux.json
```

Edit the template to set the correct `cwd` and local dev server URL.

---

## 6. Checklist — New Machine Setup

```
[ ] curl -fsSL https://claude.ai/install.sh | bash
[ ] Bootstrap symlinks (handled by scripts/bootstrap.sh)
[ ] Verify: claude --version
[ ] Verify statusline renders in a session
[ ] For each work project: add extraKnownMarketplaces to .claude/settings.json
```

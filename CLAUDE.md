# CLAUDE.md

A macOS dotfiles repository for a developer workstation. It contains shell configuration, tool settings, and a setup guide — not a software project with build/test commands.

## Key Files

- **`.zshrc`** — Main shell config. Uses Antidote (plugin manager), Starship (prompt), zoxide, fnm, uv, miniforge, and RVM.
- **`.aliases`** — Shell aliases sourced by `.zshrc`. Includes eza/bat/lazygit shortcuts, global pipe aliases (`G`, `L`, `J`, etc.), and per-remote git aliases.
- **`.zsh_plugins.txt`** — Antidote plugin list. After editing, regenerate with: `antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh`
- **`.gitconfig`** — Git identity and delta pager config.
- **`.tmux.conf`** — tmux config. Prefix `C-a`, vim-style pane navigation, macOS clipboard integration.
- **`.finicky.js`** — Browser routing (Finicky). Currently just sets Brave as default.
- **`.config/starship.toml`** — Starship prompt config (currently empty).
- **`.config/karabiner/`** — Karabiner-Elements keyboard remapping configs.
- **`.config/ghostty/config`** — Ghostty terminal config (theme: Gruvbox Dark).
- **`.config/cmux/cmux.json`** — cmux global config. Symlink to `~/.config/cmux/cmux.json`. Includes workspace layout commands, UI presets, and Claude Code integration.
- **`.ssh/config`** — SSH config with OrbStack integration and Ed25519 key setup.
- **`README.md`** — Comprehensive MacBook Pro setup guide covering security, tooling, and environment management.
- **`docs/brave.md`** — Brave browser extension list by category.
- **`scripts/install-brave-extensions.sh`** — Opens all extension install pages in bulk.
- **`.claude/settings.user.json`** — Template for user-level Claude Code settings. Symlink to `~/.claude/settings.json`. Per-project overrides go in `.claude/settings.json` inside a project/repo.
- **`.claude/statusline-command.sh`** — Custom Claude Code statusline script. Displays user@host, cwd, git branch, model, context usage (color-coded), session cost, and rate-limit usage.

## Conventions

- Shell environment targets macOS on Apple Silicon (`/opt/homebrew`).
- Default editor is Cursor.
- Default AI assistant is Claude.
- Default terminal-based editor is Neovim (`$EDITOR=nvim`).
- `eza` replaces `ls` (aliased in `.aliases`).
- `delta` is the git pager.
- Python: `uv` is primary; miniforge/conda only for ML workloads with non-Python binaries.
- Node: `fnm` (not nvm).
- History is configured with `HIST_IGNORE_SPACE` so secrets can be excluded by prefixing with a space.

## Working With This Repo

- No build, lint, or test commands — this is a config-only repo.
- The `.gitignore` covers macOS, VS Code, Windows, and Zsh artifacts.
- Do not commit private keys, secrets, or `.env` files.
- Use scoped [Conventional Commits](https://www.conventionalcommits.org/) for all commit messages (e.g. `feat:`, `fix:`, `chore:`, `docs:`).
- The commit body (when needed) must use a bulleted list with `-` as the bullet character. Each bullet is one concise line (no wrapping prose). Capitalize the first word of each bullet.
- **Before preparing/creating a commit**: review the session for non-obvious patterns, gotchas, or conventions that were discovered or established. Write anything worth preserving to `CLAUDE.md` (project-wide directives) or the appropriate memory file under `.claude/memory/` (user/project/feedback context). Do this *before* staging and committing.

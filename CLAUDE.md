# CLAUDE.md

A macOS dotfiles repository for a developer workstation. It contains shell configuration, tool settings, and a setup guide — not a software project with build/test commands.

## Key Files

- **`.zshrc`** — Main shell config. Uses Antidote (plugin manager), Starship (prompt), zoxide, fnm, uv, miniforge, and RVM. Aliases are sourced from `.aliases`.
- **`.zsh_plugins.txt`** — Antidote plugin list. After editing, regenerate with: `antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh`
- **`.gitconfig`** — Git identity and delta pager config.
- **`.finicky.js`** — Browser routing (Finicky). Currently just sets Brave as default.
- **`.config/starship.toml`** — Starship prompt config (currently empty).
- **`.config/karabiner/`** — Karabiner-Elements keyboard remapping configs.
- **`.ssh/config`** — SSH config with OrbStack integration and Ed25519 key setup.
- **`README.md`** — Comprehensive MacBook Pro setup guide covering security, tooling, and environment management.
- **`.claude/settings.user.json`** — Template for user-level Claude Code settings. Symlink to `~/.claude/settings.json`. Per-project overrides go in `.claude/settings.json` inside a project/repo.

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
- Use [Conventional Commits](https://www.conventionalcommits.org/) for all commit messages (e.g. `feat:`, `fix:`, `chore:`, `docs:`).

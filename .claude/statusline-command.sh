#!/usr/bin/env bash
# Claude Code status line — mirrors a Starship-style prompt
# Input: JSON on stdin from Claude Code

input=$(cat)

user=$(whoami)
host=$(hostname -s)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
# Abbreviate $HOME to ~
cwd="${cwd/#$HOME/\~}"

model=$(echo "$input" | jq -r '.model.display_name // ""')

used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
ctx_part=""
if [ -n "$used" ]; then
  ctx_part=" | ctx:$(printf '%.0f' "$used")%"
fi

# Git branch (no lock files, graceful failure)
branch=""
proj_dir=$(echo "$input" | jq -r '.workspace.project_dir // ""')
if [ -n "$proj_dir" ] && [ -d "$proj_dir/.git" ]; then
  branch=$(GIT_DIR="$proj_dir/.git" git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || true)
  [ -n "$branch" ] && branch=" | $branch"
fi

# Worktree indicator
worktree_name=$(echo "$input" | jq -r '.worktree.name // empty')
worktree_part=""
[ -n "$worktree_name" ] && worktree_part=" [wt:$worktree_name]"

printf "%s@%s %s%s | %s%s%s" \
  "$user" "$host" "$cwd" "$worktree_part" "$model" "$ctx_part" "$branch"

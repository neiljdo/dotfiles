#!/usr/bin/env bash
# Claude Code status line — mirrors a Starship-style prompt
# Input: JSON on stdin from Claude Code

input=$(cat)

user=$(whoami)
host=$(hostname -s)
raw_cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
# Abbreviate $HOME to ~ for display; keep raw_cwd unabbreviated for git lookup
cwd="${raw_cwd/#$HOME/\~}"

model=$(echo "$input" | jq -r '.model.display_name // ""')
# Reasoning effort — absent when the current model doesn't support it (Sonnet 4.5
# pre-4.6, etc.). Values: low / medium / high / xhigh / max / ultra.
effort=$(echo "$input" | jq -r '.effort.level // ""')

used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
used_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')
ctx_part=""
if [ -n "$used_tokens" ]; then
  # Nominal token count, k-formatted (e.g., 25234 → "25k").
  if [ "$used_tokens" -ge 1000 ]; then
    nominal="$((used_tokens / 1000))k"
  else
    nominal="$used_tokens"
  fi
  pct_str=""
  [ -n "$used_pct" ] && pct_str=" ($(printf '%.0f' "$used_pct")%)"
  # Threshold colors are on token count, not percentage:
  #   0-150k green, 150k-300k yellow, 300k+ red.
  if [ "$used_tokens" -ge 300000 ]; then
    color=$'\033[31m'  # red
  elif [ "$used_tokens" -ge 150000 ]; then
    color=$'\033[33m'  # yellow
  else
    color=$'\033[32m'  # green
  fi
  reset=$'\033[0m'
  ctx_part="${color}ctx:${nominal}${pct_str}${reset}"
fi

# Git branch — read from cwd so worktrees pick up their own branch.
# In a worktree, $cwd/.git is a FILE (containing `gitdir: …/.git/worktrees/<name>`);
# in the main checkout it's a DIRECTORY. `-e` matches both; `cd && git` handles
# both transparently because git understands the worktree pointer file.
branch=""
if [ -n "$raw_cwd" ] && [ -e "$raw_cwd/.git" ]; then
  branch=$(cd "$raw_cwd" && git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || true)
fi

# Worktree indicator. Suppress when it duplicates the branch — `claude --worktree`
# names the dir with `+` where the branch uses `/` (e.g. wt `exp+foo` ↔ branch `exp/foo`),
# and after rename they often match outright. Normalize both, drop the tag if equal.
worktree_name=$(echo "$input" | jq -r '.worktree.name // empty')
worktree_part=""
if [ -n "$worktree_name" ]; then
  norm_wt="${worktree_name#worktree-}"
  norm_wt="${norm_wt//+//}"
  if [ "$norm_wt" != "$branch" ]; then
    worktree_part="[wt:$worktree_name]"
  fi
fi

# --- Line 2: session cost + 5h / weekly rate-limit usage (with reset countdowns) ---
# Fields documented at https://code.claude.com/docs/en/statusline.md
# rate_limits.* are populated for Claude.ai subscribers after the first API
# response; absent for API-only users. cost.total_cost_usd is client-estimated.
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')
fh_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
fh_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
wk_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
wk_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

humanize_until() {
  # epoch seconds → "Nm", "NhMm", "NdNh", or "now"
  local target=$1
  [ -z "$target" ] && return
  local now delta days hours mins
  now=$(date +%s)
  delta=$((target - now))
  if [ "$delta" -le 0 ]; then printf "now"; return; fi
  days=$((delta / 86400))
  hours=$(((delta % 86400) / 3600))
  mins=$(((delta % 3600) / 60))
  if [ "$days" -gt 0 ]; then
    printf "%dd%dh" "$days" "$hours"
  elif [ "$hours" -gt 0 ]; then
    printf "%dh%dm" "$hours" "$mins"
  else
    printf "%dm" "$mins"
  fi
}

# Color thresholds for rate-limit usage, mirroring the Claude usage tab
# (green substituted for blue): <50% green, 50-80% yellow, 80%+ red.
pct_color() {
  local pi
  pi=$(printf '%.0f' "$1")
  if [ "$pi" -ge 80 ]; then
    printf '%s' $'\033[31m'
  elif [ "$pi" -ge 50 ]; then
    printf '%s' $'\033[33m'
  else
    printf '%s' $'\033[32m'
  fi
}
ANSI_RESET=$'\033[0m'

line2=""
sep=""
if [ -n "$cost" ]; then
  line2+="${sep}\$$(printf '%.4f' "$cost")"
  sep=" | "
fi
if [ -n "$fh_pct" ]; then
  reset_str=""
  [ -n "$fh_reset" ] && reset_str=" (→$(humanize_until "$fh_reset"))"
  c=$(pct_color "$fh_pct")
  line2+="${sep}${c}5h:$(printf '%.0f' "$fh_pct")%${reset_str}${ANSI_RESET}"
  sep=" | "
fi
if [ -n "$wk_pct" ]; then
  reset_str=""
  [ -n "$wk_reset" ] && reset_str=" (→$(humanize_until "$wk_reset"))"
  c=$(pct_color "$wk_pct")
  line2+="${sep}${c}wk:$(printf '%.0f' "$wk_pct")%${reset_str}${ANSI_RESET}"
fi

# Line 1: user | host | cwd
printf "%s@%s | %s\n" "$user" "$host" "$cwd"

# Line 2: worktree_part | branch | model | ctx_part | line2 (skip empty parts)
parts=()
[ -n "$worktree_part" ] && parts+=("$worktree_part")
[ -n "$branch" ]        && parts+=("$branch")
[ -n "$model" ]         && parts+=("$model")
[ -n "$effort" ]        && parts+=("effort:$effort")
[ -n "$ctx_part" ]      && parts+=("$ctx_part")
[ -n "$line2" ]         && parts+=("$line2")
out=""
for part in "${parts[@]}"; do
  [ -n "$out" ] && out+=" | "
  out+="$part"
done
printf "%s" "$out"

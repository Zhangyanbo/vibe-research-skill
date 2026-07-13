#!/usr/bin/env bash
# Vibe Research — version check (read-only; never modifies anything).
# Compares the locally installed skills against the published versions on GitHub
# and prints a verdict the agent acts on. Networkless / offline runs exit 0 and
# print nothing actionable, so a failed check never blocks research work.
#
# Usage:  bash check-update.sh
# Output: one STATUS line per skill, plus an ACTION line telling the agent what to do.

set -u

REPO_RAW="${VIBE_REPO_RAW:-https://raw.githubusercontent.com/Zhangyanbo/vibe-research-skill/main}"
SKILLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"   # ~/.claude/skills

# semver_cmp A B -> echoes: same | patch | minor | major | unknown
# Classifies the jump needed to go from installed A up to remote B.
semver_cmp() {
  local a="$1" b="$2"
  # strip any pre-release/build suffix ("2.1.0 beta", "2.1.0-rc1" -> "2.1.0")
  a="$(printf '%s' "$a" | grep -oE '^[0-9]+\.[0-9]+\.[0-9]+')"
  b="$(printf '%s' "$b" | grep -oE '^[0-9]+\.[0-9]+\.[0-9]+')"
  if [ -z "$a" ] || [ -z "$b" ]; then echo unknown; return; fi
  IFS=. read -r a1 a2 a3 <<<"$a"
  IFS=. read -r b1 b2 b3 <<<"$b"
  if [ "$b1" -gt "$a1" ]; then echo major; return; fi
  if [ "$b1" -lt "$a1" ]; then echo same; return; fi   # local ahead of remote
  if [ "$b2" -gt "$a2" ]; then echo minor; return; fi
  if [ "$b2" -lt "$a2" ]; then echo same; return; fi
  if [ "$b3" -gt "$a3" ]; then echo patch; return; fi
  echo same
}

# read_version <local_version_file> <remote_path> -> sets LOCAL and REMOTE globals
fetch_pair() {
  local vfile="$1" rpath="$2"
  LOCAL=""; REMOTE=""
  [ -f "$vfile" ] && LOCAL="$(head -n1 "$vfile" | tr -d '[:space:]')"
  REMOTE="$(curl -fsSL --max-time 8 "$REPO_RAW/$rpath" 2>/dev/null | head -n1 | tr -d '[:space:]')"
}

action=""

# --- vibe-research (framework skills): auto-update minor/patch, ASK on major ---
fetch_pair "$SKILLS_DIR/vibe-research/VERSION" "skills/vibe-research/VERSION"
if [ -z "$REMOTE" ]; then
  echo "STATUS vibe-research: check skipped (offline or remote unreachable)"
elif [ -z "$LOCAL" ]; then
  echo "STATUS vibe-research: no local VERSION marker; remote=$REMOTE"
  action="ASK_MAJOR"
else
  jump="$(semver_cmp "$LOCAL" "$REMOTE")"
  echo "STATUS vibe-research: local=$LOCAL remote=$REMOTE jump=$jump"
  case "$jump" in
    minor|patch) action="AUTO" ;;
    major)       action="ASK_MAJOR" ;;
  esac
fi

# --- my-scientific-taste (user-owned): ALWAYS ask before touching ---
fetch_pair "$SKILLS_DIR/my-scientific-taste/VERSION" "skills/my-scientific-taste/VERSION"
taste_action=""
if [ -z "$REMOTE" ]; then
  echo "STATUS my-scientific-taste: check skipped (offline or remote unreachable)"
elif [ -z "$LOCAL" ]; then
  # No marker -> user replaced it with their own taste. Do not offer to overwrite.
  echo "STATUS my-scientific-taste: customized (no VERSION marker); leaving untouched"
else
  jump="$(semver_cmp "$LOCAL" "$REMOTE")"
  echo "STATUS my-scientific-taste: local=$LOCAL remote=$REMOTE jump=$jump"
  case "$jump" in
    minor|patch|major) taste_action="ASK_TASTE" ;;
  esac
fi

# --- verdict ---
if [ "$action" = "AUTO" ]; then
  echo "ACTION AUTO_UPDATE vibe-research: pull latest framework skills and replace them without asking."
elif [ "$action" = "ASK_MAJOR" ]; then
  echo "ACTION ASK_USER vibe-research: a MAJOR update is available; ask the user before updating."
else
  echo "ACTION NONE vibe-research: up to date."
fi
if [ "$taste_action" = "ASK_TASTE" ]; then
  echo "ACTION ASK_USER my-scientific-taste: an update is available; ask the user before touching their taste file."
fi

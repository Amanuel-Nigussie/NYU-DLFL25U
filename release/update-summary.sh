#!/usr/bin/env bash
# Regenerates README.md. A link present = done; empty = pending.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT="$SCRIPT_DIR/README.md"

count_links() {
  local file=$1
  shift
  local count=0
  for label in "$@"; do
    url=$(grep "^- ${label}:" "$file" | sed 's/^[^:]*: *//')
    [[ -n "$url" ]] && ((count++)) || true
  done
  echo $count
}

{
  echo "# Release summary"
  echo ""
  echo "## Usage"
  echo ""
  echo '- `./new-lesson.sh <NN> "<title>"` — create a new lesson file from the template'
  echo '- `./update-summary.sh` — regenerate `README.md`'
  echo ""
  echo "### Example"
  echo ""
  echo '```bash'
  echo './new-lesson.sh 05 "Gradient descent and backpropagation"'
  echo '```'
  echo ""
  echo "| Lesson | Title | Video | Social |"
  echo "|--------|-------|-------|--------|"

  for file in "$SCRIPT_DIR"/lesson-*.md; do
    [[ -f "$file" ]] || continue
    NUMBER=$(basename "$file" | grep -o '[0-9]\+')
    TITLE=$(grep "^# Lesson" "$file" | sed 's/^# Lesson [0-9]*: //')
    VIDEO=$(count_links "$file" "YouTube" "YouTube Short" "Instagram Reel" "TikTok")
    SOCIAL=$(count_links "$file" "Twitter" "Threads" "LinkedIn" "Facebook")
    echo "| ${NUMBER} | ${TITLE} | ${VIDEO}/4 | ${SOCIAL}/4 |"
  done
} > "$OUTPUT"

echo "Updated: $OUTPUT"

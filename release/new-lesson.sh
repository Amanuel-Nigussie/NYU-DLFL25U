#!/usr/bin/env bash
# Usage: ./new-lesson.sh 05 "Your lesson title here"

set -e

NUMBER=$1
TITLE=$2

if [[ -z "$NUMBER" || -z "$TITLE" ]]; then
  echo "Usage: $0 <lesson number> <title>"
  echo "Example: $0 05 \"Gradient descent and backpropagation\""
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE="$SCRIPT_DIR/template.md"
OUTPUT="$SCRIPT_DIR/lesson-${NUMBER}.md"

if [[ -f "$OUTPUT" ]]; then
  echo "File already exists: $OUTPUT"
  exit 1
fi

# Ordinal suffix
num=$((10#$NUMBER))
case $num in
  1)  ORDINAL="First" ;;
  2)  ORDINAL="Second" ;;
  3)  ORDINAL="Third" ;;
  4)  ORDINAL="Fourth" ;;
  5)  ORDINAL="Fifth" ;;
  6)  ORDINAL="Sixth" ;;
  7)  ORDINAL="Seventh" ;;
  8)  ORDINAL="Eighth" ;;
  9)  ORDINAL="Ninth" ;;
  10) ORDINAL="Tenth" ;;
  11) ORDINAL="Eleventh" ;;
  12) ORDINAL="Twelfth" ;;
  *)  ORDINAL="${num}th" ;;
esac

sed \
  -e "s/{{NUMBER}}/${NUMBER}/g" \
  -e "s/{{TITLE}}/${TITLE}/g" \
  -e "s/{{ORDINAL}}/${ORDINAL}/g" \
  -e "s/{{PUNCHLINE}}//g" \
  -e "s/{{YOUTUBE_URL}}//g" \
  "$TEMPLATE" > "$OUTPUT"

echo "Created: $OUTPUT"

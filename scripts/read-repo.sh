#!/usr/bin/env bash
# read-repo.sh <absolute-path> [max-file-size-kb]
# Reads a repo directory and outputs structured text for LLM context injection.
# Usage: bash /home/nhutdev/.openfang/scripts/read-repo.sh /absolute/path/to/repo

REPO_PATH="${1}"
MAX_KB="${2:-50}"
MAX_BYTES=$((MAX_KB * 1024))

if [ -z "$REPO_PATH" ]; then
  echo "Usage: read-repo.sh <absolute-path> [max-file-size-kb]"
  exit 1
fi

if [ ! -d "$REPO_PATH" ]; then
  echo "Error: Directory not found: $REPO_PATH"
  exit 1
fi

echo "=== REPO: $REPO_PATH ==="
echo ""

echo "--- FILE TREE ---"
find "$REPO_PATH" \
  -not -path "*/node_modules/*" \
  -not -path "*/.git/*" \
  -not -path "*/.next/*" \
  -not -path "*/dist/*" \
  -not -path "*/__pycache__/*" \
  -not -path "*/target/*" \
  | sed "s|$REPO_PATH/||" \
  | sort
echo ""

echo "--- FILE CONTENTS ---"
find "$REPO_PATH" -type f \
  -not -path "*/node_modules/*" \
  -not -path "*/.git/*" \
  -not -path "*/.next/*" \
  -not -path "*/dist/*" \
  -not -path "*/__pycache__/*" \
  -not -path "*/target/*" \
  -not -name "*.lock" \
  -not -name "*.png" -not -name "*.jpg" -not -name "*.jpeg" \
  -not -name "*.gif" -not -name "*.ico" -not -name "*.woff*" \
  -not -name "*.ttf" -not -name "*.eot" -not -name "*.mp4" \
  | sort \
  | while read -r file; do
    size=$(wc -c < "$file" 2>/dev/null || echo 0)
    if [ "$size" -le "$MAX_BYTES" ]; then
      rel="${file#$REPO_PATH/}"
      echo ""
      echo "### $rel ###"
      cat "$file"
      echo ""
    else
      rel="${file#$REPO_PATH/}"
      echo ""
      echo "### $rel [SKIPPED: ${size} bytes > ${MAX_BYTES} limit] ###"
    fi
  done

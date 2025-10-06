#!/bin/bash
# --------------------------------------------------
# SmartFileOrganizer — Find Duplicate Files (macOS Safe)
# --------------------------------------------------

set -e  # stop on errors

PROJECT_DIR="$HOME/SmartFileOrganizer"
LOGFILE="$PROJECT_DIR/logfile.txt"
OUTPUT_FILE="$PROJECT_DIR/duplicates.txt"

mkdir -p "$PROJECT_DIR"
touch "$LOGFILE" "$OUTPUT_FILE"

echo "Starting duplicate check..." | tee -a "$LOGFILE"
echo "" > "$OUTPUT_FILE"

# --------------------------------------------------
# Portable checksum for macOS / Linux
# --------------------------------------------------
checksum_for() {
  if command -v shasum >/dev/null 2>&1; then
    shasum -a 256 "$1" | awk '{print $1}'
  elif command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | awk '{print $1}'
  else
    md5 -q "$1"
  fi
}

# --------------------------------------------------
# Detect duplicates (compatible with macOS Bash 3.x)
# --------------------------------------------------
TMPFILE=$(mktemp)

find "$PROJECT_DIR" -type f -not -path "$PROJECT_DIR/.git/*" -print0 | while IFS= read -r -d '' file; do
  checksum=$(checksum_for "$file")
  if grep -q "$checksum" "$TMPFILE"; then
    prev_file=$(grep "$checksum" "$TMPFILE" | cut -d'|' -f2-)
    echo "Duplicate: $file == $prev_file" | tee -a "$OUTPUT_FILE"
    echo "$(date): Duplicate found ($file == $prev_file)" >> "$LOGFILE"
  else
    echo "$checksum|$file" >> "$TMPFILE"
  fi
done

rm -f "$TMPFILE"

echo "✅ Duplicate check complete. Results saved in: $OUTPUT_FILE" | tee -a "$LOGFILE"


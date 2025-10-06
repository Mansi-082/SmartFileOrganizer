#!/bin/bash
# --------------------------------------------------
# SmartFileOrganizer — Cleanup Empty Directories
# --------------------------------------------------

set -e

PROJECT_DIR="$HOME/SmartFileOrganizer"
LOGFILE="$PROJECT_DIR/logfile.txt"

mkdir -p "$PROJECT_DIR"
touch "$LOGFILE"

echo "Starting cleanup..." | tee -a "$LOGFILE"

find "$PROJECT_DIR" -type d -empty \
  -not -path "$PROJECT_DIR/.git*" \
  -not -path "$PROJECT_DIR/backups*" \
  -print -delete | tee -a "$LOGFILE"

echo "✅ Cleanup complete." | tee -a "$LOGFILE"


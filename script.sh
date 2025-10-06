#!/bin/bash
PROJECT_DIR="$HOME/SmartFileOrganizer"
LOGFILE="$PROJECT_DIR/logfile.txt"
mkdir -p "$PROJECT_DIR"
touch "$LOGFILE"

checksum_for() {
  if command -v shasum >/dev/null 2>&1; then
    shasum -a 256 "$1" | awk '{print $1}'
  elif command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$1" | awk '{print $1}'
  else
    md5 -q "$1"
  fi
}



#!/bin/bash
# Compress files older than 30 days

mkdir -p ../logs ../backups

find . -type f -mtime +30 ! -name "*.tar.gz" -print0 | while IFS= read -r -d '' file; do
  folder="../backups"
  base=$(basename "$file")
  tar -czf "$folder/${base}.tar.gz" "$file" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "$(date): Compressed $file to ${base}.tar.gz" >> ../logs/actions.log
    rm "$file"
  fi
done

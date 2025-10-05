#!/bin/bash
# Remove all empty directories recursively

mkdir -p ../logs

find . -type d -empty -not -path "./.git*" -not -path "." -print -delete | while read -r folder; do
  echo "$(date): Deleted empty folder $folder" >> ../logs/actions.log
done

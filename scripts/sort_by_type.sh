#!/bin/bash
# Sort files by extension (type)

mkdir -p sorted/type
mkdir -p ../logs   # ensure logs folder exists

for file in *.*; do
  [ -f "$file" ] || continue   # skip directories
  ext="${file##*.}"
  mkdir -p "sorted/type/$ext"
  mv "$file" "sorted/type/$ext/" 2>/dev/null
  echo "$(date): Moved $file to sorted/type/$ext/" >> ../logs/actions.log
done


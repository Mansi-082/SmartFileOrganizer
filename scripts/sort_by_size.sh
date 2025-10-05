#!/bin/bash
# Sort files by size (small <100KB, medium <1MB, large >=1MB)

mkdir -p sorted/size
mkdir -p ../logs

for file in *; do
  [ -f "$file" ] || continue
  size=$(stat -c%s "$file")   # get file size in bytes
  if [ $size -lt 100000 ]; then
    folder="small"
  elif [ $size -lt 1000000 ]; then
    folder="medium"
  else
    folder="large"
  fi
  mkdir -p "sorted/size/$folder"
  mv "$file" "sorted/size/$folder/" 2>/dev/null
  echo "$(date): Moved $file to sorted/size/$folder/" >> ../logs/actions.log
done

git add scripts/sort_by_date.sh
git commit -m "Implemented date-based sorting script (closes #3)"

# Script to sort files by modification date into folders (Year-Month)

TARGET_DIR=${1:-.}   # Default to current directory if no argument is given

for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        folder=$(date -r "$file" +"%Y-%m")
        mkdir -p "$TARGET_DIR/$folder"
        mv "$file" "$TARGET_DIR/$folder/"
    fi
done

echo "Files sorted by date in $TARGET_DIR"




echo "Smart File Organizer - placeholder. Use --help for usage."
#!/bin/bash
# Main controller for Smart File Organizer

mkdir -p ../logs

show_help() {
    echo "Usage: ./scripts/main.sh [option]"
    echo "Options:"
    echo "  --type       Sort by file type"
    echo "  --date       Sort by date"
    echo "  --size       Sort by size"
    echo "  --dup        Detect duplicates"
    echo "  --compress   Compress old files"
    echo "  --cleanup    Clean empty folders"
    echo "  --all        Run all modules"
}

case "$1" in
  --type)
    ./scripts/sort_by_type.sh ;;
  --date)
    ./scripts/sort_by_date.sh ;;
  --size)
    ./scripts/sort_by_size.sh ;;
  --dup)
    ./scripts/find_duplicates.sh ;;
  --compress)
    ./scripts/compress_old.sh ;;
  --cleanup)
    ./scripts/cleanup.sh ;;
  --all)
    ./scripts/sort_by_type.sh
    ./scripts/sort_by_date.sh
    ./scripts/sort_by_size.sh
    ./scripts/find_duplicates.sh
    ./scripts/compress_old.sh
    ./scripts/cleanup.sh ;;
  *)
    show_help ;;
esac

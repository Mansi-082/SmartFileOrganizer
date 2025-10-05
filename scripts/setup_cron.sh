#!/bin/bash
# Setup cron job for Smart File Organizer
SCRIPT_PATH="$(pwd)/scripts/main.sh"
LOG_PATH="$(pwd)/logs/cron_log.txt"

(crontab -l 2>/dev/null; echo "0 20 * * * bash $SCRIPT_PATH --all >> $LOG_PATH 2>&1") | crontab -
echo "Cron job scheduled: runs daily at 8 PM"

#!/bin/bash
# Setup cron job for Smart File Organizer (macOS version)

SCRIPT_PATH="$(pwd)/scripts/main.sh"
LOG_PATH="$(pwd)/logs/cron_log.txt"

# Create log folder if not present
mkdir -p "$(pwd)/logs"

# Add job to current user's crontab
# macOS syntax is same as Linux; just ensure full paths are used
( crontab -l 2>/dev/null; echo "0 20 * * * bash $SCRIPT_PATH --all >> $LOG_PATH 2>&1" ) | crontab -

echo "✅ Cron job scheduled to run daily at 8 PM"
echo "To verify, run: crontab -l"

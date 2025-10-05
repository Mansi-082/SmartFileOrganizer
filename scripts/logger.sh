#!/bin/bash
# Logger utility for Smart File Organizer

LOGFILE="../logs/actions.log"
mkdir -p ../logs

log_action() {
    echo "$(date): $1" >> $LOGFILE
}

# Example usage:
# log_action "Compressed old file data.txt"
# log_action "Deleted empty folder temp/"

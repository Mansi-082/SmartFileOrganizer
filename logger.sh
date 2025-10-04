#!/bin/bash
# Logger script for Smart File Organizer

# Log file path
LOGFILE="logfile.txt"

# Function to log messages
log_action() {
    local MESSAGE="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $MESSAGE" >> "$LOGFILE"
}

# Example usage: Logging a file move
# Parameters: $1 = source file, $2 = destination
log_move() {
    log_action "Moved file '$1' to '$2'"
}

# Example usage: Logging a file deletion
# Parameters: $1 = deleted file
log_delete() {
    log_action "Deleted file '$1'"
}

# Example usage: Logging a file rename
# Parameters: $1 = old name, $2 = new name
log_rename() {
    log_action "Renamed file '$1' to '$2'"
}

# ----- Test logging -----
# Uncomment these lines to test the logger
# log_move "test.txt" "sorted/test.txt"
# log_delete "oldfile.txt"
# log_rename "file1.txt" "file_renamed.txt"

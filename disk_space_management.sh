#!/bin/bash

# Default threshold for file deletion is 40 hours
DEFAULT_THRESHOLD="40 hours ago"

# Log file name format: deleted-files-<date>-<month>-<year>.log
LOG_DIR="/var/log/audio_cleanup"
LOG_FILE="${LOG_DIR}/deleted-files-$(date +%d-%m-%Y).log"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Determine the time threshold
if [ -z "$1" ]; then
    THRESHOLD=$DEFAULT_THRESHOLD
else
    THRESHOLD="$1 ago"
fi

# Convert threshold to ISO 8601 format
TIME_THRESHOLD=$(date --date="$THRESHOLD" +%s)

# Clean out .wav audio files older than the specified time threshold
find /usr/lib/libreoffice/share/gallery/sounds/ -name "*.wav" -type f -printf "%p %T@\n" | while read -r FILE TIME
do
    # Convert file's modification time to ISO 8601 format
    FILE_TIME=$(date --date="@$TIME" --iso-8601=seconds)
    
    # Check if the file is older than the threshold
    if [ "$TIME" -lt "$TIME_THRESHOLD" ]; then
        # Log the deletion
        echo "${FILE} ${FILE_TIME} $(date --iso-8601=seconds)" >> "${LOG_FILE}"
        
        # Delete the file
        rm -f "${FILE}"
    fi
done

echo "Cleanup completed. Log file created at ${LOG_FILE}"


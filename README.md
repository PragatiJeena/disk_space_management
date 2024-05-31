# Disk Space Management Script

This bash script cleans out `.wav` audio files in `/data/audios/folder` that are older than a specified time. It also generates a log file with details of deleted files.

## Script Features

- Cleans out `.wav` audio files older than a specified time threshold (default: 40 hours).
- Generates a log file with the name `deleted-files-<date>-<month>-<year>.log`.
- Each log entry contains the name of the audio file, its creation time, and deletion time in ISO 8601 format.

## Usage

1. Clone or download this repository
  
2. Run managing-disk-space.sh
  
3. Make the script executable ------>chmod +x managing-disk-space.sh
  
4. Run the script with the desired time threshold as an argument------>./managing-disk-space.sh 10hrs

5.After running the script, you will find the log file named deleted-files-<date>-<month>-<year>.log in the current directory for me that folder is /var/log/audio_cleanup/deleted-files-31-05-2024.log

6. I have copied these log in a logfile which I created through vim by using command ------>cp /var/log/audio_cleanup/deleted-files-31-05-2024.log ~/logfile.txt

**Note** 
In a script at one place you need to change path of your audio file (find /data/audios/folder) here 

you need to first search your audio file through command ------->find / -name "*.wav"

Check the path and paste it in your script

I have also added a log file containing logs





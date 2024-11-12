#!/bin/bash

# Define the log file paths
access_log="/var/log/nginx/access.log"
error_log="/var/log/nginx/error.log"

# Wait until both log files exist
echo "Instantiating new logging session..."
while [ ! -f "$access_log" ] || [ ! -f "$error_log" ]; do
    sleep 1  # Check every second
done

# Log the new session to both files
echo -e "\n $(date '+%Y/%m/%d %H:%M:%S %z') new NGINX session \n" | tee -a "$error_log" >> "$access_log"
echo "New logging session instantiated..."

echo "Starting Nginx..."
chmod 
# Start Nginx
exec nginx -g "daemon off;"

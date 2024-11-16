#!/bin/bash

# Define the cron job command
CRON_JOB="0 */12 * * * cd $(pwd) && docker compose up certbot && docker compose exec nginx nginx -s reload >> $(pwd)/certbot/log/certbot-renew/certbot-renew.log 2>&1"
LOG_DIR="./certbot/log/certbot-renew/"

# Ensure the log directory exists
mkdir -p $LOG_DIR

# Function to install the cron job
install_cron_job() {
    # Check if the cron job already exists
    (crontab -l | grep -F "$CRON_JOB") &>/dev/null

    if [ $? -eq 0 ]; then
        echo "Cron job already exists. No changes made."
    else
        # Add the new cron job
        (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
        echo "Cron job added to run Certbot every 12 hours, with logs saved to "$LOG_DIR"."
    fi
}

# Function to remove the cron job
remove_cron_job() {
    # Check if the cron job exists
    (crontab -l | grep -F "$CRON_JOB") &>/dev/null

    if [ $? -eq 0 ]; then
        # Remove the cron job
        (crontab -l | grep -F -v "$CRON_JOB") | crontab -
        echo "Cron job removed."
    else
        echo "No matching cron job found."
    fi
}

# Check for the argument passed to the script
if [ "$1" == "--install" ]; then
    install_cron_job
elif [ "$1" == "--uninstall" ]; then
    remove_cron_job
else
    # Interactive prompt if no argument is provided
    echo "Would you like to install or remove the cron job?"
    select choice in "Install" "Remove" "Quit"; do
        case $choice in
            Install)
                install_cron_job
                break
                ;;
            Remove)
                remove_cron_job
                break
                ;;
            Quit)
                echo "Exiting..."
                break
                ;;
            *)
                echo "Invalid option. Please choose 1, 2, or 3."
                ;;
        esac
    done
fi

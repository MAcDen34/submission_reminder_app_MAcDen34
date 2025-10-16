#!/usr/bin/env bash

# -------------------------------
# Copilot Shell Script
# Runs outside submission_reminder_Denzel folder
# -------------------------------

# Path to the app folder
APP_FOLDER="./submission_reminder_Denzel"

# Path to config.env inside the app folder
CONFIG_FILE="$APP_FOLDER/config/config.env"

# Check if config.env exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: $CONFIG_FILE not found!"
    exit 1
fi

# Prompt the user for the new assignment name
read -p "Enter the new assignment name: " NEW_ASSIGNMENT

# Update ASSIGNMENT value in config.env using sed
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$NEW_ASSIGNMENT\"/" "$CONFIG_FILE"

echo "[+] Assignment updated to: $NEW_ASSIGNMENT"

# Path to startup.sh inside app folder
STARTUP_SCRIPT="$APP_FOLDER/startup.sh"

# Run startup.sh
if [ -f "$STARTUP_SCRIPT" ]; then
    echo "[+] Running the reminder script..."
    bash "$STARTUP_SCRIPT"
else
    echo "Error: $STARTUP_SCRIPT not found!"
    exit 1
fi


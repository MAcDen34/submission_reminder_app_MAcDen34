#!/bin/bash
# Reminder script for pending submissions

# Source environment variables and functions
source ./config/config.env
source ./modules/functions.sh

# Path to submissions file
submissions_file="./assets/submissions.txt"

# Display assignment info
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

# Run the reminder function
check_submissions $submissions_file

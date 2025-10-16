#!/usr/bin/env bash
# Beginner-friendly script to setup the submission reminder app

# Ask user for name
read -p "Enter your name: " username

# Main directory
main_dir="submission_reminder_${username}"

# Create directories
mkdir -p "$main_dir/config" "$main_dir/assets" "$main_dir/modules" "$main_dir/scripts"

echo "[+] Directories created."

# Create config.env
cat > "$main_dir/config/config.env" << 'EOF'
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=5
EOF

# Create submissions.txt with your data
cat > "$main_dir/assets/submissions.txt" << 'EOF'
student, assignment, status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Jean Damour, Shell Navigation, submitted
Bocru, Shell loops, not submitted
Teta Sonia, Shell loops, submitted
Allan, Conditional structures, not submitted
Mutesi, Git, not submitted
Ivy, Shell Navigation, not submitted
Samuel, Shell Navigation, submitted
Grace, Shell Navigation, not submitted
Peter, Git, not submitted
Amina, Shell Basics, not submitted
Linus, Shell Navigation, not submitted
EOF

# Create functions.sh
cat > "$main_dir/modules/functions.sh" << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading/trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip header
}
EOF

# Create reminder.sh
cat > "$main_dir/scripts/reminder.sh" << 'EOF'
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
EOF

# Create startup.sh
cat > "$main_dir/startup.sh" << 'EOF'
#!/bin/bash
# Startup script to run the reminder app
cd "$(dirname "$0")"
bash ./scripts/reminder.sh
EOF

# Make all .sh files executable
find "$main_dir" -type f -name "*.sh" -exec chmod +x {} \;

echo "[+] Setup complete! Run './startup.sh' inside $main_dir to start the app."


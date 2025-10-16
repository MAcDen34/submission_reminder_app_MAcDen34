# Submission Reminder App

This is a simple Bash-based application that tracks student assignment submissions and sends reminders for pending work.

---

## Folder Structure

After running `create_environment.sh`, a folder `submission_reminder_{YourName}` will be created with the following structure:

submission_reminder_Denzel/
├── assets/
│ └── submissions.txt # Sample student submission records
├── config/
│ └── config.env # App configuration (assignment name, days remaining)
├── modules/
│ └── functions.sh # Functions to check submissions
├── scripts/
│ └── reminder.sh # Script to send reminders
└── startup.sh # Starts the reminder app

The `copilot_shell_script.sh` is located **outside** the app folder and allows updating the assignment name.

---

## How to Run

### 1️⃣ Create the environment

```bash
chmod 777 create_environment.sh
./create_environment.sh
Enter your name when prompted.

This will create submission_reminder_{YourName} with all necessary files and folders.

Step 2 Run the reminder application
cd submission_reminder_{YourName}
chmod +x *.sh
./startup.sh


Displays the current assignment and days remaining.

Lists students who have not submitted the assignment.

Step 3 Update assignment name

From the parent directory of submission_reminder_{YourName}:

chmod +x copilot_shell_script.sh
./copilot_shell_script.sh


Enter a new assignment name.

The script updates config/config.env and reruns the reminder.

Notes

Ensure all .sh files are executable: chmod +x filename.sh.

submissions.txt contains sample student data; you can add more records to test.

Use the feature branch for development and the main branch for the final application submission.




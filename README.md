# Submission Reminder App

A simple Bash script application to help track which students have submitted their assignments and send reminders for those who haven't.

---

## What’s in the app

After running `create_environment.sh`, you’ll get a folder named `submission_reminder_{YourName}` with this structure:

submission_reminder_{YourName}/
├── assets/
│ └── submissions.txt # List of students and their submission status
├── config/
│ └── config.env # Stores the assignment name and days remaining
├── modules/
│ └── functions.sh # Functions to check submissions
├── scripts/
│ └── reminder.sh # Sends reminders for pending submissions
└── startup.sh # Launches the reminder app

yaml
Copy code

There's also a `copilot_shell_script.sh` **outside** the app folder that lets you change the assignment name easily.

---

## How to use it

### 1. Set up the environment

Make the setup script executable and run it:

chmod 744 create_environment.sh
./create_environment.sh
You'll be asked for your name.

This creates your submission_reminder_{YourName} folder with all the necessary files and subfolders.

2. Run the reminder app
Go into your app folder, make scripts executable, and start the app:

cd submission_reminder_{YourName}
chmod 744 *.sh
./startup.sh
You'll see the current assignment and how many days are left.

The app will print a reminder for any student who hasn't submitted yet.

3. Change the assignment name
From the parent folder of your app:

chmod 744 copilot_shell_script.sh
./copilot_shell_script.sh
Enter a new assignment name.

The script updates the assignment in config/config.env and reruns the reminders.




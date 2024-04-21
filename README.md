## Script Description:
This Bash script is designed to monitor disk usage on a specified disk device (e.g., /dev/sda1) and alert you via email when the usage exceeds a set threshold. It uses Mailgun's API for email notifications, making it suitable for system administrators who need to keep an eye on server disk space to prevent outages or performance degradation due to disk full issues.

## Key Features
Customizable Disk Monitoring: Specify any disk device you wish to monitor.
Threshold Alert: Set a percentage threshold to trigger the alert.
Email Notification: Uses Mailgun to send customizable email notifications.
Easy Configuration: Configure by simply editing environment variables at the top of the script.

## Configuration Variables
- **DISK_DEVICE**: The path of the disk device to monitor (e.g., /dev/sda1).
- **THRESHOLD**: The percentage of disk usage that triggers the alert (e.g., 95).
- **MAILGUN_API_KEY**: Your Mailgun API key.
- **MAILGUN_ENDPOINT**: The endpoint that includes the Mailgun domain you have registered.
- **MAILGUN_FROM**: The email address from which the alert will be sent.
- **MAILGUN_TO**: The recipient's email address.
- **MAILGUN_SUBJECT**: The subject line for the alert email.

## Monitoring a System Disk
If you want to monitor the primary disk of a server, you might configure the script with **/dev/sda1** as the **DISK_DEVICE**. This is typical for a root filesystem on many Linux distributions.

## Setting up for Low Thresholds
For critical systems where even **80%** disk usage is too high, you can set the **THRESHOLD** to **80**. This will alert you earlier, allowing preventive measures before reaching critical levels.

## Multiple Recipients
You can modify the script to send notifications to multiple recipients by changing the **MAILGUN_TO** variable to include multiple email addresses separated by commas.

## Installation and Cron Setup
1. Place the script on your server.
2. Make the script executable:
```
chmod +x monitor_disk_space.sh
```
3. Edit your crontab to run the script at desired intervals, such as every hour:
```
crontab -e
```
4. Add the following line to run it every hour
```
0 * * * * /path/to/monitor_disk_space.sh
```
This setup ensures that you are alerted via email whenever the specified disk usage goes beyond the set threshold, helping to maintain smooth server operations without sudden disruptions due to disk space issues.

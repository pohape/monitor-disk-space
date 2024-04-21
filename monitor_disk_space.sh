#!/bin/bash

# Monitoring parameters
DISK_DEVICE='/dev/sda1'
THRESHOLD=95

# Mailgun settings
# don't forget to replace mg.example.com to the actual domain
MAILGUN_API_KEY='YOUR_API_KEY'
MAILGUN_ENDPOINT='https://api.mailgun.net/v3/mg.example.com/messages'
MAILGUN_FROM='server1@mg.example.com'
MAILGUN_TO='admin@example.com'
MAILGUN_SUBJECT='Disk Space Alert on Server'

DISK_USAGE=$(df -h "$DISK_DEVICE" | grep "$DISK_DEVICE" | awk '{ print $5 }' | sed 's/%//g')

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
    SERVER_NAME=$(hostname)
    MAILGUN_TEXT="Alert on $SERVER_NAME: Disk usage for $DISK_DEVICE is at ${DISK_USAGE}% which exceeds the threshold of $THRESHOLD%."

    curl -s --user "api:$MAILGUN_API_KEY" \
        "$MAILGUN_ENDPOINT" \
        -F from="$MAILGUN_FROM" \
        -F to="$MAILGUN_TO" \
        -F subject="$MAILGUN_SUBJECT" \
        -F text="$MAILGUN_TEXT"
fi

#!/bin/bash

# IP Array for my Playground VMs
IP_LIST=("172.31.40.140" "172.31.43.199" "172.31.47.3")

# Username Variable
USER="cloud_user"

ssh-keygen

# For every IP in IP_LIST array loop through them.
for IP in ${IP_LIST[@]}; do
    #echo $IP # Test loop

# If statement to check for the iteration of our local IP
    if [ "$IP" == `hostname -I` ]; then
        echo "This is our IP: $IP" # Exclude our IP from the iteration and continue to next iteration
        continue
    fi
        ssh-copy-id "$USER"@"$IP" # Copy ssh-key for each IP iteration
done




# Considerations for improvement would be to use a heredoc and/or script args to pass prompts in an automated fashion

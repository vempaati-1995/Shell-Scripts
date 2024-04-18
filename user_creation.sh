#!/bin/bash
raw-user=$@
for user in $raw-user; do
    if [ $user = $(cat etc/passwd | grep -i $user | awk -F ':' '{print $1}') ]; then
        echo "Given $user id is available"
    else
        echo "Given $user is not available,has to create"
    fi
done
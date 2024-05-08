#!/bin/bash
raw_user="$@"

if [ "$raw_user" ]; then
    for user in $raw_user; do
        user=$(echo "$user" | tr '[:upper:]' '[:lower:]')
        echo $user

        if [[ "$user" =~ ^[[:alpha:]]{3}[[:digit:]]{3}$ ]]; then

            if [ "$user" = "$(cat /etc/passwd | grep -i "$user" | awk -F ':' '{print $1}')" ]; then
                echo "Given $user id is available"
            else
                echo "Given $user is not available, has to be created"
                new_user=$(useradd $user)
                usermod -aG sudo $user
                special=$(echo '!@#$%^&*()_' | fold -1 | shuf | head -1)
                password=$(echo "India@$RANDOM$special")
                echo "$password"
                echo "$user:$password" | chpasswd
                echo "Password assigned to $user: $password"
                chage -d 0 $user
            fi

        else
            echo "Error !!! Given username is not valid. Kindly provide combination of 3 alphabets and 3 numbers."
        fi

    done
else
    echo "ERROR !!! No user name provided. Please provide user names"
fi

# create user if user not exists
# Assign random password with nums,char,special char Ex India@1234$
# Force user to change password
# Username must be the combination of alphabets & num and lower case only and contain length 6 only.

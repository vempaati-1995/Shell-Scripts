#!/bin/bash
inputs=$@

if [ "$inputs" ]; then

    for word in $inputs; do
        reverse=""
        length_word=${#word}
        echo $length_word

        for ((i = 1; $length_word - i >= 0; i++)); do
            index=$length_word-i
            char=${word:$index:1}
            reverse="$reverse$char"
            echo "$reverse"
        done

        if [ "$word" == "$reverse" ]; then
            echo "Given word "$word" is palindrome."
        else
            echo "Given word "$word" is not palindrome."
        fi

    done

else
    echo "Not given any word. Please provide an word."
fi

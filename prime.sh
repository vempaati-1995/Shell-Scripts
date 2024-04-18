#!/bin/bash
n=$@
for arg in $n ; do
if [ $((arg % 2)) -eq 0 ]; then
    echo "$arg is even"
else
    echo "$arg is odd"
fi
done
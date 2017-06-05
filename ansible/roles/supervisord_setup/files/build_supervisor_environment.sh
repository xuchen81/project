#!/bin/bash
lines=()
FILE="environment.conf"
while read line; do
    lines+=($line)
done < $FILE

result=""
for i in "${!lines[@]}"; do
    result+=${lines[$i]}
    if ! [ $i -eq $((${#lines[@]}-1)) ]; then
        result+=","
    fi
done
result+=" ; (supervisord environment variables)"
echo $result

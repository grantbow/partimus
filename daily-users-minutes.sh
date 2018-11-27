#!/bin/sh
# sample STDIN input:
#     userid    pts/0        10.0.0.1   Thu Nov  1 03:47 - 09:44  (05:56)
target=$(date -d "yesterday" | cut -d\  -f2-3)
# i.e. Nov 1
# assumes date output format
while read line
do
    date=$(date -d "$(echo $line | cut -d\  -f5-8)" +%s) # each line date
    if [ $date -ge "$(date -d "$target 00:00" +%s)" ] && [ $date -le "$(date -d "$target 23:59" +%s)" ]
    then
        #echo $line # each login for yesterday
        user=$(echo $line | cut -d\  -f1)
        time=$(echo $line | cut -d\  -f1,10 | uniq -c | cut -d\  -f9 | tr -d \(\))
        #t="05:56"
        minutes=$(echo $(echo $time | cut -d: -f1 | sed s/\$/\*60/g | bc) + $(echo $time | cut -d: -f2) | bc)
        #m="356"
        echo "$user $minutes"
        ## sample output each login: userid 356
    fi
done

# 
# sample input: userid    pts/0        10.0.0.1   Thu Nov  1 03:47 - 09:44  (05:56)
## | cut -d\  -f1,10 | uniq -c | cut -d\  -f9 | tr -d \(\)
## outputs 05:56
#
#t="05:56"
## hours*60 - sed replaces end of line with stdin for each line
## | cut -d: -f1 | sed s/\$/\*60/g | bc
## minutes
## | cut -d: -f2
## then echo them to add
#echo $(echo $t | cut -d: -f1 | sed s/\$/\*60/g | bc) + $(echo $t | cut -d: -f2) | bc




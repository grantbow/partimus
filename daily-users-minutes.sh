#!/bin/sh
# assumes date output format and last command for info
target=$(date -d "yesterday" | awk '{ print $2" "$3 }')
# i.e. Aug 11
last | while read line
do
    date=`date -d "$(echo $line | awk '{ print $5" "$6" "$7 }')" +%s`
    [[ $date -ge `date -d "$target 00:00" +%s` && $date -le `date -d " 23:59" +%s` ]] && echo $line
done


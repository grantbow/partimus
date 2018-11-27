#!/bin/sh
# assumes date output format and last command for info
target=$(date -d "yesterday" | cut -d\  -f2-3)
# i.e. Nov 1
while read line
do
    # sample input: userid    pts/0        10.0.0.1   Thu Nov  1 03:47 - 09:44  (05:56)
    date=$(date -d "$(echo $line | cut -d\  -f5-8)" +%s)
    if [ $date -ge "$(date -d "$target 00:00" +%s)" ] && [ $date -le "$(date -d "$target 23:59" +%s)" ] ; then  echo $line; fi
done


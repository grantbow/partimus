#!/bin/sh
t1=$(date -d "-2 days" | cut -d\  -f1-3)
t2=$(date -d "-1 days" | cut -d\  -f1-3)
t3=$(date -d "today" | cut -d\  -f1-3)

sum=0

printf "%s\n%s\n%s\n" \
"userid    pts/0        10.0.0.1   $t1 03:47 - 09:44  (05:56)" \
"userid    pts/0        10.0.0.1   $t2 03:47 - 09:44  (05:56)" \
"userid1    pts/1        10.0.0.1   $t2 05:47 - 11:44  (05:56)" \
"userid1    pts/2        10.0.0.1   $t2 07:47 - 13:44  (05:56)" \
"userid2    pts/2        10.0.0.1   $t2 11:47 - 17:44  (05:56)" \
"userid    pts/0        10.0.0.1   $t3 03:47 - 09:44  (05:56)" | ./daily-users-minutes.sh

# process lines twice to get output reports:

#userid login count
# | cut -d\  -f1 | uniq -c

#total minutes, added by awk, bc not needed
# | cut -d\  -f2 | awk '{s+=$0} END {print s}'



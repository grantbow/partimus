#!/bin/sh
t1=$(date -d "-2 days" | cut -d\  -f1-3)
t2=$(date -d "-1 days" | cut -d\  -f1-3)
t3=$(date -d "today" | cut -d\  -f1-3)

printf "%s\n%s\n%s\n" \
"userid    pts/0        10.0.0.1   $t1 03:47 - 09:44  (05:56)" \
"userid    pts/0        10.0.0.1   $t2 03:47 - 09:44  (05:56)" \
"userid    pts/0        10.0.0.1   $t3 03:47 - 09:44  (05:56)" | ./daily-users-minutes.sh


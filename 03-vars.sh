#!/usr/bin/bash

A=10
echo A = $A

No_of_users=$(who | wc -l)
echo Number of users = $No_of_users

DATE1="2024-04-04"
echo welcome, today date is $DATE1

DATE2=$(date +%F)
echo Welcome, Today date is $DATE2
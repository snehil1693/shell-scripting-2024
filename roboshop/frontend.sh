#!/usr/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

echo -e "Installing Nginx\t\t...\t\e[32mdone\e[0m"

yum install nginx -y  &>>$LOG

echo "Enabling Nginx"
systemctl enable nginx  &>>$LOG

echo "Starting Nginx"
systemctl start nginx  &>>$LOG

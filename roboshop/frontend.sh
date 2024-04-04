#!/usr/bin/bash

LOG=/tmp/roboshop.log
rm -f $LOG

echo -e "Installing Nginx\t\t..."

yum install nginx -y  &>>$LOG
echo $?
if [ $? -eq 0 ]; then
  echo done
else
  echo fail
fi



echo "Enabling Nginx"
systemctl enable nginx  &>>$LOG
echo $?

echo "Starting Nginx"
systemctl start nginx  &>>$LOG
echo $?
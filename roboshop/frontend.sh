#!/usr/bin/bash

LOG=/tmp/roboshop.log

echo -e "Installing Nginx\t\t...\t\e[32mdone\e[0m"

yum install nginx -y >$LOG

echo "Enabling Nginx"
systemctl enable nginx

echo "Starting Nginx"
systemctl start nginx

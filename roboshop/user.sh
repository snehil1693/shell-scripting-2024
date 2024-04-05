#!/usr/bin/bash

source common.sh

PRINT "Install NodeJS"
yum install nodejs make gcc-c++ -y &>>$LOG
STAT_CHECK $?

PRINT "Add Roboshop Application User"
id roboshop &>>$LOG
if [ $? -ne 0 ] then
	useradd roboshop &>>$LOG
fi
STAT_CHECK $?

PRINT "Download Application Code"
cusrl -s -L -o /tmp/user.zip "https://github.com/roboshop-devops-project/user/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Extract Download Code\t"
cd /home/roboshop && unzip -o /tmp/user.zip &>>$LOG && rm -rf user && mv user-main user
STAT_CHECK $?

PRINT "Install NodeJS Dependencies"
cd /home/roboshop/user && npm install --unsafe-perm $>>$LOG
STAT_CHECK $?

PRINT "Fix Application Permissions"
chown roboshop:roboshop /home/roboshop -R &>>$LOG
STAT_CHECK $?

PRINT "Setup SystemD file\t"
sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/" /home/roboshop/user/systemd.service && mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
STAT_CHECK $?

PRINT "Start Catalogue Service\t"
systemctl daemon-reload &>>$LOG && systemctl start-user &>>$LOG && systemctl enable-user &>>$LOG
STAT_CHECK $?

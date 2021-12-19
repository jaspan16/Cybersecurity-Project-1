#!/bin/bash
#create a var backup 

mkdir /var/backup

#create a backup tar

tar cvf /var/backup/home.tar /home

#change name 
mv /var/backup/home.tar /var/backup/home.10162021.tar

#list all files in /var/backup
ls -lh /var/backup > /var/backup/file_report.txt

#print how much free memory is left

free -h > /var/backup/disk_report.txt

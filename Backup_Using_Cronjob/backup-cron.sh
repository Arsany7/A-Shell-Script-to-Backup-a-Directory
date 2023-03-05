#!/bin/bash
dir=$1
backupdir=$2
mypath=$3
max_backups=$4
Date_Time=`date +"%Y-%m-%d-%T"`
cd $mypath
ls -lR $dir > ./directory-info.new
if diff ./directory-info.last ./directory-info.new > /dev/null
then	
	echo "No Backup to be done"  
else
	echo "Backup is needed" 
	ls -lR $dir > ./directory-info.last	
	count=0
	cd $backupdir 
	count=$(ls -l | grep ^d | wc -l)
	cd $mypath
	if [ $count -lt $max_backups ]
	then
		Date_Time=`date +"%Y-%m-%d-%T"`
		cp -r $dir $backupdir/$Date_Time
		ls -lR $dir > ./directory-info.last
  	else
  		cd $backupdir
  		ls -1t | tail -n +$max_backups | xargs rm -r
  		cd $mypath
		ls -lR $dir > ./directory-info.last
		Date_Time=`date +"%Y-%m-%d-%T"`
		cp -r $dir $backupdir/$Date_Time
	fi
fi

#!/bin/bash
dir=$1
backupdir=$2
sleepTime=$3
max_backups=$4
Date_Time=`date +"%Y-%m-%d-%T"`
ls -lR $dir > ./directory-info.last
mkdir -p $backupdir/${Date_Time//[[:space:]]/}
cp -r $dir $backupdir/${Date_Time//[[:space:]]/}
for (( ; ; ))
do
	sleep $sleepTime
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
		cd ..
		if [ $count -lt $max_backups ]
		then
			Date_Time=`date +"%Y-%m-%d-%T"`
			cp -r $dir $backupdir/${Date_Time//[[:space:]]/}
			ls -lR $dir > ./directory-info.last
  		else
  			cd $backupdir
  			ls -1t | tail -n +$max_backups | xargs rm -r
  			cd ..
			ls -lR $dir > ./directory-info.last
			Date_Time=`date +"%Y-%m-%d-%T"`
			cp -r $dir $backupdir/${Date_Time//[[:space:]]/}
		fi
	fi
done

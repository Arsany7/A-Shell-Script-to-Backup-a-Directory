#Project name: A Shell Script to Backup a Directory
#Project Description:
Some important directories need to be backed up every while, as a result, this program backups the target directory to another backup directory every detected period of time and to avoid memory leakage it has number of maximum backups after which it will delete the old versions keeping only the newest ones undeleted.
---
##Files and Folders here are as follows:
- **mdir**: The directory that a user wants to back it up (just as a case to run the code on) but it might be any other directory, not to mention that some edits should be made in the Makefile to adapt to this changes.
- **backup.sh**: The bash script containing the commands that performs project target.
- **Makefile**: A file guides the make utility while compiling and linking program modules (This is the file that should be run).
- **README.md**: A MarkDown file containing program description and user-manual.
- **bdir**: This directory will be automatically created after running the make file.This is where the program will store the backups of mdir on changes.
*In bdir, you should see some directories named by the date and time of their creation and each one will contain a different backed up version of mdir.* 

##Prerequisites to be installed:
_Regarding the Bash Script:_
	A single terminal instruction should be written to ensure that your .sh file is accessible for execution.
	You should write the following commands:
								cd {paths of the directory where the bash file exists} 
								chmod +x backupd.sh 
_Regarding the Makefile:_
	Make package comes in default in the Ubuntu OS, so you should verify if it is already installed before considering installing it. You can verify it by typing the below-mentioned command in the terminal.
								make - version
	If the make package is not installed in Ubuntu due to any reason, you will get the error as shown below.
								bash: /user/bin/make: No such file or directory.
	Then you will have to write this command in the terminal to install make package:
								sudo apt install make
	After finishing the installations you can verify that by typing:
								ls /user/bin/make
	Here, your system should have a make directory; otherwise, you cannot use the make package.	
	If it the error still there you should run first this command:
								sudo apt install build-essential
	By installing the build-essential package you get rid of this error. It is also known as a meta-package, and you can use it to install a make package and several other packages as well.
	Then you could verify your work as mentioned above.

##User-Manual:
1- You should open the terminal and do all the prerequisite installations mentioned above first. 
2- Open the make file and check for the path of the directory you want to back-up and also the directory of where you are going to back your folder up, by editing the variables _paths1_ and _paths2_ respectively.
3- Adjust the time needed to wait before each backup check using the variable _time_.
4- Adjust the maximum number of backups in your backup directory using the _mbackups_ variable.
5- Save and close your Makefile.
6- Now open the terminal and change the directory to the folder where this project is in using this command:
								cd {paths of the directory where the project exists}
7- Run the program using this command:
								make	

#Regarding the Cron Job:
Generally, if you want to edit in an existing cron you should use this command:
								crontab -e
and write the commands you want to execute then CTRL+x to execute them.
but in this project:
Everything would be done through the make file automatically so you will do the same installation and running instructions previously shown except for the last command that runs the make file it should be changed to :
								make -f Makewithcrone
This change is done because	the make file here is not named "make" so the make command will not work in the previously stated way.
- No installations to be done for the cron job to work since it is implemented in the OS by default.   

## Cron expression to run the backup every 3rd Friday of the month at 12:31 am
31 0 15-21 * 5	

-As a guide for any other expressions:
The cron custom schedule options are listed here....

#*    *    *    *    *
#-    -    -    -    -
#|    |    |    |    |
#|    |    |    |    +--------- day of week (0 - 6) (Sunday=0)
#|    |    |    +---------- month (1 - 12)
#|    |    +----------- day of month (1 - 31)
#|    +------------ hour (0 - 23)
#+------------- min (0 - 59)

This is the end of this README file, hopfully it was useful for its reader.

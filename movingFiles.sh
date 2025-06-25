#!/bin sh

#input: a source directory... of all the files i wanna move in it.
#goal: move assortment of files into new directory

#path to goal: for loop through the directory. ignore any subdirectories.
#each item in for loop is just a file. to 'mv sourcefile destfile'

#output: a destination directory... all files from source directory
#(no subdirectories though) go to the destination directory

#variables (from script arguments)
sourceDir=$1
destDir=$2

##checking if the destination Directory exists
#and asks user to create directory
if [ ! -d "$destDir" ]; then
	echo -ne "\nDirectory '$destDir' does not exist.\nWant to create it? [Y|n]: "
	read choice; #user input
	case "$choice" in 
		Y|y|yes|YES|Yes) echo -e "\nCreating Directory '$destDir'.\n"; mkdir -p "$destDir";;
		n|N|no|NO|No) echo -e "\nDirectory '$destDir' not created.\nCanceling Script...\n"; exit;;
		*) echo -e "\nInvalid input.\nCanceling Script...\n"; exit;;
	esac
fi
		

#how do i only ls -l files and not folders?
#ls -p ${sourceDir} | grep -v /

#with this command, each line will have a file to move.
#i wanna iterate through each line now.
#how do i do that...
#should i output each line as an element in an array?
#okay, i could store it, or use the 'read -r' command.

ls -p ${sourceDir} | grep -v / | while read -r line; do
	echo "processing $line"
	mv "${sourceDir}/$line" "${destDir}"
done

echo -e "\nTransfer Successful!"

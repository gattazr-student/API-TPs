#!/bin/bash 

# Setting input and output for this test script.
INPUT_FILE="tests/input.txt"
LOG_FILE="tests/result.txt"
BIN_PATH="binaires"

#cleaning 
rm -fr $LOG_FILE
# Loop other different versions. 
for LE_VERSION in `ls $BIN_PATH/*`;
do
	echo $LE_VERSION >> $LOG_FILE
	while read LINE
	do 
		echo `echo "$LINE" | $LE_VERSION ` >> $LOG_FILE 
	done < $INPUT_FILE	
done

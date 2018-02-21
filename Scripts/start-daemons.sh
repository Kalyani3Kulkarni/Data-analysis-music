#!/bin/bash

if [ -f "/home/hadoopvm/Music_Data_analysis/logs/current-batch.txt" ]
then
 echo "Batch File Found!"
else
 echo -n "1" > "/home/hadoopvm/Music_Data_analysis/logs/current-batch.txt"
fi

chmod 775 /home/hadoopvm/Music_Data_analysis/current-batch.txt
batchid=`cat /home/hadoopvm/Music_Data_analysis/logs/current-batch.txt`
LOGFILE=/home/hadoopvm/Music_Data_analysis/logs/log_batch_$batchid

echo "Starting daemons" >> $LOGFILE

start-all.sh
start-hbase.sh
mr-jobhistory-daemon.sh start historyserver

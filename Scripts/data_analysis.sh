#!/bin/bash

batchid=`cat /home/hadoopvm/Music_Data_analysis/logs/current-batch.txt`
LOGFILE=/home/hadoopvm/Music_Data_analysis/logs/log_batch_$batchid

echo "Running hive script for data analysis..." >> $LOGFILE

hive -hiveconf batchid=$batchid -f /home/hadoopvm/Music_Data_analysis/Scripts/data_analysis.hql

sh /home/hadoopvm/Music_Data_analysis/Scripts/data_export.sh

echo "Incrementing batchid..." >> $LOGFILE

batchid=`expr $batchid + 1`
echo -n $batchid > /home/hadoopvm/Music_Data_analysis/logs/current-batch.txt

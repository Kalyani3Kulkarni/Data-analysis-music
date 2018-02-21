#!/bin/bash

batchid=`cat /home/hadoopvm/Music_Data_analysis/logs/current-batch.txt`
LOGFILE=/home/hadoopvm/Music_Data_analysis/logs/log_batch_$batchid

echo "Placing data files from local to HDFS..." >> $LOGFILE

hadoop fs -rm -r /user/hadoopvm/Music_Data_analysis/batch${batchid}/web/
hadoop fs -rm -r /user/hadoopvm/Music_Data_analysis/batch${batchid}/formattedweb/
hadoop fs -rm -r /user/hadoopvm/Music_Data_analysis/batch${batchid}/mob/

hadoop fs -mkdir -p /user/hadoopvm/Music_Data_analysis/batch${batchid}/web/
hadoop fs -mkdir -p /user/hadoopvm/Music_Data_analysis/batch${batchid}/mob/

hadoop fs -put /home/hadoopvm/Music_Data_analysis/data/web/* /user/hadoopvm/Music_Data_analysis/batch${batchid}/web/
hadoop fs -put /home/hadoopvm/Music_Data_analysis/data/mob/* /user/hadoopvm/Music_Data_analysis/batch${batchid}/mob/

echo "Running pig script for data formatting..." >> $LOGFILE

pig -param batchid=$batchid /home/hadoopvm/Music_Data_analysis/Scripts/dataformatting.pig

echo "Running hive script for formatted data load..." >> $LOGFILE

hive -hiveconf batchid=$batchid -f /home/hadoopvm/Music_Data_analysis/Scripts/formatted_hive_load.hql

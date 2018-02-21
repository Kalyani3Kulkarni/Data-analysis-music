#!/bin/bash

batchid=`cat /home/hadoopvm/Music_Data_analysis/logs/current-batch.txt`
LOGFILE=/home/hadoopvm/Music_Data_analysis/logs/log_batch_$batchid

echo "Creating hive tables on top of hbase tables for data enrichment and filtering..." >> $LOGFILE

hive -f /home/hadoopvm/Music_Data_analysis/Scripts/create_hive_hbase_lookup.hql

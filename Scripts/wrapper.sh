#!/bin/bash

python /home/hadoopvm/Music_Data_analysis/Scripts/generate_web_data.py

python /home/hadoopvm/Music_Data_analysis/Scripts/generate_mob_data.py

sh /home/hadoopvm/Music_Data_analysis/Scripts/start-daemons.sh

sh /home/hadoopvm/Music_Data_analysis/Scripts/populate-lookup.sh

sh /home/hadoopvm/Music_Data_analysis/Scripts/dataformatting.sh

sh /home/hadoopvm/Music_Data_analysis/Scripts/data_enrichment.sh

sh /home/hadoopvm/Music_Data_analysis/Scripts/data_analysis.sh

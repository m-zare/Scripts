#!/bin/bash

src='/root/tmp/source/'
dst='/root/tmp/destination/'

dst_perfix_name='bkp'

# Days to keep backups
day=30

pwd=`pwd`
cd $src

# Move files to archive
echo "tar -cf $dst$dst_perfix_name-`date +%d-%m-%Y`.tar --remove-files $src*"
tar -cf $dst$dst_perfix_name-`date +%d-%m-%Y`.tar --remove-files *

#Remove archive files older than "day"
echo Remove archive files older than $day days
find $dst -mtime $day -exec rm {} \;

cd $pwd

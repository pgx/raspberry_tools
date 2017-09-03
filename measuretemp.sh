#!/bin/bash

TEMPDIR=/var/log/rspi_temperature

if [ ! -d "$TEMPDIR" ]
then
   mkdir $TEMPDIR 
fi

while true;
    do
        DATE=$(date +%Y%m%d)
        TIME=$(date +%H%M%S)
        TEMPERATURE=$(/opt/vc/bin/vcgencmd measure_temp)
        echo \'$TIME\',\'$TEMPERATURE\' | sed 's/temp=//g' >> $TEMPDIR/$DATE.log
        sleep 1 
    done



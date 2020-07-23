#!/usr/bin/env bash

cpu=`top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}' | awk -F . '{print $1}'`
cpu_core=`grep -c ^processor /proc/cpuinfo`
cpu_precentage=`top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'`
client_name=Skylark
mail_alert_names=jinojoe@xx.com,naveenca87@gmail.com

if [ $cpu -gt 80 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) Usage in Critical State - $cpu_precentage" | mail -s "$client_name - $(hostname) - Critical - Alert" $mail_alert_names

elif [ $cpu -gt 75 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) Usage in Warning - II State - $cpu_precentage" | mail -s "$client_name - $(hostname) - Warning - II - Alert" $mail_alert_names
elif [ $cpu -gt 70 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) in Warning - I State - $cpu_precentage" | mail -s "$client_name - $(hostname) - Critical - Alert" $mail_alert_names

fi


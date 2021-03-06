#!/usr/bin/env bash
#variable section
client_name=Skylark
from_address=navaneethan@skylarkinfo.com
to_address=navaneethan@skylarkinfo.com,selva@skylarkinfo.com,training@cloudnloud.com,darmesh@skylarkinfo.com
username=navaneethan@skylarkinfo.com
password=tn09bk1329
subject1=$client_name-Critical-CPU-Alert
subject2=$client_name-Warning-2-CPU-Alert
subject3=$client_name-Warning-1-CPU-Alert
gmail_gateway=smtp.gmail.com:587
body_text=/tmp/mailbody_cpu.txt

# OS section

redhat_os_type=$(cat /etc/redhat-release  | grep -iw redhat | awk '{print $1}')
ubuntu_os_type=$(lsb_release -d | awk '{print $2}')
cent_os_type=$(cat /etc/redhat-release  | grep -iw centos | awk '{print $1}')

# Calculate CPU section
cpu=`top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}' | awk -F . '{print $1}'`
cpu_core=`grep -c ^processor /proc/cpuinfo`
cpu_precentage=`top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'`

if [ "$redhat_os_type" == Redhat ];
then

if [  $(rpm -qa | grep sendemail | wc -l) -eq 0 ];
then
    yum install sendemail -q -y
fi

if [ $cpu -gt 80 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) Usage in Critical State - $cpu_precentage" > $body_text
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"

elif [ $cpu -gt 75 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) Usage in Warning - II State - $cpu_precentage" > $body_text
    sendemail -f "$from_address" -u "$subject2" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
elif [ $cpu -gt 70 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) in Warning - I State - $cpu_precentage" > $body_text
    sendemail -f "$from_address" -u "$subject3" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
fi

elif [ "$cent_os_type" == CentOS ];
then

if [  $(rpm -qa | grep sendemail | wc -l) -eq 0 ];
then
    yum install sendemail -q -y
fi

if [ $cpu -gt 80 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) Usage in Critical State - $cpu_precentage" > $body_text
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"

elif [ $cpu -gt 75 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) Usage in Warning - II State - $cpu_precentage" > $body_text
    sendemail -f "$from_address" -u "$subject2" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
elif [ $cpu -gt 70 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) in Warning - I State - $cpu_precentage" > $body_text
    sendemail -f "$from_address" -u "$subject3" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
fi

elif [ "$ubuntu_os_type" == Ubuntu  ];
then

if [  $(dpkg -s sendemail | wc -l) -eq 0 ];
then
    apt install sendemail -q -y
fi

if [ $cpu -gt 80 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) Usage in Critical State - $cpu_precentage" > $body_text
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"

elif [ $cpu -gt 75 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) Usage in Warning - II State - $cpu_precentage" > $body_text
    sendemail -f "$from_address" -u "$subject2" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"

elif [ $cpu -gt 70 ];
then
    echo "server name: $(hostname) - CPU ($cpu_core core) in Warning - I State - $cpu_precentage" > $body_text
    sendemail -f "$from_address" -u "$subject3" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
fi

fi

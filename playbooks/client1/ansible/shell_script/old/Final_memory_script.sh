#!/usr/bin/env bash
#variable section
client_name=Skylark
from_address=navaneethan@skylarkinfo.com
to_address=navaneethan@skylarkinfo.com,selva@skylarkinfo.com,training@cloudnloud.com,darmesh@skylarkinfo.com
username=navaneethan@skylarkinfo.com
password=tn09bk1329
subject1=$client_name-Critical-Memory-Alert
subject2=$client_name-Warning-2-Memory-Alert
subject3=$client_name-Warning-1-Memory-Alert
gmail_gateway=smtp.gmail.com:587
body_text=/tmp/mailbody.txt

# OS section

redhat_os_type=$(cat /etc/redhat-release  | grep -iw redhat | awk '{print $1}')
ubuntu_os_type=$(lsb_release -d | awk '{print $2}')
cent_os_type=$(cat /etc/redhat-release  | grep -iw centos | awk '{print $1}')

memory=`free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }' | awk -F . '{print $1}'`
memory_precentage=`free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'`

if [ "$redhat_os_type" == Redhat ];
then

if [  $(rpm -qa | grep sendemail | wc -l) -eq 0 ];
then
    yum install sendemail -q -y
fi

if [ $memory -gt 80 ];
then
  echo "server name: $(hostname) - Memory usage in Intermidiate state - $memory_precentage" > /tmp/mailbody.txt
  sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
elif [ $memory -gt 75 ];
then
    echo "server name: $(hostname) - Memory usage in Intermidiate state - $memory_precentage" > /tmp/mailbody.txt 
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
elif [ $memory -gt 70 ];
then
    echo "server name: $(hostname) - Memory usage in Intermidiate state - $memory_precentage" > /tmp/mailbody.txt 
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
fi








elif [ "$cent_os_type" == CentOS ];
then

if [  $(rpm -qa | grep sendemail | wc -l) -eq 0 ];
then
    yum install sendemail -q -y
fi


if [ $memory -gt 80 ];
then
    echo "server name: $(hostname) - Memory usage in Intermidiate state - $memory_precentage" > /tmp/mailbody.txt
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
elif [ $memory -gt 75 ];
then
    echo "server name: $(hostname) - Memory usage in Intermidiate state - $memory_precentage" > /tmp/mailbody.txt 
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
elif [ $memory -gt 70 ];
then
    echo "server name: $(hostname) - Memory usage in Intermidiate state - $memory_precentage" > /tmp/mailbody.txt 
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
fi

elif [ "$ubuntu_os_type" == Ubuntu  ];
then

if [  $(dpkg -s sendemail | wc -l) -eq 0 ];
then
    apt install sendemail -q -y
fi

if [ $memory -gt 80 ];
then
    echo "server name: $(hostname) - Memory usage in Intermidiate state - $memory_precentage" > /tmp/mailbody.txt
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
elif [ $memory -gt 75 ];
then
    echo "server name: $(hostname) - Memory usage in Intermidiate state - $memory_precentage" > /tmp/mailbody.txt 
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
elif [ $memory -gt 70 ];
then
    echo "server name: $(hostname) - Memory usage in Intermidiate state - $memory_precentage" > /tmp/mailbody.txt 
    sendemail -f "$from_address" -u "$subject1" -t "$to_address" -s "$gmail_gateway" -o tls=yes -xu "$username" -xp "$password" -o message-file="$body_text"
fi

fi

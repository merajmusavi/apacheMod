#!/bin/bash
# check if apache2 is installed and running

if ! dpkg -l | grep -q 'apache2';then
        echo "install apache at first"
        exit 1
fi

if [ $# -ne 2 ];then
echo "pass 2 parameters"
exit 1
fi

action="$1"
module="$2"

su - root

if [ "$action" = "enable" ];then
        a2enmod "$module"
        echo "enabled $module"
elif ["$action" = "disable"];then
        a2dismod "$module"
        echo "disabled"
else
        echo "invalid format"
        exit 1
fi
   

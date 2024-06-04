#!/bin/bash

#colours
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
turquoise="\e[0;36m\033[1m"


trap ctrl_c SIGINT

ctrl_c (){
	echo -e "\n${red}[!] Saliendo...${end}"
	exit 1
}

clear

echo -e "${turquoise}Escribe el nombre del usuario a buscar: ${end}"
read name

comando=$(grep $name /etc/passwd)


if [ $? -eq 0 ]; then
   echo -e "\t${yellow}El usuario -$name-, ${end}${green}si${end}${yellow} existe en el sistema${end}"
   grupo=$(groups $name | cut -d':' -f2)
   echo -e "\n\t${green}Y pertenece a los siguientes grupos: ${end}\n\t$grupo\n"
else
   echo -e "\t${red}[!]El usuario -$name-, no existe en el sistema${end}\n"
fi


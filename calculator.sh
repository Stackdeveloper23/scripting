#!/bin/bash

#colours
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

trap ctrl_c SIGINT

# Funciones

  ctrl_c() {
   echo -e "\n\n\t${red}[*]Saliendo...\n${end}"
  exit 1
  }

# main
clear
echo -e "${turquoise}- Primer numero -${end}"
read -p "Escriba un numero: " num1
echo -e "\n${purple}- Operador -${end}"
read -p "Escriba la operacion a realizar ( + - * / ): " operador
echo -e "\n${turquoise}- Segundo numero-${end}"
read -p "Escriba el segundo numero: " num2
clear
echo -e "\n${turquoise}Los valores ingresados son: ${end}"

echo -e "${green}Valor1\tValor2${end}\tResultado"
echo -e "------\t-------\t-----------"
echo -e "${purple}$num1  \t$num2${end}   \t0"
sleep 2
clear
echo -e "\n${gray}La operacion a realizar es: ${end}${blue}$num1 $operador $num2 ${end}"
sleep 2 
clear
resultado=`echo "$num1 $operador $num2" | bc`
echo -e "\n${yellow}El resultado de la operacion es: ${end}"

echo -e "Valor1\tValor2\t${green}Resultado${end}"
echo -e "-------------------------------"
echo -e "${purple}$num1    $operador    $num2${end}\t${green}= $resultado${end}"


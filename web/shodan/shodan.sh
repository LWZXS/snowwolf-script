#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"
BASH=/bin/bash
SHODAN=/usr/local/bin/shodan
API=6qSPeeSy3R3q2Sc88YthJHu9YW6MPopZ
echo  -e "$BLUE       					                      
 sssssssss   HH    HH  OOOOOO  DDDDDD       A      NNNN    NN
sssssssssss  HH    HH OOOOOOOO DD   DD     A A     NNNN    NN
ss           HHHHHHHH OO    OO DD    DD   A   A    NN  NN  NN 
sssssssssss  HHHHHHHH OO    OO DD    DD  AAAAAAA   NN   NN NN  
         ss  HH    HH OO    OO DD    DD A       A  NN    NNNN 
ssssssssss   HH    HH OO    OO DD   DD A         A NN     NNN  
ssssssssss   HH    HH  OOOOOO  DDDDDD A           ANN      NN
BY:Snow wolf 
$RESET"
$SHODAN init $API
echo -e "[$GREEN 1.host    View all available information for an IP...$RESET]"
echo -e "[$GREEN 2.search  Search the Shodan database$RESET]"
echo -e "[$GREEN 3.count   Returns the number of results for a search$RESET]"
echo -e "[$GREEN 4.myip    Print your external IP address$RESET]"
echo -e "[$GREEN q/Q       return $RESET]"
read -p "Snow wolf:" NUMBER
case $NUMBER in
1)echo
    $BASH web/shodan/host.sh
    ;;
2)echo
    $BASH web/shodan/search.sh
   ;;
3)echo
   $BASH web/shodan/count.sh
   ;;
4)echo
   $SHODAN myip
   $BASH web/shodan/shodan.sh
  ;;
q|Q)echo
    $BASH Snowwolf.sh
    ;;
esac


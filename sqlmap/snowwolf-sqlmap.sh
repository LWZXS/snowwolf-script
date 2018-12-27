#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"
SQLMAP_PATH=/usr/share/sqlmap/sqlmap.py
COOKIE_SCRIPT=sqlmap/cookie.sh
POST_SCRIPT=sqlmap/post.sh
BASH=/bin/bash
echo  -e "$BLUE       					                      
 SSSSSS   QQQQQQQQ   LL     MM         MM     A      PPPPPP
SSSSSSSS QQQQQQQQQQ  LL     MMM       MMM    A A     P     P
SS       QQ      QQ  LL     M M       M M   A   A    P     P
SSSSSSSS QQ    Q QQ  LL     M  M     M  M  AAAAAAA   PPPPPP
      SS QQ     QQQ  LL     M   M   M   M A       A  P
SSSSSSSS  QQQQQQQQQ  LL     M    M M    MA         A P
 SSSSSS            Q LLLLLLLM     M     M            P
BY:Snow wolf
$RESET"
echo  -e "[$GREEN 1.injection $RESET]"
echo  -e "[$GREEN 2.cookie  injection   $RESET]"
echo  -e "[$GREEN 3.post  injection $RESET]"
echo  -e "[$GREEN q/Q     return $RESET]"
read -p 'Snowwolf:' SQLMAP_SCRIPT
case $SQLMAP_SCRIPT in
1)echo
     $BASH sqlmap/snowwolf-injection.sh
     ;;

2)echo
     $BASH $COOKIE_SCRIPT
     ;;
3)echo
     $BASH $POST_SCRIPT
     ;;
q|Q)echo
  $BASH Snowwolf.sh
esac 


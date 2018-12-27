#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"
BASH=/bin/bash
SHODAN=/usr/local/bin/shodan
PYTHON=/usr/bin/python
echo  -e "$BLUE       					                      
SSSSSSSSS  EEEEEEEEE       A      RRRRRR    CCCCCCCC H     H
SSSSSSSSSS EE       E     A A     R     R   CCC      H     H
SS         EE       E    AAAAA    R     R   CC       HHHHHHH
SSSSSSSSSS EEEEEEEEE    AA   AA   RRRRRR    CC       HHHHHHH
        SS EE          AA     AA  R     R   CC       H     H
SSSSSSSSSS EE         AA       AA R      R  CCC      H     H
 SSSSSSSSS EEEEEEEEEEAA         AAR       R CCCCCCCC H     H
BY:Snow wolf   
$RESET"
echo -e "[$GREEN 1.webcamxp$RESET]"
echo -e "[$GREEN 2.supervisor$RESET]"
echo -e "[$GREEN 3.cve-2018-9995 dvr $RESET]"
echo -e "[$GREEN 4.Frequently used image search$RESET]"
echo -e "[$GREEN 5.tomcat$RESET]"
echo -e "[$GREEN 6.webcam$RESET]"
echo -e "[$GREEN 7.linux upnp avtech$RESET]"
echo -e "[$GREEN 8.netcam$RESET]"
echo -e "[$GREEN 9.default password$RESET]"
echo -e "[$GREEN 10.dreambox$RESET]"
echo -e "[$GREEN 11.CarelDataServer$RESET]"
echo -e "[$GREEN 12.Auther: Steven Wu$RESET]"
echo -e "[$GREEN 13.Techno Vision Security System$RESET]"
echo -e "[$GREEN 14.Server: U S Software Web Server$RESET]"
echo -e "[$GREEN 15.Android Webcam$RESET]"
echo -e "[$GREEN 16.SecuritySpy$RESET]"
echo -e "$GREEN  q/Q return$RESET"
read -p "Snow wolf:" NUMBER
case $NUMBER in
1)echo
    $SHODAN search --fields ip_str,port,org,hostnames webcamxp
    $BASH web/shodan/shodan.sh
    ;;
2)echo
    $SHODAN search --fields ip_str,port,org,hostnames supervisor
    $BASH web/shodan/shodan.sh
    ;;
3)echo
    $SHODAN search --fields ip_str,port,org,hostnames /login.rsp
    $BASH web/shodan/shodan.sh
    ;;
4)echo
    $SHODAN search --fields ip_str,port,org,hostnames "Server: uc-httpd 1.0.0 200 OK "
    $BASH web/shodan/shodan.sh
    ;;
5)echo
    $SHODAN search --fields ip_str,port,org,hostnames "tomcat 1.1 200 ok"
    $BASH web/shodan/shodan.sh
    ;;
6)echo
    $SHODAN search --fields ip_str,port,org,hostnames "Server: SQ-WEBCAM"
    $BASH web/shodan/shodan.sh
    ;;
7)echo
    $SHODAN search --fields ip_str,port,org,hostnames "linux upnp avtech"
    $BASH web/shodan/shodan.sh
    ;;
8)echo
    $SHODAN search --fields ip_str,port,org,hostnames netcam
    $BASH web/shodan/shodan.sh
    ;;
9)echo
    $SHODAN search --fields ip_str,port,org,hostnames "default password"
    $BASH web/shodan/shodan.sh
    ;;
10)echo
    $SHODAN search --fields ip_str,port,org,hostnames dreambox
    $BASH web/shodan/shodan.sh
    ;;
11)echo
    $SHODAN search --fields ip_str,port,org,hostnames CarelDataServer
    $BASH web/shodan/shodan.sh
    ;;
12)echo
    $SHODAN search --fields ip_str,port,org,hostnames "Auther: Steven Wu"
    $BASH web/shodan/shodan.sh
    ;;
13)echo
    $SHODAN search --fields ip_str,port,org,hostnames "Techno Vision Security System"
    $BASH web/shodan/shodan.sh
    ;;
14)echo
    $SHODAN search --fields ip_str,port,org,hostnames "Server: U S Software Web Server"
    $BASH web/shodan/shodan.sh
    ;;
15)echo
    $SHODAN search --fields ip_str,port,org,hostnames "Android Webcam Server -Authenticate"
    $BASH web/shodan/shodan.sh
    ;;
16)echo
    $SHODAN search --fields ip_str,port,org,hostnames "title:SecuritySpy"
    $BASH web/shodan/shodan.sh
    ;;
q|Q)echo
    $BASH web/shodan/shodan.sh
    ;;
esac


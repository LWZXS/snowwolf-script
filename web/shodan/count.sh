#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"
BASH=/bin/bash
SHODAN=/usr/local/bin/shodan
read -p "please input server name : " SERVER
$SHODAN count $SERVER
$BASH web/shodan/shodan.sh

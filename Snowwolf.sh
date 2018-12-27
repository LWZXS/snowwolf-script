#!/bin/bash
RED="\033[31m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"
BASH="/bin/bash"
PYTHON="/usr/bin/python"
echo  -e "$BLUE 		   			                          
                                                                      =h. 'BN+
     .-NNNh.                                                          =h. .B+.
     (B.  -+                                                          =h. 'B-.
     D+  .    .                                                       =h. -N-          
    .Ds      .zz(NNB.  .'BNNN(  =h. .=h. .=z...=h.  =h. .=z  'BNNN(   =h.=NNNB-
     =Nz.   ..zN+. Ds  ~N(  'B+ ~B-..DB- .z(..  .~B- .BB- .z(.-B(  'B+=h. ~B-
    .'<NBs   .zD'. (B..D+    (B..D(.~Bz+ 'B-. ..D~ ~Bh+ 'B-.D+ ...(B. =h. -B-.
     .. =NB' .zs.  (B''B(    -N-.+s.<z(h.(h. =z.<z(h.(D. 'B(      -B- +h. -B-.
       ...zD..zz.  (B''B~    -B-.(D'z('D.++ <h.z('B.++.'  B(      -N  =h  -B-.
        .'-B..zz'  (B..B+  ..(B. -B~D..h(h' 'B(D..z<h- .  B+      (B. =h. -B-.
    .D- ..zs .zz.  (B'.<N(  ~N(  .z=s .<Dz. .'z=s .<Dz. .<N(     -N(  =h. -N-.
     .BNNN+                               ..(N~  'B+.      .~NNNN-    =h. -N-
BY:Snow wolf
$RESET"
echo  -e "$GREEN 1.dns $RESET"
echo  -e "$GREEN 2.whois   $RESET"
echo  -e "$GREEN 3.scan port $RESET"
echo  -e "$GREEN 4.shodan $RESET"
echo  -e "$GREEN 5.sqlmap $RESET"
echo  -e "$GREEN 6.scan web file $RESET"
echo  -e "$GREEN 7.url_collection$RESET"
echo  -e "$GREEN q/Q.quit $RESET"
read -p 'Snowwolf:' SCRIPT_RUN
case $SCRIPT_RUN in
1)echo
     $PYTHON web/snowwolf-dns.py 
     ;;
2)echo
     read -p 'please input whois ip:' WHOIS
     $PYTHON web/snowwolf-whois.py $WHOIS
    ;;
3)echo
    read -p 'please input ip or network segment:' NMAP
    echo -e "[$GREEN  if multiple segments or ip  scan , please add manually in host/ip.txt $RESET]"
    echo -e "\n$NMAP" > web/host/ip.txt
  $PYTHON web/snowwolf-scanport.py
    ;;
4)echo
  $BASH web/shodan/shodan.sh
  ;;
5)echo
   $BASH sqlmap/snowwolf-sqlmap.sh
    ;;
6)echo
   read -p 'please input domain(example:http://www.baidu.com):' HOST
   read -p 'please input threads(example:5):' THREADS
   read -p 'please input dictionary file :' FILE
   $PYTHON web/scanweb.py -host $HOST -t $THREADS  -f $FILE
   ;;
7)echo
   read -p 'please input collect rntry:' COLLECT
   read -p 'please input pages(more):' PAGES
   read -p 'please input threads:' THREADS
   read -p 'please input output file name:' OUTPUT
   $PYTHON web/url_collection.py "$COLLECT" -p $PAGES -t $THREADS -o $OUTPUT
   ;;
q|Q)echo
   echo "Good bye,Thank you for using my script."
   ;;
esac 

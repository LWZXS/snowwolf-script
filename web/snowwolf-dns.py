#!/usr/bin/python
import sys,socket
logo="""
DDDDDDDD    NNNN     NN    SSSSSSSSS
DD     DD   NNNN     NN  SSSSSSSSSSSS
DD      DD  NN NN    NN  SS
DD       DD NN  NN   NN  SS
DD       DD NN   NN  NN  SSSSSSSSSSSS
DD       DD NN    NN NN    SSSSSSSSSS
DD      DD  NN     NNNN            SS
DD     DD   NN      NNN  SSSSSSSSSSSS
DDDDDDDD    NN       NN   SSSSSSSSSSS
BY: Snow wolf
"""
print (logo)
def print_array(*arr):
    array = arr
    for item in array:
        print item[4][0]
print '''dns resolve
"start...
if you want to quit,please input "q"'''
while 1:
    try:
        host = raw_input("please input the host: ")
    except KeyboardInterrupt:
        print "\n",
        continue
    except :
        print "\n",
        continue
    if host == "q" or host == "":
        break
    result = socket.getaddrinfo(host,None,0,socket.SOCK_STREAM)
    print_array(*result)

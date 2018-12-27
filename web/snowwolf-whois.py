import sys
import socket
logo="""
WW           WWWW             WW HH     HH   OOOOOO   IIII  SSSSSSSS
 WW          WWWW            WW  HH     HH  OOOOOOOO  IIII  SSSSSSSSS
  WW        WW  WW          WW   HH     HH  OO    OO        SS
   WW      WW    WW        WW    HHHHHHHHH  OO    OO  IIII  SSS
    WW    WW      WW      WW     HHHHHHHHH  OO    OO  IIII   SSSSSSSSS
     WW  WW        WW    WW      HH     HH  OO    OO  IIII          SS
      WWWW          WW  WW       HH     HH  OOOOOOOO  IIII  SSSSSSSSSS
      WWWW           WWWW        HH     HH   OOOOOO   IIII  SSSSSSSSS
BY: Snow wolf 
"""
print (logo)
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("whois.apnic.net", 43))
s.send(sys.argv[1] + "\r\n")

response = ""
while True:
    data = s.recv(4096)
    response += data
    if not data:
        break
s.close()

print response

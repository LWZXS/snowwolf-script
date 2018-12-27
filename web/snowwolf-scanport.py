#!-*-coding=utf-8 -*-#
import nmap
import time
import csv
import os
logo="""
NNNN      NN  MMMM              MMMM           AAAA          PPPPPPPPPPP
NNNN      NN  MMMM              MMMM          AA  AA         PP        PP
NN NN     NN  MM MM            MM MM         AA    AA        PP        PP
NN  NN    NN  MM  MM          MM  MM        AA      AA       PP        PP
NN   NN   NN  MM   MM        MM   MM       AAAAAAAAAAAA      PP       PP
NN    NN  NN  MM    MM      MM    MM      AA          AA     PPPPPPPPP  
NN     NN NN  MM     MM    MM     MM     AA            AA    PP
NN      NNNN  MM      MM  MM      MM    AA              AA   PP
NN       NNN  MM       MMMM       MM   AA                AA  PP
NN        NN  MM        MM        MM  AA                  AA PP
BY: Snow wolf
"""
print(logo)
class Port_Scan(object):
    def __init__(self):
        self.rootpath = 'web/host/'
        self.dirpath = 'web/portScan/'
        self.savepath = 'web/portScan/result.csv'
        self.csv_write = []

    def get_ip(self, file):
        ipList = []
        with open(file, 'r') as f:
            for ip in f.readlines()[1:]:
                ipList.append(ip.strip()[:16])
        return ipList

    def scan(self, ip):
        if not os.path.exists(self.dirpath):
            os.mkdir(self.dirpath)
        nm = nmap.PortScanner()
        try:
            nm.scan(ip, arguments='1-65535')
            print '[*]Host:%s' % ip
            for proto in nm[ip].all_protocols():
                lport = nm[ip][proto].keys()
                lport.sort()
                for port in lport:
                    self.csv_write.append([ip, port, nm[ip][proto][port]['state']])
                    print 'port : %s\tstate : %s' % (port, nm[ip][proto][port]['state'])
        except:
            self.csv_write.append([ip, 'unknown', 'unknown'])
            print 'port : unknown\tstate : unknown'

    def run(self):
        print '[+]Scanning...'
        startTime = time.time()
        files = os.listdir(self.rootpath)
        for file in files:
            ips = self.get_ip(self.rootpath + file)
            
            for ip in ips:
                self.scan(ip)
        with open(self.savepath,'w') as f:
            fieldnames = ['ip', 'port', 'state']
            w = csv.writer(f, dialect='excel')
            w.writerow(fieldnames)
            w.writerows(self.csv_write)
        endTime = time.time()
        print '------------------------------------------------------'
        print '[+]Scanning cost %ss, result have saved %s' % (endTime - startTime, self.savepath)
        print '[+]Done.'

if __name__ == '__main__':
    myScan = Port_Scan()
    myScan.run()

# coding:utf-8

import requests
from threading import Thread
import sys
import getopt

def banner():
    print("\n_______________________________________________________________________________")
    name = '''
sssssssss  cccccccc  aaaaaaaa   nn     n  fffffff ii  l       eeeeee
s        cc         a        a  n n    n  f       ii  l       e
s        cc         a        a  n  n   n  f           l       e
ssssssssscc         a        a  n   n  n  fffffff ii  l       eeeeee
        scc         a        a  n    n n  f       ii  l       e
        scc         a       a a n     nn  f       ii  l       e
ssssssss   cccccccc  aaaaaaa   an      n  f       ii  lllllll eeeeee
    '''
    print(name)
    print("Snow wolf scan web file")
    print("\n_______________________________________________________________________________")


def usage():
    print("用法：")
    print("usage: ")
    print("        -h:网址")
    print("           website")
    print("        -t:线程数")
    print("           threads")
    print("        -f:字典文件")
    print("           dictionary file")
    print("例子example: scanweb.py -h http://www.baidu.com -t 5 -f wordlist.txt")
class request_performer(Thread):
    def __init__(self,word,url):
        Thread.__init__(self)
        try:
            self.word = word.split("\n")[0]
            self.urly = url.replace('FUZZ',self.word)
            self.url = self.urly
        except Exception as e:
            print(e)
    def run(self):
        try:
            r = requests.get(self.url)
            print(self.url,"-------",str(r.status_code))
            i[0] = i[0] -1
        except Exception as e:
            print(e)
def launcher_thread(names,th,url):
    global i
    i = []
    resultlist = []
    i.append(0)
    while len(names):
        try:
            if i[0] < th:
                n = names.pop(0)
                i[0] = i[0]+1
                thread = request_performer(n,url)
                thread.start()
        except KeyboardInterrupt:
            print("用户停止了程序运行。完成探测")
            sys.exit()
    return True
def start(argv):
    banner()
    if len(sys.argv) < 5:
        usage()
        sys.exit()
    try:
        opts,args = getopt.getopt(sys.argv[1:],"h:t:f:")
    except getopt.GetoptError:
        print("错误的参数")
        sys.exit()
 
    for opt,arg in opts:
        if opt == '-h':
            url = arg
        elif opt == '-f':
            dicts = arg
        elif opt == '-t':
            threads = int(arg)
 
    try:
        f = open(dicts,'r')
        words = f.readlines()
    except Exception as e:
        print("打开文件错误：",dicts,"\n")
        print(e)
        sys.exit()
 
    launcher_thread(words,threads,url)
if __name__ == '__main__':
    try:
        start(sys.argv[1:])
    except KeyboardInterrupt:
        print("用户停止了程序运行。完成探测")
    
    

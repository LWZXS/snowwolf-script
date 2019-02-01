# snowwolf-script
集成dns，whois，扫描端口，shodan，sqlmap辅助工具（后期决定删除改为帮助指南），自动化exploit工具
# 安装
apt-get install shodan

pip install -r requirements.txt

chmod +x Snowwolf.sh

请自行安装python2.7环境

安装完成后运行即可
<img src="/image/index.jpg" />
<img src="/image/dns.jpg" />
<img src="/image/caiji.jpg" />
<img src="/image/whois.jpg" />
<img src="/image/nmap.jpg" />
<img src="/image/scanfile.jpg" />
<img src="/image/sqlmap.jpg" />
<img src="/image/shodan.jpg" />
<img src="/image/shodansearch.jpg" />

自动化漏洞利用为cve-exploit.sh脚本，目前仅支持cve-2018-9995,cve-2018-10933,后期慢慢更新

cve-2018-9995可以配合shodan进行利用

字典目录为wordlist

——————————————————————————————————————————————————————

本来想写单个单个的工具，索性正好集成在一起，用shell做了个简单的控制台

我的博客：http://blog.51cto.com/superwolf

# 为开源而奋斗

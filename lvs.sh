#!/bin/bash

webnet="jxstu_webnet"
appnet="jxstu_appnet"
dinfo="docker inspect"

# 获取web区域app区域网关
jx_web_gw=`$dinfo $webnet | grep Gateway | awk -F "\"" '{print $4}'`
jx_app_gw=`$dinfo $appnet | grep Gateway | awk -F "\"" '{print $4}'`
# 获取app区域apache1和apache2地址
jx_apache_1=`$dinfo jx-apache-1 | grep IPAddress..*\"..*\" | head -n 1 | awk -F "\"" '{print $4}'`
jx_apache_2=`$dinfo jx-apache-2 | grep IPAddress..*\"..*\" | head -n 1 | awk -F "\"" '{print $4}'`

# 获取web区域和app区域虚拟交换机名字
br_web=`ip r | grep $jx_web_gw | awk '{print $3}'`
br_app=`ip r | grep $jx_app_gw | awk '{print $3}'`
# 将web和app区域虚拟交换机连通
iptables -I DOCKER-USER -o $br_web -i $br_app -j ACCEPT
iptables -I DOCKER-USER -i $br_web -o $br_app -j ACCEPT

# 清空宿主机LVS-NAT规则
ipvsadm -C
# 添加web区域网关作为NAT虚拟地址
ipvsadm -A -t $jx_web_gw:80 -s rr
# 添加app区域两台apache作为真实服务器
ipvsadm -a -t $jx_web_gw:80 -r $jx_apache_1:80 -m
ipvsadm -a -t $jx_web_gw:80 -r $jx_apache_2:80 -m
ipvsadm -L -n

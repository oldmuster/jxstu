#!/bin/bash

# 检查是否第一次启动
if [ ! -e "/chkfirst" ]; then
  # 创建检查标记
  touch /chkfirst
  # 根据用户指定配置业务区域访问地址 把.sh结尾的URL交给它处理
  echo "ProxyPassMatch ^(/.*.sh) http://$APP_ADDR/" >> /etc/httpd/conf/httpd.conf
  
  # 根据指定配置DR的虚拟地址
  ip a add $VIP/32 dev lo label lo:0
  
  # 开启ARP抑制和配置ARP告知对象
  echo 1 > /proc/sys/net/ipv4/conf/all/arp_ignore 
  echo 2 > /proc/sys/net/ipv4/conf/all/arp_announce
fi

# 开启apache占用前端
httpd -D FOREGROUND

#!/bin/bash

if [ ! -e "/chkfirst" ]; then
  touch /chkfirst
  # 替换动态区域负载均衡地址
  echo "ProxyPassMatch ^(/.*.sh) http://$APP_ADDR/" >> /etc/httpd/conf/httpd.conf
  ip a add $VIP/32 dev lo label lo:0
  echo 1 > /proc/sys/net/ipv4/conf/all/arp_ignore 
  echo 2 > /proc/sys/net/ipv4/conf/all/arp_announce
fi

# 占用前端启动apache
httpd -D FOREGROUND

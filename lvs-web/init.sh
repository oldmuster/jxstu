#!/bin/bash

if [ ! -e "/chkfirst" ]; then
  # 添加虚拟地址
  ip a add $VIP dev eth0 label eth0:0
  # 配置DR负载均衡虚拟地址
  ipvsadm -A -t $VIP:80 -s rr
  # 配置DR负载均衡真实服务器地址
  ipvsadm -a -t $VIP:80 -r $RIP1:80 -g
  ipvsadm -a -t $VIP:80 -r $RIP2:80 -g
fi
sleep 9999999999999


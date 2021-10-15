#!/bin/bash

if [ ! -e "/chkfirst" ]; then
  touch /chkfirst
  # 根据指定配置DR的虚拟地址
  ip a add $VIP/32 dev eth0 label eth0:0
  
  # 根据参数配置真实服务器
  ipvsadm -A -t $VIP:80 -s rr
  ipvsadm -a -t $VIP:80 -r $RIP1:80 -g
  ipvsadm -a -t $VIP:80 -r $RIP2:80 -g
fi

sleep 999999999999

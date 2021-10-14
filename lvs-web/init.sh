#!/bin/bash

if [ ! -e "/chkfirst" ]; then
  ip a add $VIP dev eth0 label eth0:0
  ipvsadm -A -t $VIP:80 -s rr
  ipvsadm -a -t $VIP:80 -r $RIP1:80 -g
  ipvsadm -a -t $VIP:80 -r $RIP2:80 -g
fi
sleep 9999999999

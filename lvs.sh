#!/bin/bash

webnet=$1
appnet=$2
webvip=$3
dinfo="docker inspect"

jx_app_vip=`$dinfo $webnet | grep Gateway | awk -F "\"" '{print $4}'`
jx_apache_1=`$dinfo jx-apache-1 | grep IPAddress..*\"..*\" | head -n 1 | awk -F "\"" '{print $4}'`
jx_apache_2=`$dinfo jx-apache-2 | grep IPAddress..*\"..*\" | head -n 1 | awk -F "\"" '{print $4}'`

ipvsadm -C
ipvsadm -A -t $jx_app_vip:80 -s rr
ipvsadm -a -t $jx_app_vip:80 -r $jx_apache_1:80 -m
ipvsadm -a -t $jx_app_vip:80 -r $jx_apache_2:80 -m
ipvsadm -L -n

docker run -dit --name jx-web-1 -e VIP=$webvip -e APP_SERVER=$jx_app_vip --privileged --net $webnet nginx-web:1.1
docker run -dit --name jx-web-2 -e VIP=$webvip -e APP_SERVER=$jx_app_vip --privileged --net $webnet nginx-web:1.1
docker run -dit --name jx-web-lvs -e VIP=$webvip -e RIP1=jx-web-1 -e RIP2=jx-web-2 --privileged --net $webnet web-lvs:1.1
docker run -dit --name jx-web-cli --privileged --net $webnet mainpage:1.0

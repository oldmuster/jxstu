#!/bin/bash

if [ ! -e "/qwert" ]; then
  touch /qwert
  # 根据启动参数配置数据库地址
  sed -i "s/192.168.5.250/$MYSQL_ADDR/g" /var/www/html/head.sh
  # 根据启动参数配置数据库端口
  sed -i "s/8066/$MYSQL_PORT/g" /var/www/html/head.sh
  # 根据启动参数配置数据库地址
  sed -i "s/root/$MYSQL_USER/g" /var/www/html/head.sh
  # 根据启动参数配置数据库地址
  sed -i "s/123/$MYSQL_PASSWD/g" /var/www/html/head.sh
  # 根据启动参数配置数据库地址
  sed -i "s/jx/$MYSQL_DB/g" /var/www/html/head.sh
  # 给网页脚本增加权限
  chmod +x /var/www/html/*.sh
  # 启动apache占用前台
  httpd -D FOREGROUND
else
  httpd -D FOREGROUND
fi

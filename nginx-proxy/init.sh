#!/bin/bash

if [ ! -e "/chkfirst" ]; then
  touch /chkfirst
  # 根据用户配置替换第1台apache地址
  sed -i "s/apache1/$APACHE_1/g" /etc/nginx/conf.d/default.conf
  # 根据用户配置替换第2台apache地址
  sed -i "s/apache2/$APACHE_2/g" /etc/nginx/conf.d/default.conf
fi
# 启动nginx
nginx
# 占用前端
sleep 999999999

#!/bin/bash

if [ ! -e "/qwert" ]; then
  touch /qwert
  # 根据启动参数配置首页文件
  echo $CONTENT > /var/www/html/index.html
  # 启动apache占用前台
  httpd -D FOREGROUND
else
  httpd -D FOREGROUND
fi

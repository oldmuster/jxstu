#!/bin/bash

if [ ! -e "/sdfsdf" ]; then
  touch sdfsdf
  # 根据参数替换主服务器地址
  sed -i "s/aaaaaa/$MASTER_ADDR/g" /usr/local/amoeba/conf/dbServers.xml
  # 根据参数替换从服务器地址
  sed -i "s/bbbbbb/$SLAVE_ADDR/g" /usr/local/amoeba/conf/dbServers.xml
  # 根据参数替换从服务器用户名
  sed -i "s/cccccc/$MYSQL_USER/g" /usr/local/amoeba/conf/dbServers.xml
  # 根据参数替换从服务器密码
  sed -i "s/dddddd/$MYSQL_PASSWD/g" /usr/local/amoeba/conf/dbServers.xml
  # 根据参数替换从数据库名
  sed -i "s/eeeeee/$MYSQL_DB/g" /usr/local/amoeba/conf/dbServers.xml
  # 根据参数替换对外用户
  sed -i "s/ffffff/$PROXY_USER/g" /usr/local/amoeba/conf/amoeba.xml
  # 根据参数替换对外密码
  sed -i "s/gggggg/$PROXY_PASSWD/g" /usr/local/amoeba/conf/amoeba.xml
fi
# 启动amoeba
/usr/local/amoeba/bin/amoeba start

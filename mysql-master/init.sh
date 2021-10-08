#!/bin/bash

if [ ! -e "/sdfdsf" ]; then
  touch /sdfdsf
  # 根据指定服务器ID，替换配置文件
  sed -i "s/server-id=/server-id=$SERVER_ID/g" /etc/my.cnf
  # 初始化数据库
  mysql_install_db --user=mysql
  # 启动数据库扔后台
  mysqld_safe &
  while [ ! -e "/var/lib/mysql/mysql.sock" ]; do
    sleep 2
  done
  # 初始化mysql的root密码为用户指定环境变量
  mysqladmin -u root password $ROOT_PASSWD
  # 根据用户指定创建同步用户密码
  mysql -uroot -p$ROOT_PASSWD -e "GRANT REPLICATION SLAVE ON *.* TO \"$SYNC_USER\"@\"%\" IDENTIFIED BY \"$SYNC_PASSWD\""
  # 根据用户指定创建外联用户密码o
  mysql -uroot -p$ROOT_PASSWD -e "GRANT ALL PRIVILEGES ON *.*  TO \"$EXT_USER\"@\"%\" IDENTIFIED BY \"$EXT_PASSWD\" WITH GRANT OPTION"
  # 显示事件位置
  mysql -uroot -p$ROOT_PASSWD -e "show master status"
  # 创建数据库
  mysql -uroot -p$ROOT_PASSWD -e "create database jx"
  # 导入数据
  mysql -uroot -p$ROOT_PASSWD jx < /tmp/jx.sql
else 
  # 启动数据库扔后台
  mysqld_safe &
fi

sleep 88888888888

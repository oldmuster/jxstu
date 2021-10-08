#!/bin/bash


if [ ! -e "/123" ]; then
  touch /123
  # 根据参数指定服务器ID
  sed -i "s/server-id=/server-id=$SERVER_ID/g" /etc/my.cnf
  # 初始化mysql
  mysql_install_db --user=mysql
  # 启动mysql扔到后台
  mysqld_safe &
  # 等待mysql启动
  while [ ! -e "/var/lib/mysql/mysql.sock" ]; do
    sleep 3
  done
  # 根据参数设置root密码
  mysqladmin -uroot password $ROOT_PASSWD
  # 根据参数配置主从
  mysql -uroot -p$ROOT_PASSWD -e "CHANGE MASTER TO MASTER_HOST=\"$SYNC_ADDR\",MASTER_USER=\"$SYNC_USER\",MASTER_PASSWORD=\"$SYNC_PASSWD\",MASTER_LOG_FILE=\"$SYNC_LOG_FILE\",MASTER_LOG_POS=$SYNC_LOG_POS"
  # 开启同步线程
  mysql -uroot -p$ROOT_PASSWD -e "start slave"
  # 查看同步线程状态
  mysql -uroot -p$ROOT_PASSWD -e "show slave status \G"
  # 根据用户指定创建外联用户密码
  mysql -uroot -p$ROOT_PASSWD -e "GRANT ALL PRIVILEGES ON *.*  TO \"$EXT_USER\"@\"%\" IDENTIFIED BY \"$EXT_PASSWD\" WITH GRANT OPTION"
else 
  mysqld_safe &
fi

tail -f /var/log/mysqld.log

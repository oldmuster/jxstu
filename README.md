# jxstu

#### 介绍
{**简易学生成绩系统，Linux运维培训实战项目，docker+宿主机配合搭建**
}

#### 软件架构
1.  数据库包含，ER图、多表查询、主从同步，使用mysql5.5搭建
2.  业务区域包含apache+shell脚本，使用shell脚本实现学生增删改查等业务，还包含nginx七层负载均衡、
3.  宿主机包含lvs-NAT四层负载均衡，链接webnet和appnet两个区域
4.  web区域包含apache和lvs-dr四层负载均衡，实现动静分离
![系统架构图](https://images.gitee.com/uploads/images/2021/1015/104531_fe46cdaa_4897809.png "屏幕截图.png")


#### 安装教程

1.  宿主机安装docker、docker-compose、ipvsadm
2.  下载[centos7-mysql55.tar.gz](http://xpm.cpolar.top/soft/centos7-mysql55.tar.gz)地址，分别解压到apache-cluster、mysql-slave、mysql-master

#### 使用说明

1.  执行docker-compose build构建镜像
2.  执行docker-compose up -d启动镜像 
3.  执行./lvs.sh配置宿主机lvs-nat开启web和app区域连通

#### 注意事项

1.  在apache-web/apache-web.env中写死了web区域网关APP_ADDR=172.20.0.1、web区域DR虚拟地址VIP=172.20.0.100
2.  在lvs-web/lvs-web.env中写死了web区域DR虚拟地址VIP=172.20.0.100
3.  写死配置是在docker安装后无任何网络情况下，因为docker0是172.17.0.0/16，所以dbnet是172.18.0.0/16，appnet是172.19.0.0/16，webnet是172.20.0.0/16
4.  所以需要根据自己环境，预判webnet网络创建后的网络地址

如果有任何问题请发邮件： 553069938@qq.com


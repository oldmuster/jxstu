# 基于centos:7
FROM centos:7

# 拷贝mysql安装包
COPY centos7-mysql55 /tmp/

# 安装mysql和其它工具
RUN yum -y install /tmp/*.rpm iproute psmisc net-tools tcpdump

# 拷贝jx.sql数据文件
COPY jx.sql /tmp/

# 拷贝数据库的配置文件
COPY my.cnf /etc/my.cnf

# 拷贝启动脚本
COPY init.sh /
# 定义开机自动执行此脚本
ENTRYPOINT ["bash", "-x", "/init.sh"]

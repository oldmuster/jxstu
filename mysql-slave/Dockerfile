# 基于centos:7
FROM centos:7

# 拷贝mysql安装包
COPY centos7-mysql55 /tmp/

# 安装mysql和常用工具
RUN yum -y install /tmp/*.rpm iproute psmisc net-tools tcpdump

# 拷贝mysql配置文件
COPY my.cnf /etc/my.cnf

# 拷贝启动脚本，定义入口点
COPY init.sh /
ENTRYPOINT ["bash", "-x", "/init.sh"]

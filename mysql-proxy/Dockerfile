# 基于centos:7
FROM centos:7

# amoeba的依赖和相关工具
RUN yum -y install java-1.8.0-openjdk iproute psmisc net-tools tcpdump

# 拷贝安装包
COPY amoeba-mysql-binary-2.1.0-RC5.tar.gz /tmp/

# 创建amoeba安装目录
RUN mkdir -p /usr/local/amoeba

# 解压amoeba到安装目录
RUN tar -zxf /tmp/amoeba-mysql-binary-2.1.0-RC5.tar.gz -C /usr/local/amoeba

# 拷贝dbServers.xml配置文件
COPY dbServers.xml /usr/local/amoeba/conf/dbServers.xml

# 拷贝amoeba.xml配置文件
COPY amoeba.xml /usr/local/amoeba/conf/amoeba.xml

# 拷贝amoeba启动脚本
COPY amoeba /usr/local/amoeba/bin/amoeba

# 拷贝启动脚本，定义入口点
COPY init.sh /
ENTRYPOINT ["bash", "-x", "/init.sh"]

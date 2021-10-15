# 基于centos:7
FROM centos:7

# 安装lvs和相关工具
RUN yum -y install ipvsadm iproute psmisc net-tools tcpdump

# 定义入口点和启动脚本
COPY init.sh /
ENTRYPOINT ["bash", "-x", "/init.sh"]

# 基于centos:7
FROM centos:7
# 安装apache和相关工具
RUN yum -y install httpd iproute psmisc net-tools tcpdump
# 拷贝启动脚本定义入口点
COPY init.sh /
ENTRYPOINT ["bash", "-x", "/init.sh"]

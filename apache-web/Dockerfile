# 基于centos:7
FROM centos:7

# 安装httpd和相关工具
RUN yum -y install httpd iproute psmisc net-tools tcpdump

# 拷贝静态网页
COPY html /var/www/html/

# 定义入口点和启动脚本
COPY init.sh /
ENTRYPOINT ["bash", "-x", "/init.sh"]

# 基于centos:7构建
FROM centos:7

# 安装
RUN yum -y install httpd iproute psmisc net-tools tcpdump

# 拷贝网页文件
COPY html/ /var/www/html

# 拷贝启动脚本到镜像根目录
COPY init.sh /
# 定义开启容器执行启动脚本
ENTRYPOINT ["bash", "-x", "/init.sh"]

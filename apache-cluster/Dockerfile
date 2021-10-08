# 基于centos:7
FROM centos:7
# 安装apache和相关工具
RUN yum -y install httpd iproute psmisc net-tools tcpdump
# 拷贝网页文件
COPY pages /var/www/html/
# 拷贝配置文件
COPY httpd.conf /etc/httpd/conf/httpd.conf
# 拷贝mysql安装包
COPY centos7-mysql55 /tmp
# 安装mysql
RUN yum -y install /tmp/*.rpm
# 拷贝启动脚本定义入口点
COPY init.sh /
ENTRYPOINT ["bash", "-x", "/init.sh"]

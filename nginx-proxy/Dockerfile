# 基于centos:7构建
FROM centos:7

# 拷贝安装包到/tmp
COPY nginx-1.18.0-1.el7.ngx.x86_64.rpm /tmp/

# 安装
RUN yum -y install iproute psmisc net-tools tcpdump /tmp/*.rpm

# 拷贝修改好的负载均衡配置文件到NGINX配置目录
COPY default.conf /etc/nginx/conf.d/default.conf

# 拷贝启动脚本到镜像根目录
COPY init.sh /
# 定义开启容器执行启动脚本
ENTRYPOINT ["bash", "-x", "/init.sh"]

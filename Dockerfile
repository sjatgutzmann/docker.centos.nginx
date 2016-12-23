#!Dockerfile
FROM centos:7

# Install Nginx
ADD nginx.repo /etc/yum.repos.d/
RUN cd /tmp && \
  curl -O http://nginx.org/keys/nginx_signing.key && \
  rpm --import nginx_signing.key && \
  yum update -y && \
  yum install -y nginx augeas

# Clean Up
RUN yum clean all && rm -rf /tmp/nginx*


EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

FROM masiuchi/docker-mt-test:centos7

RUN yum install -y mysql-server memcached &&\
 yum clean all


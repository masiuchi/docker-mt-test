FROM masiuchi/docker-mt-test:centos6

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["prove"]

RUN yum install -y mysql-server memcached &&\
 yum clean all &&\
 service mysqld start &&\
 mysql -e "create database mt_test character set utf8;" &&\
 mysql -e "grant all privileges on mt_test.* to mt@localhost;"


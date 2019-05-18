FROM masiuchi/docker-mt-test:perl-5.30

RUN apt-get update &&\
\
 DEBIAN_FRONTEND=noninteractive\
 apt-get -y install\
  mysql-server mysql-client\
  memcached &&\
 apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* &&\
\
 service mysql start &&\
 mysql -e "create database mt_test character set utf8;" &&\
 mysql -e "grant all privileges on mt_test.* to mt@localhost identified by 'password';" &&\
 mysql -e "set password for mt@localhost = '';"

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]


FROM ubuntu:precise

RUN apt-get update &&\
 DEBIAN_FRONTEND=nointeractive\
 apt-get -y install\
 apache2\
 mysql-server mysql-client\
 memcached\
 php5 php5-cli php5-mysql php5-gd php5-memcache\
 git make gcc wget curl unzip bzip2\
 libssl-dev libgmp-dev libgd2-xpm-dev libxml2-dev libmysql++-dev libgif-dev libdb-dev

RUN mysqld_safe & sleep 10 &&\
 mysql -e "create database mt_test default character set utf8;" &&\
 mysql -e "grant all privileges on mt_test.* to mt@localhost;"

ENV HOME /root
ENV PATH $PATH:$HOME/.plenv/bin
RUN git clone git://github.com/tokuhirom/plenv.git $HOME/.plenv &&\
 git clone git://github.com/tokuhirom/Perl-Build.git $HOME/.plenv/plugins/perl-build/ &&\
 echo 'eval "$(plenv init -)"'

RUN plenv install 5.18.4 -Duseshrplib &&\
 plenv global 5.18.4 &&\
 plenv rehash
RUN plenv install-cpanm

RUN plenv exec cpanm Alien::ImageMagick JSON::XS

WORKDIR /root
COPY t/cpanfile .
RUN plenv exec cpanm --installdeps . &&\
 rm -rf cpanfile /root/.cpanm/


FROM ubuntu:precise

ENV PERL_VERSION=5.18.4\
 DEBIAN_FRONTEND=nointeractive\
 HOME=/root\
 PATH=$PATH:/root/.plenv/bin

RUN apt-get update &&\
 apt-get -y install\
 apache2\
 mysql-server mysql-client\
 memcached\
 php5 php5-cli php5-mysql php5-gd php5-memcache\
 git make gcc wget curl unzip bzip2\
 libssl-dev libgmp-dev libgd2-xpm-dev libxml2-dev libmysql++-dev libgif-dev libdb-dev

WORKDIR /root
RUN  wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 &&\
 tar jxf phantomjs-1.9.8-linux-x86_64.tar.bz2 &&\
 cp phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/ &&\
 rm -rf phantomjs-1.9.8-linux-x86_64*

RUN mysqld_safe & sleep 10 &&\
 mysql -e "create database mt_test default character set utf8;" &&\
 mysql -e "grant all privileges on mt_test.* to mt@localhost;"

RUN git clone git://github.com/tokuhirom/plenv.git $HOME/.plenv &&\
 git clone git://github.com/tokuhirom/Perl-Build.git $HOME/.plenv/plugins/perl-build/ &&\
 echo 'eval "$(plenv init -)"'

RUN plenv install ${PERL_VERSION} -Duseshrplib &&\
 plenv global ${PERL_VERSION} &&\
 plenv rehash
RUN plenv install-cpanm

RUN plenv exec cpanm --quiet Alien::ImageMagick JSON::XS

COPY movabletype/t/cpanfile .
RUN plenv exec cpanm --quiet --installdeps . &&\
 rm -rf cpanfile /root/.cpanm/


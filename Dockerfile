FROM ubuntu:trusty

RUN apt-get update &&\
 DEBIAN_FRONTEND=noninteractive\
 apt-get -y install\
 apache2\
 php5 php5-cli php5-mysql php5-gd php5-memcache\
 git make gcc wget curl unzip bzip2\
 perl perlmagick\
 phantomjs\
 libssl-dev libgmp-dev libgd2-xpm-dev libpng12-dev libgif-dev libjpeg-dev netpbm libxml2-dev libmysql++-dev libgif-dev libdb-dev

WORKDIR /root

COPY movabletype/t/cpanfile .
RUN curl -sL --compressed https://git.io/cpm > cpm &&\
 chmod +x cpm &&\
 mv cpm /usr/local/bin/ &&\
 cpm install -g --test JSON::XS TAP::Harness::Env Test::Base &&\
 cpm install -g --test &&\
 rm -rf cpanfile /root/.cpm/


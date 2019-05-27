FROM masiuchi/perl:jessie-5.30

WORKDIR /root

RUN apt-get update &&\
\
 apt-get -y install\
  apache2\
  php5 php5-cli php5-mysql php5-gd php5-memcache phpunit\
  git make gcc wget curl unzip bzip2\
  perl perlmagick libcrypt-ssleay-perl\
  libssl-dev libgmp-dev libgd2-xpm-dev libpng-dev libgif-dev libjpeg-dev netpbm libxml2-dev libmysql++-dev libgif-dev libdb-dev &&\
 apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* &&\
\
  wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 &&\
  tar jxf phantomjs-1.9.8-linux-x86_64.tar.bz2 &&\
  cp phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/ &&\
  rm -rf /phantomjs-1.9.8-linux-x86_64* &&\
\
 curl -L https://cpanmin.us | perl - App::cpanminus &&\
 cpanm JSON::XS TAP::Harness::Env Test::Base PPI@1.246 XMLRPC::Transport::HTTP Wight &&\
 wget https://raw.githubusercontent.com/movabletype/movabletype/5e636cc16c7c3f96215c8f52d2715cfd835e5584/t/cpanfile &&\
 cpanm --installdeps . &&\
 rm -rf cpanfile /root/.cpanm/ &&\
\
 curl -sL https://phar.phpunit.de/phpunit-4.8.36.phar > phpunit &&\
 chmod +x phpunit &&\
 mv phpunit /usr/local/bin/


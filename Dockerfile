FROM php:5.3

RUN apt-get update &&\
 apt-get -y install\
  perl perl-magick


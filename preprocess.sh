#!/bin/sh

set -eu

find /var/lib/mysql -type f | xargs touch && service mysql start
service memcached start

while ! nc -z localhost 3306; do sleep 3; done

mysql -e "create database mt_test character set utf8;"
mysql -e "grant all privileges on mt_test.* to mt@localhost;"


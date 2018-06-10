#!/bin/sh

apt-get update
apt-get install -y --no-install-recommends mysql-client netcat

while ! nc -z localhost 3306; do sleep 3; done
mysql -e 'set password for mt = "";'


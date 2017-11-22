#!/bin/sh

apt-get install -y --no-install-recommends mysql-client
mysql -e 'set password for mt = '';'

prove t plugins/*/t


#!/bin/bash
set -e

service mysqld start
service memcached start

exec "$@"


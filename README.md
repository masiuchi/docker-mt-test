# docker-mt-test
Dockerfile for test MT.

## Docker Hub

[masiuchi/docker-mt-test](https://hub.docker.com/r/masiuchi/docker-mt-test/)

## Environment list

|image name|base image|Perl|PHP|MySQL|Memcached|OpenLDAP|
|-|-|-|-|-|-|-|
|[masiuchi/docker-mt-test:centos6](https://github.com/masiuchi/docker-mt-test/tree/centos6)|centos:6|5.10.1|5.3.3|-|-|-|
|[masiuchi/docker-mt-test:centos6-full](https://github.com/masiuchi/docker-mt-test/tree/centos6-full)|masiuchi/docker-mt-test:centos6|5.10.1|5.3.3|5.1.73|1.4.4|-|
|[masiuchi/docker-mt-test:centos7](https://github.com/masiuchi/docker-mt-test/tree/centos7)|centos:7|5.16.3|5.4.16|-|-|-|
|[masiuchi/docker-mt-test:trusty](https://github.com/masiuchi/docker-mt-test/tree/trusty)|ubuntu:trusty|5.18.2|5.5.9|-|-|-|
|[masiuchi/docker-mt-test:trusty-full](https://github.com/masiuchi/docker-mt-test/tree/trusty-full)|masiuchi/docker-mt-test:trusty|5.18.2|5.5.9|5.5.58|1.4.14|-|
|[masiuchi/docker-mt-test:stretch](https://github.com/masiuchi/docker-mt-test/tree/stretch)|debian:stretch|5.24.1|7.0.19-1|-|-|-|
|[masiuchi/docker-mt-test:stretch-full](https://github.com/masiuchi/docker-mt-test/tree/stretch-full)|masiuchi/docker-mt-test:stretch|5.24.1|7.0.19-1|MariaDB 10.1.26|1.4.33|-|
|[masiuchi/docker-mt-test:bionic](https://github.com/masiuchi/docker-mt-test/tree/bionic)|ubuntu:bionic|5.26.1|7.2.3|-|-|-|
|[masiuchi/docker-mt-test:bionic-full](https://github.com/masiuchi/docker-mt-test/tree/bionic)|ubuntu:bionic|5.26.1|7.2.3|5.7.12|1.5.6|-|
|[masiuchi/docker-mt-test:disco](https://github.com/masiuchi/docker-mt-test/tree/disco)|ubuntu:disco|5.28.1|7.2.11|-|-|-|
|[masiuchi/docker-mt-test:disco-full](https://github.com/masiuchi/docker-mt-test/tree/disco-full)|ubuntu:disco|5.28.1|7.2.11|5.7.26|1.5.10|-|
|[masiuchi/docker-mt-test:openldap](https://github.com/masiuchi/docker-mt-test/tree/openldap)|centos:6|-|-|-|-|2.4.40|

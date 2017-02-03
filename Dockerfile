FROM ubuntu:trusty
MAINTAINER Daniel Popescu <danielpops@gmail.com>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        nginx \
        reprepro \
    && apt-get clean

RUN for i in conf dists incoming indices logs pool project tmp; do mkdir -p /var/repositories/ubuntu/$i; done

ADD distributions.conf /var/repositories/ubuntu/conf/distributions
ADD nginx.conf /etc/nginx/sites-available/default
RUN echo 'deb http://localhost/ubuntu/ trusty main' > /etc/apt/sources.list.d/local.list

ENTRYPOINT /bin/bash

WORKDIR /var/repositories/ubuntu

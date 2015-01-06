FROM ubuntu:14.04
MAINTAINER Rico Nuguid <rico@snib.it>

ENV NGINX_VERSION 1.7.7-1+trusty0

RUN  apt-get update
RUN apt-get -y install software-properties-common python-software-properties

RUN apt-add-repository ppa:nginx/development
RUN apt-get update
RUN apt-get -y -q install nginx=${NGINX_VERSION}

#forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

RUN mkdir -p /var/www/html
ONBUILD RUN chown -R www-data:www-data /var/www/html/

ONBUILD ADD provisioning/nginx/global.conf /etc/nginx/conf.d/
ONBUILD ADD provisioning/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

ONBUILD COPY dist/. /var/www/html

CMD ["nginx"]

FROM ubuntu:14.04
MAINTAINER Rico Nuguid <rico@snib.it>

ENV CONSUL_TEMPLATE_VERSION 0.5.1

# Install Haproxy.
RUN \
  sed -i 's/^# \(.*-backports\s\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y haproxy=1.5.3-1~ubuntu14.04.1 && \
  sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy && \
  rm -rf /var/lib/apt/lists/*

ADD https://github.com/hashicorp/consul-template/releases/download/v$CONSUL_TEMPLATE_VERSION/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tar.gz /tmp/consul-template.tgz
RUN cd /bin && gzip -dc /tmp/consul-template.tgz | tar -xf - && rm /tmp/consul-template.tgz && mv /bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64/consul-template /bin/consul-template && rmdir /bin/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64

ADD startup.sh /startup.sh
RUN chmod u+x /startup.sh

ONBUILD ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ONBUILD ADD haproxy.ctmpl /etc/haproxy/haproxy.ctmpl

# Define working directory.
WORKDIR /etc/haproxy

# Expose ports.
EXPOSE 80
EXPOSE 443

CMD ["/startup.sh"]

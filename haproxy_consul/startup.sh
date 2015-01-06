#!/bin/bash
service haproxy start

CONSUL_TEMPLATE_LOG=debug consul-template \
-consul=$CONSUL_PORT_8500_TCP_ADDR:$CONSUL_PORT_8500_TCP_PORT \
-template "/etc/haproxy/haproxy.ctmpl:/etc/haproxy/haproxy.cfg:service haproxy restart"

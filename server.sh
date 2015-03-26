#!/usr/bin/env bash

DOCKER_HOST=$(ip route | awk '/default/ {print $3}')

CONFIG="
chroot = /var/lib/stunnel4/
setuid = stunnel4
setgid = stunnel4
pid = /stunnel4.pid
;debug = 7
;output = /var/log/stunnel4/stunnel.log
foreground = yes

cert = /etc/stunnel/stunnel.pem

socket = r:SO_KEEPALIVE=1
socket = r:TCP_KEEPIDLE=120
socket = r:TCP_KEEPCNT=120

[https]
accept  = 443
connect = ${DOCKER_HOST}:22
"

echo "$CONFIG" > /etc/stunnel/stunnel.conf
/usr/bin/stunnel

#!/usr/bin/env bash

CONFIG="
client = yes
foreground = yes

[ssh]
accept = 22
connect = ${STUNNEL_SERVER_HOST}:${STUNNEL_SERVER_PORT:-443}
"

echo "$CONFIG" > /etc/stunnel/stunnel.conf
/usr/bin/stunnel

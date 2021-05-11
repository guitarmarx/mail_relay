#!/bin/bash
set -e

#Setzen des Hostnames
export HOSTNAME=`hostname`


# config postfix
dockerize -template /srv/template/postfix:/etc/postfix

# start postfix
service postfix start
postfix reload

tail -f /var/log/postfix.log
#!/bin/bash
set -e

#Setzen des Hostnames
export HOSTNAME=`hostname`


# config postfix
dockerize -template /srv/template/postfix:/etc/postfix
usermod -a -G sasl postfix

# prepare sasl
cp /srv/template/saslauthd/smtpd.conf /etc/postfix/sasl/smtpd.conf
mkdir -p /var/spool/postfix/var/run/saslauthd
rm -rf /run/saslauthd
ln -s /var/spool/postfix/var/run/saslauthd   /run/saslauthd


# start postfix
service postfix start
postfix reload

tail -f /var/log/postfix.log
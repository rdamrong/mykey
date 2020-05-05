#!/bin/sh

SHOST=`hostname -s `

mkdir -p /etc/pki/nginx/private
mv ${SHOST}-key.pem /etc/pki/nginx/private/server.key
mv ${SHOST}-cert.pem /etc/pki/nginx/server.crt
restorecon -R /etc/pki/nginx/

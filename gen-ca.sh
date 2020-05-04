#!/bin/sh


export HOST=default
export CA_KEY=ca.key
export CA_CERT=ca.crt

echo "###### clear exiting file"
rm -f ca* 
echo
echo

echo "###### creating CA key and certificate"
echo
openssl genrsa -aes256 -passout pass:xpass -out ${CA_KEY} 4096
openssl req -new -passin pass:xpass -x509 -days 3650 -key ${CA_KEY} -sha256 -out ${CA_CERT} -subj "/C=TH/ST=Bangkok/L=Bangkok/O=MyOrganization/OU=MyHome/CN=${HOST}"
echo
echo

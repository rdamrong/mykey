#!/bin/sh

cd /root/.docker

export HOST=client1.example.com
export HOSTIP=10.211.55.19
export SHOST=client1
export CA_KEY=ca.key
export CA_CERT=ca.crt

echo "###### clear exiting file"
rm -f  ${SHOST}* *.cnf
echo
echo



echo "###### creating ${HOST} key and cert"
echo
openssl genrsa -out ${SHOST}-key.pem 4096
openssl req -subj "/CN=$HOST" -sha256 -new -key ${SHOST}-key.pem -out ${SHOST}.csr
echo subjectAltName = DNS:$HOST,IP:${HOSTIP},IP:127.0.0.1 >> extfile.cnf
echo extendedKeyUsage = serverAuth >> extfile.cnf
openssl x509 -passin pass:xpass -req -days 365 -sha256 -in ${SHOST}.csr -CA /etc/docker/tls/${CA_CERT} -CAkey /etc/docker/tls/${CA_KEY} \
  -CAcreateserial -out ${SHOST}-cert.pem -extfile extfile.cnf
echo
echo
rm -f *.cnf *.csr


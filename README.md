# Docker Apache PHP SSL

This is a docker/php image extension that adds SSL based on other similar docker images.

It's in an early stage still in development and testing.

# Scripts from:

- https://github.com/greyltc/docker-LAMP # SSl setup
- https://github.com/ulsmith/alpine-apache-php7 # Customizable start script

# Launch

## First launch
```bash
#!/bin/bash

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

LOCALPATH="${SCRIPTPATH}"/web
CERTPATH="${SCRIPTPATH}"/certs
HOSTNAME="yourhostname.com"
EMAIL="your@email.com"

docker run -d \
    -v "${LOCALPATH}":/var/www/html \
    -v "${CERTPATH}":/etc/letsencrypt/live/ \
    -p 80:80 \
    -p 443:443 \
    -e DO_SSL_LETS_ENCRYPT_FETCH=true \
    -e HOSTNAME="${HOSTNAME}" \
    -e EMAIL="${EMAIL}" \
    --name server-lap \
    stockmind/apache-php-ssl
```

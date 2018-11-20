# Docker Apache PHP SSL

This is a docker/php image extension that adds SSL based on other similar docker images.

# Scripts from:
https://github.com/greyltc/docker-LAMP # SSl setup
https://github.com/ulsmith/alpine-apache-php7 # Customizable start script

# Launch

## First launch

    docker run -d \
                -v <localpath>:/var/www/html \
                -v <certpath>:/etc/letsencrypt/live/ \
                -p 80:80 \
                -p 443:443 \
                -e DO_SSL_LETS_ENCRYPT_FETCH=true \
                -e HOSTNAME=yourhost.com \
                -e EMAIL=youremail.com \
                --name server-lap \
                stockmind/apache-php-ssl

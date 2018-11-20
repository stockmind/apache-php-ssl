FROM php:7.2-apache-stretch

ENV DO_SSL_SELF_GENERATION true

RUN apt-get update && apt-get install -y \
	certbot python-certbot-apache \
	--no-install-recommends && rm -r /var/lib/apt/lists/*

RUN a2enmod ssl && a2ensite default-ssl

ADD setupssl.sh /usr/sbin/setupssl
ADD start.sh /usr/sbin/entrypoint-start
RUN setupssl

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["entrypoint-start"]
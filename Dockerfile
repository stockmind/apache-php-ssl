FROM php:7.2-apache-stretch

RUN apt-get update && apt-get -y install libz-dev libmemcached-dev libmemcached11 libmemcachedutil2 build-essential \
	&& pecl install memcached \
	&& echo extension=memcached.so >> /usr/local/etc/php/conf.d/memcached.ini \
	&& apt-get remove -y build-essential libmemcached-dev libz-dev \
	&& apt-get autoremove -y \
	&& apt-get clean \
	&& rm -rf /tmp/pear	\
	&& rm -r /var/lib/apt/lists/*

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
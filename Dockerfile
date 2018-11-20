FROM php:5.6-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html
WORKDIR ${APACHE_DOCUMENT_ROOT}

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

VOLUME /var/www/dealer-site

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

RUN cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/
RUN cp /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/
RUN pear channel-discover htmlpurifier.org && \
    pear install hp/HTMLPurifier && \
    pecl install xdebug-2.5.5 && \
    docker-php-ext-enable xdebug && \
    docker-php-ext-install mysql && \
    echo 'xdebug.remote_port=9000' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo 'xdebug.remote_autostart=1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.remote_log=/var/log/apache2/error.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#RUN apt-get update && apt-get install nano sudo && \
#    echo 'alias ll="ls -lah"' >> ~/.bashrc



FROM php:5.6-apache
# Base image: https://registry.hub.docker.com/_/php/

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        php5-mysql \
    && docker-php-ext-install iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd


RUN a2enmod rewrite
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mbstring

# RUN sed -i 's/\/var\/www\/html/\/var\/www\/html\/daloradius/' /etc/apache2/apache2.conf

ADD files/ /

RUN	cd /var/www/ && \
	# rm -rf html && \
	#rm -f /etc/apache2/sites-available/000-default.conf && \
	#mv /etc/apache2/sites-available/000-default.conf.daloradius /etc/apache2/sites-available/000-default.conf && \
	tar -zxvf daloradius-0.9-9.tar.gz && mv daloradius-0.9-9 html/daloradius && \
	mv -f daloradius.conf.php html/daloradius/library/ && \
	rm -f daloradius-0.9-9.tar.gz && \
	chown www-data.www-data -R html/daloradius

# RUN rm -rf /var/www/html && \
# 	mv -f /var/www/daloradius /var/www/html
EXPOSE 80
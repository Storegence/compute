FROM php:apache

# setup basics
RUN apt update -yqq && \
    apt upgrade -yqq && \
    apt install -yqq sudo unzip curl cron git zip unzip nodejs libssl-dev pkg-config libicu-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev libcurl4-openssl-dev

# install php exts and apache mods
RUN a2enmod rewrite && \
    docker-php-ext-install pdo \
    mbstring \
    curl \
    exif \
    gd \
    gettext \
    intl \
    pdo_mysql \
    pdo_pgsql \
    xmlrpc \
    zip \
    json intl xml bz2 opcache

# setup composer
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker -ms /bin/bash docker

# expose port
EXPOSE 80 443

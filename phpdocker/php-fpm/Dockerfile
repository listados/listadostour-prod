FROM php:8.1-fpm
WORKDIR "/application"

RUN apt-get update \
    && apt-get -y install \
        locales \
        nano \
        libfreetype6-dev \
        libpng-dev \
        libjpeg-dev \
        libzip-dev \
        libmagickwand-dev \
        libbz2-dev \
        libgmp-dev \
        libmcrypt-dev \
        libicu-dev \
        python3 python3-pil python3-numpy python3-pip \
        ruby ruby-dev \
        build-essential \
        gettext \
        git \
        zlib1g-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install bz2 gd gmp mysqli pdo_mysql zip gettext \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && locale-gen \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

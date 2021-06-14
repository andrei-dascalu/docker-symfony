FROM php:8-apache

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y \
        libtool \
        zlib1g-dev \
        libsodium23 \
        libsodium-dev \
        libpng-dev \
        libpng-dev \
        libjpeg-dev \
        libzip-dev \
        curl \
        libcurl4-openssl-dev gnupg2 \
        libssl-dev \
        libicu-dev \
        libxml2-dev \
        ca-certificates \
        libfreetype6-dev \
        fonts-open-sans \
        git && \
    curl -sS https://get.symfony.com/cli/installer | bash && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony && \
    php -r "unlink('composer-setup.php');" \
    && pecl install igbinary \
    && pecl install --onlyreqdeps --nobuild redis \
    && cd "$(pecl config-get temp_dir)/redis" \
    && phpize \
    && ./configure --enable-redis-igbinary \
    && make && make install \
    && docker-php-ext-install \
         mysqli \
         iconv \
         intl \
         zip \
         opcache \
         exif \
         curl \
         gettext \
         sockets \
         pdo \
         bcmath \
         pdo_mysql \
    && docker-php-ext-enable \
        mysqli \
        intl \
        iconv \
        zip \
        opcache \
        bcmath \
        igbinary \
        redis \
        exif \
        curl \
        sodium \
    && rm -rf /etc/apache2/sites-enabled/*.conf

EXPOSE 80

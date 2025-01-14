FROM php:7.2-fpm-alpine

ARG LANGUAGE
ARG TIMEZONE

EXPOSE 80
EXPOSE 9000

VOLUME [ "/var/www/html" ]
WORKDIR /var/www/html

# Install base packages ================================================================================================
RUN apk --no-cache --update add \
    linux-headers  curl-dev freetype-dev git graphicsmagick htop icu-dev imagemagick libjpeg-turbo-dev libmcrypt-dev \
    libpng-dev libxml2-dev lynx mc mysql-client nano sqlite-dev tree tzdata unzip vim wget freetype-dev autoconf g++ \
    imagemagick imagemagick-dev libtool make libmemcached-dev tzdata ncurses pcre-dev \
    ${PHPIZE_DEPS}

RUN apk --no-cache --update add \
    openssl icu-dev pcre-dev imap-dev krb5-dev

RUN apk add --no-cache --upgrade grep

# Set locale ===========================================================================================================
ENV LANG=${LANGUAGE}
ENV LANGUAGE=${LANGUAGE}

RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime
RUN patch /etc/ssl/certs/ca-certificates.crt /tmp/ca-certificates.crt.patch; exit 0
RUN patch /etc/ssl/cert.pem /tmp/cert.pem.patch; exit 0

RUN rm /etc/ssl/certs/2e5ac55d.0 && \
    rm /etc/ssl/certs/ca-cert-DST_Root_CA_X3.pem

# Install pecl packages ================================================================================================
RUN pecl channel-update pecl.php.net && \
    pecl install xdebug-2.7.2 && \
    pecl install igbinary && \
    pecl install redis-5.3.4 && \
    docker-php-ext-enable igbinary redis xdebug

# Install php packages =================================================================================================
RUN apk --no-cache --update add \
    php7-common php7-dev php7-curl php7-dom php7-exif php7-ftp php7-gd php7-iconv php7-openssl php7-posix \
    php7-soap php7-zip php7-ldap php7-bcmath php7-calendar php7-gettext php7-json php7-pcntl php7-apcu php7-phar \
    php7-sockets php7-xmlrpc php7-pdo php7-mysqli php7-wddx php7-mcrypt php7-xmlreader php7-zip php7-zlib \
    php7-xsl php7-opcache php7-ctype php7-pdo_mysql php7-pdo_sqlite php7-sqlite3 php7-intl php7-fpm

# Install php extensions ===============================================================================================
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-configure opcache && \
    docker-php-ext-configure intl && \
    docker-php-ext-install pdo pdo_mysql gd opcache xml soap imap intl sockets tokenizer

RUN docker-php-ext-enable xdebug

# Remove temp files ====================================================================================================
RUN rm -rf /tmp/* \
    rm -rf /var/cache/apk/*

# Install composer =====================================================================================================
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Log files ============================================================================================================
RUN ln -sf /dev/stderr /var/log/fpm-access.log
RUN ln -sf /dev/stderr /var/log/fpm-error.log

# Execute command ======================================================================================================
CMD [ "php-fpm" ]
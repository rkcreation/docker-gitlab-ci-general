FROM php:7-stretch
MAINTAINER Nicolas Dhers <nicolas@rkcreation.fr>


# Packages

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    wget \
    unzip \
    build-essential \
    gnupg \
    lftp \
  && rm -r /var/lib/apt/lists/*


# Composer

# Register the COMPOSER_HOME environment variable
ENV COMPOSER_HOME /composer
# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH
# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1
# Setup the Composer installer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"
ENV COMPOSER_VERSION master
# Install Composer
RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot && rm -rf /tmp/composer-setup.php
# Setup the Composer installer and extensions
RUN composer global require 'phing/phing=2.*' &&\
    composer global require 'phpunit/phpunit=*'


# NPM / Yarn

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs yarn \
  && rm -r /var/lib/apt/lists/*
RUN npm install -g gulp

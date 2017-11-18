FROM php:7.1.11-cli

RUN apt-get update && apt-get -y install apt-transport-https curl
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get -y install git libsqlite3-dev libxml2-dev unzip yarn zlib1g-dev
RUN docker-php-ext-install bcmath pcntl pdo pdo_sqlite soap zip
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN composer global require "hirak/prestissimo:^0.3"

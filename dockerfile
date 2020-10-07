FROM wordpress

# APT Bonanza
RUN apt-get update -y \
  && apt-get install -y \
    mariadb-server \ 
    nano

# Composer
RUN curl -sS https://getcomposer.org/installer \ 
  | php -- --install-dir=/usr/local/bin --filename=composer

# Wordpress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \ 
  && php wp-cli.phar --info \ 
  && chmod +x wp-cli.phar \ 
  && mv wp-cli.phar /usr/local/bin/wp

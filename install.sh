# Search for update and install it
#apt update
#apt install whiptail -y
#apt upgrade -y
# Install Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# shellcheck disable=SC1090
source ~/.bashrc
nvm install v19.0.0
# Install PHP and Composer
#apt install php-cli unzip -y
#cd ~ && curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
## shellcheck disable=SC2006
#HASH=`curl -sS https://composer.github.io/installer.sig`
#php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
#php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
## Setup DB
#apt install mysql-server -y
#/etc/init.d/mysql start
#mysql -uroot < /HandlerInstaller/setup.sql
# Clone project
#mkdir /var/www
#cd /var/www && git clone https://github.com/DennisPirotta/handler.git


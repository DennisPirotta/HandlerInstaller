# Search for update and install it
apt update && apt upgrade -y
apt install whiptail git -y
# Install Node
curl -sL https://deb.nodesource.com/setup_19.x | bash
apt update && apt install nodejs -y
# Install PHP and Composer
apt install php-cli php-mbstring php-xml php-bcmath php-curl unzip php-fpm -y
/etc/init.d/php8.1-fpm start
cd ~ && curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=$(curl -sS https://composer.github.io/installer.sig)
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
## Setup DB
apt install mysql-server -y
/etc/init.d/mysql start
mysql -uroot < /HandlerInstaller/setup.sql
# Clone project
mkdir /var/www
cd /var/www && git clone https://github.com/DennisPirotta/handler.git
# Setup project
cp /var/www/handler/.env.example /var/www/handler/.env
cd /var/www/handler && npm install
cd /var/www/handler && composer install
cd /var/www/handler && php artisan key:generate
cd /var/www/handler && npm run build
# Set permissions
chown -R www-data.www-data /var/www/handler/storage
chown -R www-data.www-data /var/www/handler/bootstrap/cache
# Install and configure nginx
apt install nginx -y
cp /HandlerInstaller/handler /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/handler /etc/nginx/sites-enabled/
/etc/init.d/nginx restart
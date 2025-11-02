Di Elendil, Isildur, Anarion
apt-get update

nano /etc/apt/sources.list
ISI DENGAN INI
deb http://deb.debian.org/debian bookworm main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free
deb http://deb.debian.org/debian bookworm-updates main contrib non-free

apt-get update
apt-get install -y software-properties-common
apt-get install -y lsb-release ca-certificates apt-transport-https gnupg2 curl git unzip
curl -sSL https://packages.sury.org/php/README.txt | bash -x
apt install -y php8.2 php8.2-fpm php8.2-cli php8.2-common php8.2-curl php8.2-mbstring php8.2-xml php8.2-zip php8.2-bcmath php8.2-gd unzip git

apt-get install -y nginx
service nginx start
ps aux | grep nginx
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer --version

cd /var/www
git clone https://github.com/elshiraphine/laravel-simple-rest-api.git resource-laravel-k1
cd resource-laravel-k1

composer install
composer update

cp .env.example .env
php artisan key:generate

ls -la /var/www/resource-laravel-k1/
cat /var/www/resource-laravel-k1/.env
ls /var/www/resource-laravel-k1/vendor/
cd /var/www/resource-laravel-k1
php artisan --version

nano /etc/nginx/sites-available/laravel

ISI DENGAN INI
server {
    listen 80;
    server_name localhost;
    root /var/www/resource-laravel-k1/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    index index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}

cd /var/www/resource-laravel-k1
ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache

service php8.2-fpm start
ls /run/php/
nginx -t
service nginx restart

Testing ( Di Miriel )
apt-get install -y lynx
lynx http://10.64.1.7   # Elendil
lynx http://10.64.1.6   # Isildur
lynx http://10.64.1.5   # Anarion
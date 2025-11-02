Di Parandil
apt-get update
apt-get install -y mariadb-server mariadb-client

service mariadb start

mysql -e "CREATE DATABASE laravel_db;"
mysql -e "CREATE USER 'laravel_user'@'%' IDENTIFIED BY 'extend123';"
mysql -e "GRANT ALL PRIVILEGES ON laravel_db.* TO 'laravel_user'@'%';"
mysql -e "FLUSH PRIVILEGES;"

sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb restart
ss -tulpn | grep 3306


Elendil , Insildur, Anarion 

cd /var/www/resource-laravel-k1

nano .env

ISI DENGAN INI
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:5T22tdWPOBi2v7aA8kXfXLXGqOaV1cjAeXoLRmvUIy8=
APP_DEBUG=true
APP_URL=http://elendil.k1.com

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=10.64.4.3
DB_PORT=3306
DB_DATABASE=laravel_db
DB_USERNAME=laravel_user
DB_PASSWORD=extend123

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
VITE_PUSHER_HOST="${PUSHER_HOST}"
VITE_PUSHER_PORT="${PUSHER_PORT}"
VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"

php artisan key:generate

apt-get update
apt-get install -y php8.2-mysql
service php8.2-fpm restart
service nginx restart
php artisan migrate:fresh --seed
apt-get install -y mariadb-client

nano /etc/nginx/sites-available/elendil

ISI INI
server {
    listen 8001;
    server_name elendil.k1.com;

    root /var/www/resource-laravel-k1/public;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
    include fastcgi_params;
    fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~ /\.ht {
        deny all;
    }
}

ln -s /etc/nginx/sites-available/elendil /etc/nginx/sites-enabled/
chown -R www-data:www-data /var/www/resource-laravel-k1
chmod -R 775 /var/www/resource-laravel-k1/storage /var/www/resource-laravel-k1/bootstrap/cache
nginx -t
service nginx restart
service php8.2-fpm restart

/var/www/resource-laravel-k1# curl -I http://elendil.k1.com:8001/index.php

apt-get install -y lynx
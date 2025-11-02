Galadriel
apt update
apt install nginx php8.4-fpm -y
apt install apache2-utils -y
htpasswd -c /etc/nginx/.htpasswd noldor silvan

nano /etc/nginx/sites-available/galadriel
server {
    listen 8004;
    server_name galadriel.k1.com;

    root /var/www/html;
    index index.php index.html;

    auth_basic "Restricted Area";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }

    location / {
        try_files $uri $uri/ =404;
    }

    if ($host !~ ^galadriel\.k1\.com$) {
        return 444;
    }
}
echo "<?php echo 'Halo, saya ' . gethostname(); ?>" > /var/www/html/index.php

nginx -t
service nginx restart
service php8.4-fpm restart
Celeborn
apt update
apt install nginx php8.4-fpm -y
apt install apache2-utils -y
htpasswd -c /etc/nginx/.htpasswd noldor silvan

nano /etc/nginx/sites-available/celeborn
server {
    listen 8005;
    server_name celeborn.k1.com;

    root /var/www/html;
    index index.php index.html;

    auth_basic "Restricted Area";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }

    location / {
        try_files $uri $uri/ =404;
    }

    if ($host !~ ^celeborn\.k1\.com$) {
        return 444;
    }
}
echo "<?php echo 'Halo, saya ' . gethostname(); ?>" > /var/www/html/index.php

nginx -t
service nginx restart
service php8.4-fpm restart
Oropher
apt update
apt install nginx php8.4-fpm -y
apt install apache2-utils -y
htpasswd -c /etc/nginx/.htpasswd noldor silvan

nano /etc/nginx/sites-available/oropher
server {
    listen 8006;
    server_name oropher.k1.com;

    root /var/www/html;
    index index.php index.html;

    auth_basic "Restricted Area";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }

    location / {
        try_files $uri $uri/ =404;
    }

    if ($host !~ ^oropher\.k1\.com$) {
        return 444;
    }
}
echo "<?php echo 'Halo, saya ' . gethostname(); ?>" > /var/www/html/index.php

nginx -t
service nginx restart
service php8.4-fpm restart

Uji Coba Elendil
curl galadriel.k1.com:8004, utput yang diharapkan Unauthorized
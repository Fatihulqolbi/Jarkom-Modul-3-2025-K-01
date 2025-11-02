Galadriel
apt update
apt install nginx php8.4-fpm -y

service nginx status
service php8.4-fpm status

nano /etc/nginx/sites-available/galadriel
Isi file /etc/nginx/sites-available/galadriel

server {
    listen 8004;
    server_name galadriel.k1.com;

    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }

    # Tolak akses via IP
    if ($host !~ ^galadriel\.k1\.com$) {
        return 444;
    }
}
ln -s /etc/nginx/sites-available/galadriel /etc/nginx/sites-enabled/

rm /etc/nginx/sites-enabled/default

nginx -t
service nginx restart
service php8.4-fpm restart
Celeborn
apt update
apt install nginx php8.4-fpm -y

service nginx status
service php8.4-fpm status

nano /etc/nginx/sites-available/celeborn
Isi file /etc/nginx/sites-available/celeborn

server {
    listen 8005;
    server_name celeborn.k1.com;

    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }

    # Tolak akses via IP
    if ($host !~ ^celeborn\.k1\.com$) {
        return 444;
    }
}
ln -s /etc/nginx/sites-available/celeborn /etc/nginx/sites-enabled/

rm /etc/nginx/sites-enabled/default

nginx -t
service nginx restart
service php8.4-fpm restart
Oropher
apt update
apt install nginx php8.4-fpm -y

service nginx status
service php8.4-fpm status

nano /etc/nginx/sites-available/oropher
Isi file /etc/nginx/sites-available/oropher

server {
    listen 8006;
    server_name oropher.k1.com;

    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }

    # Tolak akses via IP
    if ($host !~ ^oropher\.k1\.com$) {
        return 444;
    }
}
ln -s /etc/nginx/sites-available/oropher /etc/nginx/sites-enabled/

rm /etc/nginx/sites-enabled/default

nginx -t
service nginx restart
service php8.4-fpm restart
Uji Testing (Elendil)
curl http://galadriel.k1.com:8004
curl http://celeborn.k1.com:8005
curl http://oropher.k1.com:8006
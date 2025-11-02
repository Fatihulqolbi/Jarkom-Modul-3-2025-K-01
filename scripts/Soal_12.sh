Pada Node Galadriel, Celeborn, dan Oropher
apt update
apt install nginx php8.4.fpm -y
systemctl enable nginx
service nginx start
systemctl enable php8.4-fpm
service php8.4-fpm start
Buat file index.php di node Galadriel, Celeborn, dan Oropher
echo "<?php echo 'Halo, saya ' . gethostname(); ?>" > /var/www/html/index.php 

Konfigurasi /etc/nginx/sites-available/default
server {
    listen 80;
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

    # Blok akses lewat IP langsung
    if ($host ~* "^\d+\.\d+\.\d+\.\d+$") {
        return 403;
    }
}
service nginx restart
Di Erendis
Pastikan di zona k1.com terdapat

galadriel   IN  A   10.64.2.5
celeborn    IN  A   10.64.2.3
oropher     IN  A   10.64.2.4
Reload

service bind9 restart
Uji Coba (Cth Elendil)
ping galadriel.k1.com
curl galadriel.k1.com
ping celeborn.k1.com
curl celeborn.k1.com
ping oropher.k1.com
curl oropher.k1.com

curl http://10.64.2.5
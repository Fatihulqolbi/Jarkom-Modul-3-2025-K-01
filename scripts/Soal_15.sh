Galadriel
Tambahkan pada file /etc/nginx/sites-available/galadriel

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

        # Tambahkan ini:
        fastcgi_param HTTP_X_REAL_IP $remote_addr;
        fastcgi_param HTTP_X_FORWARDED_FOR $proxy_add_x_forwarded_for;
    }

    location / {
        try_files $uri $uri/ =404;
    }

    if ($host !~ ^galadriel\.k1\.com$) {
        return 444;
    }
}
nginx -t
systemctl reload nginx
Edit file /var/www/html/index.php

<?php
echo "<h1>Selamat datang di taman Galadriel 🌸</h1>";
echo "<p>Hostname: " . gethostname() . "</p>";
echo "<p>Alamat IP pengunjung: " . $_SERVER['HTTP_X_REAL_IP'] . "</p>";
?>
Celeborn
Tambahkan pada file /etc/nginx/sites-available/celeborn

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

        # Tambahkan ini:
        fastcgi_param HTTP_X_REAL_IP $remote_addr;
        fastcgi_param HTTP_X_FORWARDED_FOR $proxy_add_x_forwarded_for;
    }

    location / {
        try_files $uri $uri/ =404;
    }

    if ($host !~ ^celeborn\.k1\.com$) {
        return 444;
    }
}
nginx -t
systemctl reload nginx
Edit file /var/www/html/index.php

<?php
echo "<h1>Selamat datang di taman Celeborn</h1>";
echo "<p>Hostname: " . gethostname() . "</p>";
echo "<p>Alamat IP pengunjung: " . $_SERVER['HTTP_X_REAL_IP'] . "</p>";
?>
Oropher
Tambahkan pada file /etc/nginx/sites-available/oropher

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

        # Tambahkan ini:
        fastcgi_param HTTP_X_REAL_IP $remote_addr;
        fastcgi_param HTTP_X_FORWARDED_FOR $proxy_add_x_forwarded_for;
    }

    location / {
        try_files $uri $uri/ =404;
    }

    if ($host !~ ^oropher\.k1\.com$) {
        return 444;
    }
}
nginx -t
systemctl reload nginx
Edit file /var/www/html/index.php

<?php
echo "<h1>Selamat datang di taman Oropher</h1>";
echo "<p>Hostname: " . gethostname() . "</p>";
echo "<p>Alamat IP pengunjung: " . $_SERVER['HTTP_X_REAL_IP'] . "</p>";
?>
JANGAN LUPA
Harus udah kerjain Soal 12 - 14 (install nginx, php8.4-fpm, apache2-utils)
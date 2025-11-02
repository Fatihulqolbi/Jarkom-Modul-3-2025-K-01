Soal 16
Untuk Client apt-get install -y lynx

Galadriel
etc/nginx/sites-available/galadriel

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

        # Tambahkan ini (penting!)
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;

        # Tambahkan ini:
        fastcgi_param HTTP_X_REAL_IP $remote_addr;
        fastcgi_param HTTP_X_FORWARDED_FOR $proxy_add_x_forwarded_for;

    }

    location / {
        try_files $uri $uri/ =404;
    }

}
service nginx restart

Celeborn
etc/nginx/sites-available/celeborn

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

        # Tambahkan ini (penting!)
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;

        # Tambahkan ini:
        fastcgi_param HTTP_X_REAL_IP $remote_addr;
        fastcgi_param HTTP_X_FORWARDED_FOR $proxy_add_x_forwarded_for;

    }

    location / {
        try_files $uri $uri/ =404;
    }

}
service nginx restart

Oropher
etc/nginx/sites-available/oropher

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

        # Tambahkan ini (penting!)
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;

        # Tambahkan ini:
        fastcgi_param HTTP_X_REAL_IP $remote_addr;
        fastcgi_param HTTP_X_FORWARDED_FOR $proxy_add_x_forwarded_for;

    }

    location / {
        try_files $uri $uri/ =404;
    }

}
service nginx restart

Pharazon
apt update
apt install nginx

nano  /etc/nginx/sites-available/pharazon
upstream kesatria_lorien {
    server 10.64.2.5:8004;  # Galadriel
    server 10.64.2.3:8005;  # Celeborn
    server 10.64.2.4:8006;  # Oropher
}

server {
    listen 80;
    server_name pharazon.k1.com;

    location / {
        proxy_pass http://Kesatria_Lorien;

        # Teruskan header penting
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        # Ini penting agar Basic Auth diteruskan
        proxy_set_header Authorization $http_authorization;
        proxy_pass_header Authorization;
    }
        access_log /var/log/nginx/pharazon_access.log;
        error_log /var/log/nginx/pharazon_error.log;
}
service nginx restart
Uji Testing
curl -u noldor:silvan http://pharazon.k1.com
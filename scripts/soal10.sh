Di Elron
apt-get update && apt-get install -y nginx

nano /etc/nginx/sites-available/elros

upstream kesatria_numenor {
    server 10.64.1.7:8001;
    server 10.64.1.6:8002;
    server 10.64.1.5:8003;
}

server {
    listen 80;
    server_name elros.k1.com;

    location / {
        proxy_pass http://kesatria_numenor;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    access_log /var/log/nginx/elros_access.log;
    error_log /var/log/nginx/elros_error.log;
}
ln -s /etc/nginx/sites-available/elros /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

nginx -t
service nginx restart
TES DI Miriel
curl http://elros.k1.com
curl http://elros.k1.com/api/airing
Ubah Format Log
UBAH LOG
log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                '$status $body_bytes_sent "$http_referer" "$http_user_agent" '
                'upstream=$upstream_addr';
access_log /var/log/nginx/elros_access.log main;

nginx -t
service nginx restart
Uji dengan ab
apt install apache2-utils -y
ab -n 100 -c 10 http://elros.k1.com/api/airing/
ab -n 100 -c 10 http://elros.k1.com/api/airing/
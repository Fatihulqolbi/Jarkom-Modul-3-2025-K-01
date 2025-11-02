1) Buat folder cache & set permission (Pharazon):
mkdir -p /var/cache/nginx/pharazon_cache
chown -R www-data:www-data /var/cache/nginx/pharazon_cache
chmod -R 755 /var/cache/nginx/pharazon_cache

2) Konfigurasi Nginx (/etc/nginx/sites-available/pharazon) — gabungkan rate limiting + proxy_cache:
limit_req_zone $binary_remote_addr zone=php_limit:10m rate=10r/s;

proxy_cache_path /var/cache/nginx/pharazon_cache levels=1:2 keys_zone=pharazon_cache:10m max_size=100m inactive=60m use_temp_path=off;

upstream kesatria_lorien {
    server 10.64.2.5:8004;
    server 10.64.2.3:8005;
    server 10.64.2.2:8006;
}

server {
    listen 80;
    server_name pharazon.k1.com;

    limit_req zone=php_limit burst=20 nodelay;
    limit_req_status 429;

    location / {
        proxy_pass http://kesatria_lorien;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Authorization $http_authorization;
        proxy_pass_header Authorization;

        proxy_cache pharazon_cache;
        proxy_cache_valid 200 304 60m;
        proxy_cache_valid 404 10m;
        proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
        proxy_cache_lock on;

        add_header X-Cache-Status $upstream_cache_status;
        add_header X-Proxy-Cache $upstream_cache_status;
    }

    access_log /var/log/nginx/pharazon_access.log;
    error_log  /var/log/nginx/pharazon_error.log;
}


Restart Nginx:

nginx -t && systemctl restart nginx

3) Verifikasi header (Client)

Request pertama -> MISS:

curl -u noldor:silvan -I http://pharazon.k1.com/ | egrep -i "HTTP/|X-Cache-Status|X-Proxy-Cache|X-Cache"


Request kedua -> HIT:

sleep 1
curl -u noldor:silvan -I http://pharazon.k1.com/ | egrep -i "HTTP/|X-Cache-Status|X-Proxy-Cache|X-Cache"


Perhatikan header X-Cache-Status: HIT (atau MISS/BYPASS tergantung kondisi).

4) Tes beban & efek caching

Kosongkan cache lalu benchmark pertama untuk populate cache:

rm -rf /var/cache/nginx/pharazon_cache/*
systemctl restart nginx
ab -n 100 -c 10 -A noldor:silvan http://pharazon.k1.com/


Benchmark kedua (seharusnya lebih cepat & worker beban turun):

ab -n 1000 -c 50 -A noldor:silvan http://pharazon.k1.com/


Monitor worker (Galadriel, Celeborn, Oropher) dengan htop atau periksa access log worker untuk melihat apakah permintaan benar-benar hilang dari backend saat HIT.

5) Verifikasi file cache:
ls -lah /var/cache/nginx/pharazon_cache/
find /var/cache/nginx/pharazon_cache/ -type f | wc -l
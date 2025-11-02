1) Konfigurasi Nginx di Pharazon (10.64.2.7)

file /etc/nginx/sites-available/pharazon (tidak ada echo):

# /etc/nginx/sites-available/pharazon
limit_req_zone $binary_remote_addr zone=php_limit:10m rate=10r/s;

upstream kesatria_lorien {
    server 10.64.2.5:8004;  # Galadriel
    server 10.64.2.3:8005;  # Celeborn
    server 10.64.2.2:8006;  # Oropher
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
    }

    access_log /var/log/nginx/pharazon_access.log;
    error_log  /var/log/nginx/pharazon_error.log;
}


Aktifkan:

ln -sf /etc/nginx/sites-available/pharazon /etc/nginx/sites-enabled/pharazon
nginx -t && systemctl restart nginx

2) Dari node client (pakai Miriel 10.64.1.4 atau Narvi 10.64.4.2) — instal alat:
apt-get update
apt-get install -y apache2-utils htop
echo "nameserver 192.168.122.1" > /etc/resolv.conf

3) Benchmark pertama (semua worker aktif). Gunakan Basic Auth (-A user:pass):

(ganti noldor:silvan kalau kredensial praktikum berbeda)

ab -n 1000 -c 50 -A noldor:silvan http://pharazon.k1.com/api/airing/

4) Analisis distribusi pada Pharazon:

(ambil 1000 baris terakhir; kolom upstream_address tergantung format log — contoh ini mengikuti asumsi log format punya informasi upstream di kolom ke-12 seperti referensi temanmu)

tail -1000 /var/log/nginx/pharazon_access.log | awk '{print $12}' | sort | uniq -c
tail -1000 /var/log/nginx/pharazon_access.log | awk '{print $9}' | sort | uniq -c   # status code count
tail -1000 /var/log/nginx/pharazon_error.log | tail -50

5) Simulasikan salah satu worker down (misal: stop nginx di Galadriel 10.64.2.5):

Di node Galadriel:

systemctl stop nginx
systemctl status nginx --no-pager

6) Ulangi benchmark dari client:
ab -n 1000 -c 50 -A noldor:silvan http://pharazon.k1.com/api/airing/

7) Periksa log Pharazon lagi:
tail -1000 /var/log/nginx/pharazon_access.log | awk '{print $12}' | sort | uniq -c
tail -1000 /var/log/nginx/pharazon_access.log | awk '{print $9}' | sort | uniq -c
tail -200 /var/log/nginx/pharazon_error.log
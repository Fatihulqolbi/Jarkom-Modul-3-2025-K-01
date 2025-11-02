Elros (Load balancer Laravel) — contoh /etc/nginx/sites-available/elros:
limit_req_zone $binary_remote_addr zone=laravel_limit:10m rate=10r/s;

upstream kesatria_numenor {
    server 10.64.1.7:8001 weight=3;
    server 10.64.1.6:8002 weight=2;
    server 10.64.1.5:8003 weight=1;
}

server {
    listen 80;
    server_name elros.k1.com;

    limit_req zone=laravel_limit burst=20 nodelay;
    limit_req_status 429;

    location / {
        proxy_pass http://kesatria_numenor;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    access_log /var/log/nginx/elros_access.log;
    error_log  /var/log/nginx/elros_error.log;
}


Aktifkan & restart:

nginx -t && systemctl restart nginx

Pharazon — sudah ada contoh di bagian 17; tambahkan limit_req_zone seperti sebelumnya (pastikan file disimpan).
Uji rate limiting (dijalankan di node client):

Normal (di bawah limit 10r/s):

for i in $(seq 1 10); do curl -s -o /dev/null -w "%{http_code}\n" http://elros.k1.com/; sleep 0.12; done


Burst (melebihi limit):

for i in $(seq 1 50); do curl -s -o /dev/null -w "%{http_code}\n" http://elros.k1.com/ & done; wait
ab -n 1000 -c 50 http://elros.k1.com/

Periksa log untuk pesan rate limiting
grep "limiting requests" /var/log/nginx/elros_error.log || tail -50 /var/log/nginx/elros_error.log
tail -200 /var/log/nginx/elros_access.log | awk '{print $9}' | sort | uniq -c
# Untuk Pharazon
tail -200 /var/log/nginx/pharazon_error.log | grep "limiting requests" || true
tail -200 /var/log/nginx/pharazon_access.log | awk '{print $9}' | sort | uniq -c
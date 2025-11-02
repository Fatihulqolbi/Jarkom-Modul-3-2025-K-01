Node Narvi (client / penyerang)
apt-get update
apt-get install -y apache2-utils htop


Tambahkan resolver (supaya DNS elros.k1.com bisa diakses):

echo "nameserver 192.168.122.1" > /etc/resolv.conf

Node Elendil, Isildur, Anarion (web worker)

Install alat pemantau:

apt-get update
apt-get install -y htop


Node Elros (load balancer)

Install dan konfigurasi Nginx:

apt-get update
apt-get install -y nginx


Lalu buat konfigurasi baru:

cat > /etc/nginx/sites-available/elros << 'EOF'
upstream kesatria_numenor {
    server 10.64.1.7:8001;
    server 10.64.1.6:8002;
    server 10.64.1.5:8003;
}

server {
    listen 80 default_server;
    server_name _;
    return 444;
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
EOF


Aktifkan site-nya:

ln -sf /etc/nginx/sites-available/elros /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default

nginx -t
service nginx restart

💥 Tahap Serangan
Serangan Awal (100 permintaan, 10 bersamaan)

Di Narvi:

ab -n 100 -c 10 http://elros.k1.com/api/airing/

Serangan Penuh (2000 permintaan, 100 bersamaan)

Masih di Narvi:

ab -n 2000 -c 100 http://elros.k1.com/api/airing/


Monitoring
Di Elros

Lihat distribusi request:

tail -200 /var/log/nginx/elros_access.log | awk '{print $12}' | sort | uniq -c


Cek error log:

tail -50 /var/log/nginx/elros_error.log

Di Elendil, Isildur, Anarion

Jalankan:

htop


Strategi Bertahan: Weight Balancing

Ubah konfigurasi upstream di Elros:

cat > /etc/nginx/sites-available/elros << 'EOF'
upstream kesatria_numenor {
    server 10.64.1.7:8001 weight=3;
    server 10.64.1.6:8002 weight=2;
    server 10.64.1.5:8003 weight=1;
}

server {
    listen 80 default_server;
    server_name _;
    return 444;
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
EOF

nginx -t
service nginx restart

Uji Lagi Setelah Weight

Di Narvi:

ab -n 2000 -c 100 http://elros.k1.com/api/airing/


Lalu di Elros:

tail -200 /var/log/nginx/elros_access.log | awk '{print $12}' | sort | uniq -c
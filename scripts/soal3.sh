Di Minastir

apt-get update
apt-get install bind9 -y
apt-get install bind9 -y

nano /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";

    // Nonaktifkan DNSSEC agar tidak error validasi
    dnssec-validation no;

    // Forward semua permintaan DNS ke router Durin (yang terhubung Internet)
    forwarders {
        10.64.1.1;     // IP eth0 Durin di subnet utama
    };

    // Izinkan semua klien query
    allow-query { any; };

    // Agar tidak muncul NXDOMAIN warning
    auth-nxdomain no;

    // Dengar dari semua interface
    listen-on-v6 { any; };
    listen-on { any; };
};

ln -s /etc/init.d/named /etc/init.d/bind9
service bind9 restart
service bind9 status
Ujicoba
nano /etc/resolv.conf
Sisakan IP Adress Ministar --> nameserver 10.64.5.2

Untuk Uji coba
Ping google.com 
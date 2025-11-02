Di Amdir
apt-get update
apt-get install bind9 -y

nano /etc/bind/named.conf.local

zone "k1.com" {
    type slave;
    masters { 10.64.3.3; };   // IP Erendis (Master)
    file "/etc/bind/jarkom/k1.com";
};
nano /etc/bind/named.conf.options

options {
    directory "/var/cache/bind";
    // Forward semua query luar ke Minastir
    forwarders {
        10.64.5.2;     // Minastir (terhubung ke Internet)
    };
    dnssec-validation no;
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};
Di Erendis
nano /etc/bind/named.conf.local

zone "k1.com" {
    type master;
    file "/etc/bind/jarkom/k1.com";
    allow-transfer { 10.64.3.2; };   // Amdir
    also-notify { 10.64.3.2; };      // Amdir
};
mkdir /etc/bind/jarkom

nano /etc/bind/jarkom/k1.com

;
; Zone data for k1.com
;
$TTL    604800
@       IN      SOA     ns1.k1.com. root.k1.com. (
        2025103001 ; Serial
        604800     ; Refresh
        86400      ; Retry
        2419200    ; Expire
        604800 )   ; Negative Cache TTL

; Name Servers
@       IN      NS      ns1.k1.com.
@       IN      NS      ns2.k1.com.

; Address for the servers
ns1     IN      A       10.64.3.3    ; Erendis (Master)
ns2     IN      A       10.64.3.2    ; Amdir (Slave)

; Lokasi penting
palantir    IN  A   10.64.4.3
elros       IN  A   10.64.1.2
pharazon    IN  A   10.64.2.7
elendil     IN  A   10.64.1.7
isildur     IN  A   10.64.1.6
anarion     IN  A   10.64.1.5
galadriel   IN  A   10.64.2.5
celeborn    IN  A   10.64.2.3
oropher     IN  A   10.64.2.2
nano /etc/bind/named.conf.options

options {
    directory "/var/cache/bind";
    // Forward semua query luar ke Minastir
    forwarders {
        10.64.5.2;     // Minastir (terhubung ke Internet)
    };
    dnssec-validation no;
    allow-query { any; };
    auth-nxdomain no;
    listen-on-v6 { any; };
};

Jangan Lupa Cek Setiap Node
ln -s /etc/init.d/named /etc/init.d/bind9
service bind9 restart

nano /etc/resolv.conf
nameserver 10.64.3.3
nameserver 10.64.3.2
TESTING DI SALAH SATU NODE
MISAL ELENDIL

ping google.com
ping ns1.k1.com
ping ns2.k1.com
ping galadriel.k1.com
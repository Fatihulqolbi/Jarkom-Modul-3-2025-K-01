# Jarkom-Modul-3-2025-K-01

| Nama                                  | NRP        |
| ------------------------------------- | ---------- | 
| Muhammad Fatihul Qolbi Ash Shiddiqi   | 5027241023 | 
| Hansen Chang                          | 5027241028 | 

### Soal 1

## TOPOLOGI 

<img width="1516" height="759" alt="image" src="https://github.com/user-attachments/assets/b92238c9-81a6-4c4a-8b9f-94933c0caf32" />

## SCRIPT

## Durin
```
auto eth0
iface eth0 inet dhcp
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

auto eth1
iface eth1 inet static
    address 10.64.1.1
    netmask 255.255.255.0
    post-up echo 1 > /proc/sys/net/ipv4/ip_forward
    post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    post-up iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
    post-up iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT


auto eth2
iface eth2 inet static
    address 10.64.2.1
    netmask 255.255.255.0
    post-up iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT

auto eth3
iface eth3 inet static
    address 10.64.3.1
    netmask 255.255.255.0
    post-up iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT

auto eth4
iface eth4 inet static
    address 10.64.4.1
    netmask 255.255.255.0
    post-up iptables -A FORWARD -i eth4 -o eth0 -j ACCEPT

auto eth5
iface eth5 inet static
    address 10.64.5.1
    netmask 255.255.255.0
    post-up iptables -A FORWARD -i eth5 -o eth0 -j ACCEPT
```
## Elendil
```
auto eth0
iface eth0 inet static
    address 10.64.1.7
    netmask 255.255.255.0
    gateway 10.64.1.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Isildur 
```
auto eth0
iface eth0 inet static
    address 10.64.1.6
    netmask 255.255.255.0
    gateway 10.64.1.1
   
    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Anarion
```
auto eth0
iface eth0 inet static
    address 10.64.1.5
    netmask 255.255.255.0
    gateway 10.64.1.1
   
    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Miriel
```
auto eth0
iface eth0 inet static
    address 10.64.1.4
    netmask 255.255.255.0
    gateway 10.64.1.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Amandil
```
auto eth0
iface eth0 inet static
    address 10.64.1.3
    netmask 255.255.255.0
    gateway 10.64.1.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Elros
```
auto eth0
iface eth0 inet static
    address 10.64.1.2
    netmask 255.255.255.0
    gateway 10.64.1.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Khamul
```
auto eth0
iface eth0 inet static
    address 10.64.3.4
    netmask 255.255.255.0
    gateway 10.64.3.1

up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Erendis
```
auto eth0
iface eth0 inet static
    address 10.64.3.3
    netmask 255.255.255.0
    gateway 10.64.3.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Amdir
```
auto eth0
iface eth0 inet static
    address 10.64.3.2
    netmask 255.255.255.0
    gateway 10.64.3.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Aldarion
```
auto eth0
iface eth0 inet static
    address 10.64.4.4
    netmask 255.255.255.0
    gateway 10.64.4.1
    up echo "nameserver 10.64.3.6" > /etc/resolv.conf
    up echo "nameserver 10.64.3.5" >> /etc/resolv.conf
    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Palantir
```
auto eth0
iface eth0 inet static
    address 10.64.4.3
    netmask 255.255.255.0
    gateway 10.64.4.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Narvi
```
auto eth0
iface eth0 inet static
    address 10.64.4.2
    netmask 255.255.255.0
    gateway 10.64.4.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Minastir
```
auto eth0
iface eth0 inet static
    address 10.64.5.2
    netmask 255.255.255.0
    gateway 10.64.5.1
    up echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

## Pharazon
```
auto eth0
iface eth0 inet static
    address 10.64.2.7
    netmask 255.255.255.0
    gateway 10.64.2.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Celebrimbor
```
auto eth0
iface eth0 inet static
    address 10.64.2.6
    netmask 255.255.255.0
    gateway 10.64.2.1
 
    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Gilgalad
```
auto eth0
iface eth0 inet static
    address 10.64.2.2
    netmask 255.255.255.0
    gateway 10.64.2.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf

```

## Oropher
```
auto eth0
iface eth0 inet static
    address 10.64.2.4
    netmask 255.255.255.0
    gateway 10.64.2.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Celeborn 
```
auto eth0
iface eth0 inet static
    address 10.64.2.3
    netmask 255.255.255.0
    gateway 10.64.2.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

## Galadriel 
```
auto eth0
iface eth0 inet static
    address 10.64.2.5
    netmask 255.255.255.0
    gateway 10.64.2.1

    up echo "nameserver 192.168.122.1" >> /etc/resolv.conf
```

### Soal 2

## STEP AWAL
```
apt-get update
apt-get install isc-dhcp-server

```

## Di Aldarion (DHCP Server)
```
nano /etc/dhcp/dhcpd.conf

isi dengan
# dhcpd.conf
#
# Sample configuration file for ISC dhcpd
#

# option definitions common to all supported networks...
# Subnet untuk Keluarga Manusia (Númenor)
subnet 10.64.1.0 netmask 255.255.255.0 {
    range 10.64.1.6 10.64.1.34;
    range 10.64.1.68 10.64.1.94;
    option routers 10.64.1.1;
    option broadcast-address 10.64.1.255;
    option domain-name-servers 10.64.3.3, 10.64.3.2; # DNS Master dan Slave
    default-lease-time 600;
    max-lease-time 7200;
}

# Subnet untuk Keluarga Peri (Elf)
subnet 10.64.2.0 netmask 255.255.255.0 {
    range 10.64.2.35 10.64.2.67;
    range 10.64.2.96 10.64.2.121;
    option routers 10.64.2.1;
    option broadcast-address 10.64.2.255;
    option domain-name-servers 10.64.3.3, 10.64.3.2;
    default-lease-time 600;
    max-lease-time 7200;
}

# Subnet untuk jaringan Kurcaci (Relay)
subnet 10.64.3.0 netmask 255.255.255.0 {
    option routers 10.64.3.1;
    option broadcast-address 10.64.3.255;
    option domain-name-servers 10.64.3.3, 10.64.3.2;
}

# Subnet untuk server & database
subnet 10.64.4.0 netmask 255.255.255.0 {
    option routers 10.64.4.1;
    option broadcast-address 10.64.4.255;
    option domain-name-servers 10.64.3.3, 10.64.3.2;
}

# Fixed address untuk Khamul
host Khamul {
    hardware ethernet 02:42:ac:11:00:0f;
    fixed-address 10.64.3.95;
}
# The ddns-updates-style parameter controls whether or not the server will
# attempt to do a DNS update when a lease is confirmed. We default to the
# behavior of the version 2 packages ('none', since DHCP v2 didn't
# have support for DDNS.)
ddns-update-style none;

# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
#authoritative;

# Use this to send dhcp log messages to a different log file (you also
# have to hack syslog.conf to complete the redirection).
#log-facility local7;

# No service will be given on this subnet, but declaring it helps the
# DHCP server to understand the network topology.

#subnet 10.152.187.0 netmask 255.255.255.0 {
#}

# This is a very basic subnet declaration.

#subnet 10.254.239.0 netmask 255.255.255.224 {
#  range 10.254.239.10 10.254.239.20;
#  option routers rtr-239-0-1.example.org, rtr-239-0-2.example.org;
#}

# This declaration allows BOOTP clients to get dynamic addresses,
# which we don't really recommend.

#subnet 10.254.239.32 netmask 255.255.255.224 {
#  range dynamic-bootp 10.254.239.40 10.254.239.60;
#  option broadcast-address 10.254.239.31;
#  option routers rtr-239-32-1.example.org;
#}

# A slightly different configuration for an internal subnet.
#subnet 10.5.5.0 netmask 255.255.255.224 {
#  range 10.5.5.26 10.5.5.30;
#  option domain-name-servers ns1.internal.example.org;
#  option domain-name "internal.example.org";
#  option routers 10.5.5.1;
#  option broadcast-address 10.5.5.31;
#  default-lease-time 600;
#  max-lease-time 7200;
#}

# Hosts which require special configuration options can be listed in
# host statements.   If no address is specified, the address will be
# allocated dynamically (if possible), but the host-specific information
# will still come from the host declaration.

#host passacaglia {
#  hardware ethernet 0:0:c0:5d:bd:95;
#  filename "vmunix.passacaglia";
#  server-name "toccata.example.com";
#}

# Fixed IP addresses can also be specified for hosts.   These addresses
# should not also be listed as being available for dynamic assignment.
# Hosts for which fixed IP addresses have been specified can boot using
# BOOTP or DHCP.   Hosts for which no fixed address is specified can only
# be booted with DHCP, unless there is an address range on the subnet
# to which a BOOTP client is connected which has the dynamic-bootp flag
# set.
#host fantasia {
#  hardware ethernet 08:00:07:26:c0:a5;
#  fixed-address fantasia.example.com;
#}

# You can declare a class of clients and then do address allocation
# based on that.   The example below shows a case where all clients
# in a certain class get addresses on the 10.17.224/24 subnet, and all
# other clients get addresses on the 10.0.29/24 subnet.

#class "foo" {
#  match if substring (option vendor-class-identifier, 0, 4) = "SUNW";
#}

#shared-network 224-29 {
#  subnet 10.17.224.0 netmask 255.255.255.0 {
#    option routers rtr-224.example.org;
#  }
#  subnet 10.0.29.0 netmask 255.255.255.0 {
#    option routers rtr-29.example.org;
#  }
#  pool {
#    allow members of "foo";
#    range 10.17.224.10 10.17.224.250;
#  }
#  pool {
#    deny members of "foo";
#    range 10.0.29.10 10.0.29.230;
#  }
#}
```

```
nano /etc/default/isc-dhcp-server

Isi Dengan
# Defaults for isc-dhcp-server (sourced by /etc/init.d/isc-dhcp-server)

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
#DHCPDv4_CONF=/etc/dhcp/dhcpd.conf
#DHCPDv6_CONF=/etc/dhcp/dhcpd6.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
#DHCPDv4_PID=/var/run/dhcpd.pid
#DHCPDv6_PID=/var/run/dhcpd6.pid

# Additional options to start dhcpd with.
#       Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
#OPTIONS=""

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="eth0"
INTERFACESv6=""

JANGAN LUPA
service isc-dhcp-server restart
```

## Di Durin (DHCP Relay)

## STEP AWAL
```
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay start
```

## STEP SELANJUTNYA
```
nano /etc/sysctl.conf

# Defaults for isc-dhcp-relay initscript
# sourced by /etc/init.d/isc-dhcp-relay
# installed at /etc/default/isc-dhcp-relay by the maintainer scripts

#
# This is a POSIX shell fragment
#

# What servers should the DHCP relay forward requests to?
SERVERS="10.64.4.4"

# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
INTERFACES="eth1 eth2 eth3 eth5"

# Additional options that are passed to the DHCP relay daemon?
OPTIONS="-a -i eth4"
```

## STEP AKHIR
```
service isc-dhcp-relay restart
```

## UBAH CONFIG Di Gilgalad, Amandil, Khamul 
```
auto eth0
iface eth0 inet dhcp
```

## Di Khamul (Fix Address)
```
Tambahi Config
hwaddress ether <Mac Adress Khamul> -> 02:42:7d:16:51:00
```

## Dokumentasi

## Gilgalad
<img width="1087" height="586" alt="image" src="https://github.com/user-attachments/assets/88846332-7172-4795-9f48-3c42607e296b" />

## Amandil
<img width="1087" height="587" alt="image" src="https://github.com/user-attachments/assets/f80bf155-3544-42f9-a939-a5944b2fd691" />

## Khamul
<img width="1015" height="553" alt="image" src="https://github.com/user-attachments/assets/6152fc0d-3a74-483b-9ab4-57d8202b7e2d" />

### Soal 3

## Di Minastir
```
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
```

## Ujicoba
```
nano /etc/resolv.conf
Sisakan IP Adress Ministar --> nameserver 10.64.5.2

Untuk Uji coba
Ping google.com 
```

## Dokumentasi 
<img width="721" height="231" alt="image" src="https://github.com/user-attachments/assets/ab7b2cc4-fc5f-4303-88c3-4932493e7d58" />

### Soal 4

## Di Amdir
```
nano /etc/bind/named.conf.local

zone "k1.com" {
    type slave;
    masters { 10.64.3.3; };   // IP Erendis (Master)
    file "/etc/bind/jarkom/k1.com";
};
```

```
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
```

## Di Erendis
```
nano /etc/bind/named.conf.local

zone "k1.com" {
    type master;
    file "/etc/bind/jarkom/k1.com";
    allow-transfer { 10.64.3.2; };   // Amdir
    also-notify { 10.64.3.2; };      // Amdir
};
```

```
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
```

```
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
```

## Jangan Lupa Cek Setiap Node
```
ln -s /etc/init.d/named /etc/init.d/bind9
service bind9 restart

nano /etc/resolv.conf
nameserver 10.62.3.3
nameserver 10.64.3.2
```

## TESTING DI SALAH SATU NODE
```
MISAL ELENDIL

ping google.com
ping ns1.k1.com
ping ns2.k1.com
ping galadriel.k1.com
```

## Dokumentasi
<img width="973" height="798" alt="image" src="https://github.com/user-attachments/assets/08ffd7b9-928c-4d04-adb3-6de1c670781c" />


### Soal 5
## Di Erendis
```
nano /etc/bind/jarkom/3.64.10.in-addr.arpa

;
; Reverse zone for 10.64.3.0/24
;
$TTL 604800
@       IN      SOA     ns1.k1.com. root.k1.com. (
            2025103001 ; Serial
            604800     ; Refresh
            86400      ; Retry
            2419200    ; Expire
            604800 )   ; Negative Cache TTL
;
@       IN      NS      ns1.k1.com.

; PTR records
3       IN      PTR     erendis.k1.com.
2       IN      PTR     amdir.k1.com.
```
```
nano /etc/bind/named.conf.local

zone "k1.com" {
    type master;
    file "/etc/bind/jarkom/k1.com";
    allow-transfer { 10.64.3.2; };   // Amdir
    also-notify { 10.64.3.2; };      // Amdir
};

zone "3.64.10.in-addr.arpa" {
    type master;
    file "/etc/bind/jarkom/3.64.10.in-addr.arpa";
    allow-transfer { 10.64.3.2; };  // Amdir (slave)
};
```
```
nano /etc/bind/named.conf.options

; ===== Tambahan untuk soal 5 =====

; Alias untuk domain utama
www     IN  CNAME   k1.com.

; TXT records rahasia
elros       IN  TXT  "Cincin Sauron"
pharazon    IN  TXT  "Aliansi Terakhir"
```
```
service bind9 restart
```
## Di Amdir
```
nano /etc/bind/named.conf.local

zone "k1.com" {
    type slave;
    masters { 10.64.3.3; };   // IP Erendis (Master)
    file "/etc/bind/jarkom/k1.com";
};

zone "3.64.10.in-addr.arpa" {
    type slave;
    masters { 10.64.3.3; };  // Erendis sebagai master
    file "/etc/bind/jarkom/3.64.10.in-addr.arpa";
};
```
## TESTING (Elendil)
```
ping www.k1.com

dig -x 10.64.3.3
dig -x 10.64.3.2

dig elros.k1.com TXT
dig pharazon.k1.com TXT
```
<img width="902" height="290" alt="image" src="https://github.com/user-attachments/assets/02fc8499-67b8-4477-a212-06f08ecc15b8" />
<img width="862" height="496" alt="image" src="https://github.com/user-attachments/assets/253efa5c-4533-42b2-83ac-01c0f80c7d75" />
<img width="871" height="503" alt="image" src="https://github.com/user-attachments/assets/aafae4ee-f240-45a3-8a91-e4558890c189" />
<img width="869" height="379" alt="image" src="https://github.com/user-attachments/assets/e378b5f2-2d23-422a-b758-84f41ff311b3" />
<img width="898" height="493" alt="image" src="https://github.com/user-attachments/assets/6c250c0c-511d-4223-88e9-34b7f4ab1aec" />


### Soal 6
## Di Aldarion
```
nano /etc/dhcp/dhcpd.conf

subnet 10.64.1.0 netmask 255.255.255.0 {
...
default-lease-time 1800; 
max-lease-time 3600;
}

subnet 10.64.2.0 netmask 255.255.255.0 {
...
default-lease-time 600;
max-least-time 3600;
}
```
<img width="846" height="423" alt="image" src="https://github.com/user-attachments/assets/68d4d5c3-27cd-4202-90a1-3f4d43b4a76a" />

### UJI COBA

Dari Node Manapun ( Misal Elendil ) 
```
apt-get update
apt-get install isc-dhcp-client -y

dhclient -r
dhclient
cat /var/lib/dhcp/dhclient.leases
```

### Soal 7 

## Di Erendil 
```
apt-get update

nano /etc/apt/sources.list
ISI DENGAN INI
deb http://deb.debian.org/debian bookworm main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free
deb http://deb.debian.org/debian bookworm-updates main contrib non-free

apt-get update
apt-get install -y software-properties-common
apt-get install -y lsb-release ca-certificates apt-transport-https gnupg2 curl git unzip
curl -sSL https://packages.sury.org/php/README.txt | bash -x
apt install -y php8.2 php8.2-fpm php8.2-cli php8.2-common php8.2-curl php8.2-mbstring php8.2-xml php8.2-zip php8.2-bcmath php8.2-gd unzip git

apt-get install -y nginx
service nginx start
ps aux | grep nginx
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
composer --version

cd /var/www
git clone https://github.com/elshiraphine/laravel-simple-rest-api.git resource-laravel-k1
cd resource-laravel-k1

composer install
composer update

cp .env.example .env
php artisan key:generate

ls -la /var/www/resource-laravel-k1/
cat /var/www/resource-laravel-k1/.env
ls /var/www/resource-laravel-k1/vendor/
cd /var/www/resource-laravel-k1
php artisan --version

nano /etc/nginx/sites-available/laravel

ISI DENGAN INI
server {
    listen 80;
    server_name localhost;
    root /var/www/resource-laravel-k1/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";

    index index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}

cd /var/www/resource-laravel-k1
ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache

service php8.2-fpm start
ls /run/php/
nginx -t
service nginx restart
```

## Testing ( Di Miriel ) 
```
apt-get install -y lynx
lynx http://10.64.1.7   # Elendil
lynx http://10.64.1.6   # Isildur
lynx http://10.64.1.5   # Anarion
```

# Dokumentasi (Tampilan Akhir Seluruh Node) 
<img width="1890" height="987" alt="image" src="https://github.com/user-attachments/assets/e3ad4fd9-cf3b-49e7-a62d-8db5fee2f703" />


### Soal 12
## Pada Node Galadriel, Celeborn, dan Oropher
```
apt update
apt install nginx php8.4.fpm -y
```
```
systemctl enable nginx
service nginx start
systemctl enable php8.4-fpm
service php8.4-fpm start
```

# Buat file index.php di node Galadriel, Celeborn, dan Oropher
`echo "<?php echo 'Halo, saya ' . gethostname(); ?>" > /var/www/html/index.php
`
# Konfigurasi /etc/nginx/sites-available/default
```
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
```
```
service nginx restart
```

## Di Erendis
Pastikan di zona k1.com terdapat
```
galadriel   IN  A   10.64.2.5
celeborn    IN  A   10.64.2.3
oropher     IN  A   10.64.2.4
```
Reload
```
service bind9 restart
```

## Uji Coba (Cth Elendil)
```
ping galadriel.k1.com
curl galadriel.k1.com
ping celeborn.k1.com
curl celeborn.k1.com
ping oropher.k1.com
curl oropher.k1.com

curl http://10.64.2.5
```



<img width="907" height="439" alt="image" src="https://github.com/user-attachments/assets/6c83e905-2bc6-44b3-8d8c-910d06e21525" />




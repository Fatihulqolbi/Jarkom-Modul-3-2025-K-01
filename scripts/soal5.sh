Di Erendis
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
nano /etc/bind/jarkom/k1.com

; ===== Tambahan untuk soal 5 =====

@       IN      A       10.64.3.3

; Alias untuk domain utama
www     IN  CNAME   k1.com.

; TXT records rahasia
elros       IN  TXT  "Cincin Sauron"
pharazon    IN  TXT  "Aliansi Terakhir"
service bind9 restart
Di Amdir
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
TESTING (Elendil)
ping www.k1.com

dig -x 10.64.3.3
dig -x 10.64.3.2

dig elros.k1.com TXT
dig pharazon.k1.com TXT
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


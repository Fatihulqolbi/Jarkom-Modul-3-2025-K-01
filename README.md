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

## Dokumentasi

## Gilgalad
<img width="1087" height="586" alt="image" src="https://github.com/user-attachments/assets/88846332-7172-4795-9f48-3c42607e296b" />

## Amandil
<img width="1087" height="587" alt="image" src="https://github.com/user-attachments/assets/f80bf155-3544-42f9-a939-a5944b2fd691" />

## Khamul
<img width="1015" height="553" alt="image" src="https://github.com/user-attachments/assets/6152fc0d-3a74-483b-9ab4-57d8202b7e2d" />



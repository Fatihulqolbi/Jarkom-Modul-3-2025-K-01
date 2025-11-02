STEP AWAL
apt-get update
apt-get install isc-dhcp-server

Di Aldarion (DHCP Server)
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
    hardware ethernet 02:42:7d:16:51:00;
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

Di Durin (DHCP Relay)
STEP AWAL
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay start
STEP SELANJUTNYA
nano /etc/default/isc-dhcp-relay

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

STEP AKHIR
service isc-dhcp-relay restart

nano /etc/resolv.conf
nameserver 10.64.3.3
nameserver 10.64.3.2
nameserver 192.168.122.1
UBAH CONFIG Di Gilgalad, Amandil, Khamul
auto eth0
iface eth0 inet dhcp
Di Khamul (Fix Address)
Tambahi Config
hwaddress ether <Mac Adress Khamul> -> 02:42:7d:16:51:00
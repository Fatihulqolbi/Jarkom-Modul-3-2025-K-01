Di Aldarion
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
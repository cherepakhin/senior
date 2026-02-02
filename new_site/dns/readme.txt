root@v:/etc# nmcli dev show | grep DNS
IP4.DNS[1]:                             212.33.224.131
IP4.DNS[2]:                             5.3.3.3
IP4.DNS[1]:                             212.33.225.210
IP4.DNS[1]:                             212.33.224.131
IP4.DNS[2]:                             5.3.3.3

Создать named.conf
zone "125.89.45.in-addr.arpa" {
type master;
file "/var/named/125.89.45.in-addr.arpa"
};


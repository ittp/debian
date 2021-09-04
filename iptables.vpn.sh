#!/bin/bash

###################################################

# Переменные

###################################################


#указываем внешний ip сервера и внешн. сетевой интерфейс
EXT_IP=curl 'https://api.ipify.org'

INET_IP1=$EXT_IP

INET_IFACE1=eth2


# указываем внутренний ip сервера и внутр. сетевой интерфейс

LAN_IP=10.10.10.4

LAN_IFACE=eth0


# указываем сетевой интерфейс VPN, и сеть, ему принадлежащую

VPN_IFACE=tun0

VPN_RANGE=10.8.0.0/24


# внутренняя сеть

LAN_RANGE=10.10.10.0/24


# сетевой интерфейс петли и ip

LO_IFACE=lo

LO_IP=127.0.0.1


###################################################

#OpenVPN

###################################################

forward() {
  $ip -A FORWARD -p all -i $LAN_IFACE -o $VPN_IFACE -j ACCEPT

  $ip -A FORWARD -p all -o $LAN_IFACE -i $VPN_IFACE -j ACCEPT
}


forward
# разрешаем трафик между локальной сетью и VPN

# (необходимо для возможности доступа к серверу по внутреннему ip. c клиента)




# разрешаем входящий и исходящий трафик для vpn-интерфейса

# (необходимо для возможности установки vpn соединения)

$ip -A INPUT -p all -i $VPN_IFACE -j ACCEPT

$ip -A OUTPUT -p all -o $VPN_IFACE -j ACCEPT



# разрешаем icmp пакеты через vpn

# (необходимо для пинга)

$ip -A INPUT -p icmp -m icmp -i $VPN_IFACE --icmp-type echo-request -j ACCEPT

$ip -A OUTPUT -p icmp -m icmp -o $VPN_IFACE --icmp-type echo-request -j ACCEPT


$ip -A FORWARD -p icmp -m icmp -i $VPN_IFACE  -o $LAN_IFACE --icmp-type echo-request -j ACCEPT

$ip -A FORWARD -p icmp -m icmp -o $VPN_IFACE  -i $LAN_IFACE --icmp-type echo-request -j ACCEPT


$ip -A INPUT -p icmp -m icmp -i $VPN_IFACE --icmp-type echo-reply -j ACCEPT

$ip -A OUTPUT -p icmp -m icmp -o $VPN_IFACE --icmp-type echo-reply -j ACCEPT


$ip -A FORWARD -p icmp -m icmp -i $VPN_IFACE  -o $LAN_IFACE --icmp-type echo-reply -j ACCEPT

$ip -A FORWARD -p icmp -m icmp -o $VPN_IFACE  -i $LAN_IFACE --icmp-type echo-reply -j ACCEPT

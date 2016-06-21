#! /bin/bash -e

cmd="start"

if [[ -e "/proc/sys/net/ipv4/conf/tun0" ]]
then
    cmd="stop"
fi

systemctl $cmd openvpn@UK_London


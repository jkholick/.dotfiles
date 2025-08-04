#!/bin/bash

local_ip_range=$(ip route show dev wlp2s0 | sed -r 's/\x1B\[[0-9;]*[mK]//g' | grep -oE '\b[^ ]*/[^ ]*\b')

if [[ $1 == "debug" ]]; then
    echo "The current local ip is $local_ip_range"
    echo "Finding phone's ip address"
    echo "Phone ip:"
fi

phone_ip=$(nmap -p 5555 --open -n -T5 --min-parallelism 100 $local_ip_range | grep 'Nmap scan report' | grep -oE '[^ ]+$')
echo "$phone_ip"


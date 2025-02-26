#!/usr/bin/env bash

device_id="/modules/kdeconnect/devices/cb57a003_0a15_45d3_b092_d958530f4300"

device_status=$(qdbus org.kde.kdeconnect $device_id org.kde.kdeconnect.device.isReachable)

if test $device_status = "true"
then
    percentage=$(qdbus org.kde.kdeconnect $device_id/battery org.kde.kdeconnect.device.battery.charge)
    charge_status=$(qdbus org.kde.kdeconnect $device_id/battery org.kde.kdeconnect.device.battery.isCharging)
    
    if test $charge_status = "true"
    then 
        icon=󱎗
    else
        icon=
    fi

    echo "{\"text\":\"$icon $percentage%\"}"
else
    echo ""
fi

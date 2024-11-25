#!/usr/bin/env bash

device_status=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/c758157b_d1b4_46db_9c1e_0c8219b4025d org.kde.kdeconnect.device.isReachable)

if test $device_status = "true"
then
    percentage=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/c758157b_d1b4_46db_9c1e_0c8219b4025d/battery org.kde.kdeconnect.device.battery.charge)
    charge_status=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/c758157b_d1b4_46db_9c1e_0c8219b4025d/battery org.kde.kdeconnect.device.battery.isCharging)
    
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

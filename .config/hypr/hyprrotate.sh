#!/bin/bash

available_displays=$(hyprctl -j monitors | jq 'length')

for (( i=0 ; i < $available_displays ; i++)); do
	if [[ $(hyprctl -j monitors | jq ".[$i].focused") == "true" ]]; then
        focused_display=$(hyprctl -j monitors | jq -r ".[$i].name")
        break
    fi
done

# For tablet laptop that starts with a portrait mode as default
tablet_rotate() {
	if [[ $1 == "" ]]; then
        echo "tab null"
        current_rotation=$(hyprctl -j monitors | jq ".[$i].transform")
        if [[ $current_rotation == 3 ]]; then
            new_rotation=0
        else
            new_rotation=$(( $current_rotation + 1 ))
        fi

        hyprctl --batch "keyword monitor $focused_display,preferred,auto,1,transform,$new_rotation ; keyword input:touchdevice:transform $new_rotation"

    elif [[ $1 == "down" ]]; then
        hyprctl --batch "keyword monitor $focused_display,preferred,auto,1,transform,3 ; keyword input:touchdevice:transform 3"
    elif [[ $1 == "up" ]]; then                                                                                                  
        hyprctl --batch "keyword monitor $focused_display,preferred,auto,1,transform,1 ; keyword input:touchdevice:transform 1"
    elif [[ $1 == "left" ]]; then
        hyprctl --batch "keyword monitor $focused_display,preferred,auto,1,transform,2 ; keyword input:touchdevice:transform 2"
    elif [[ $1 == "right" ]]; then
        hyprctl --batch "keyword monitor $focused_display,preferred,auto,1,transform,0 ; keyword input:touchdevice:transform 0"
    fi
}

laptop_rotate() {
	if [[ $1 == "" ]]; then 
        $current_rotation=$(hyprctl -j monitors | jq ".[$i].transform")
        if [[ $current_rotation == 3 ]]; then
            new_rotation=0
        else
            new_rotation=$(( $current_rotation + 1 ))
        fi
    elif [[ $1 == "down" ]]; then
        hyprctl --batch "keyword monitor $focused_display,preferred,auto,1,transform,0 ; keyword input:touchdevice:transform 0"
    elif [[ $1 == "up" ]]; then                                                                                                  
        hyprctl --batch "keyword monitor $focused_display,preferred,auto,1,transform,2 ; keyword input:touchdevice:transform 2"
    elif [[ $1 == "left" ]]; then
        hyprctl --batch "keyword monitor $focused_display,preferred,auto,1,transform,3 ; keyword input:touchdevice:transform 3"
    elif [[ $1 == "right" ]]; then
        hyprctl --batch "keyword monitor $focused_display,preferred,auto,1,transform,1 ; keyword input:touchdevice:transform 1"
    fi
}

if [[ $focused_display == "DSI-1" ]]; then
	tablet_rotate "$1"
else 
	laptop_rotate "$1"
fi



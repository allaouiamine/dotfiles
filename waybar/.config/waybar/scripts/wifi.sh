#!/bin/bash

# Get WiFi information from nmcli
WIFI_INFO=$(nmcli -t -f active,ssid,signal dev wifi | grep '^yes' | head -n1)

if [ -n "$WIFI_INFO" ]; then
    # Extract SSID and signal strength
    SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    STRENGTH=$(nmcli -t -f signal dev wifi | head -n1)
    
    # Determine icon based on signal strength
    if [ "$STRENGTH" -ge 80 ]; then
        ICON="󰤨"
    elif [ "$STRENGTH" -ge 60 ]; then
        ICON="󰤥"
    elif [ "$STRENGTH" -ge 40 ]; then
        ICON="󰤢"
    elif [ "$STRENGTH" -ge 20 ]; then
        ICON="󰤟"
    else
        ICON="󰤯"
    fi
    
    echo "{\"text\": \"$ICON $SSID\", \"tooltip\": \"SSID: $SSID\\nStrength: $STRENGTH%\", \"class\": \"wifi-$STRENGTH\"}"
else
    echo "{\"text\": \"󰤮 Disconnected\", \"tooltip\": \"Disconnected\", \"class\": \"wifi-disconnected\"}"
fi


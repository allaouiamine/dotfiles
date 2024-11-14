#!/bin/bash

get_all_connected_devices() {
    while IFS= read -r line; do
        device_info=$(bluetoothctl info "$(echo "$line" | cut -d' ' -f2)")
        device_name=$(echo "$line" | cut -d' ' -f3-)
        device_battery=$(echo "$device_info" | grep "Battery Percentage" | awk '{print $3}' | tr -d '()')
        device_type=$(echo "$device_info" | grep "Icon:" | cut -d' ' -f2-)

        if [ -n "$device_battery" ]; then
            echo "$device_name ($device_battery%)"
        else
            echo "$device_name"
        fi
    done < <(bluetoothctl devices Connected)
}

if bluetoothctl show | grep -q "Powered: yes"; then
    # Get first connected device for main display
    connected_device=$(bluetoothctl devices Connected | head -n 1 | cut -d' ' -f3-)
    
    if [ -n "$connected_device" ]; then
        # Get all connected devices for tooltip
        tooltip="Connected devices:\\n"
        while IFS= read -r device; do
            tooltip="$tooltip$device\\n"
        done < <(get_all_connected_devices)
        
        # Output for waybar with first device name and all devices in tooltip
        echo "{\"text\": \"󰂱 $connected_device\", \"tooltip\": \"$tooltip\", \"class\": \"bluetooth-connected\"}"
    else
        echo "{\"text\": \"󰂯\", \"tooltip\": \"No devices connected\", \"class\": \"bluetooth-on\"}"
    fi
else
    echo "{\"text\": \"󰂲\", \"tooltip\": \"Bluetooth is off\", \"class\": \"bluetooth-off\"}"
fi

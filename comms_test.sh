#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://twitter.com")

logfile="comms_log.txt"

>"$logfile"

for site in "${websites[@]}"; do
    if curl -s -L --head --request GET -w "%{http_code}\n" "$site" | grep "^2" >/dev/null; then
        echo "[$site]($site) is UP" >>"$logfile"
    else
        echo "[$site]($site) is DOWN" >>"$logfile"
    fi
done

echo "Comms check result writen to $logfile"

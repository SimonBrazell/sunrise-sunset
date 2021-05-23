#!/bin/sh

LATITUDE="YOUR_LATITUDE"
LONGITUDE="YOUR_LONGITUDE"
MAC_ADDRESS="YOUR_MAC_ADDRESS"
BROADCAST_ADDRESS="YOUR_BROADCAST_ADDRESS"

SUNRISE=$(curl -s "https://api.sunrise-sunset.org/json?lat=$LATITUDE&lng=$LONGITUDE&date=today&formatted=0" | jq '.results.sunrise')

SUNRISE="${SUNRISE%\"}"
SUNRISE="${SUNRISE#\"}"

echo "$(echo "$(date -d $SUNRISE +"%M")") $(echo "$(date -d $SUNRISE +"%H")") * * * /usr/bin/wakeonlan -i $BROADCAST_ADDRESS $MAC_ADDRESS && /usr/local/bin/sunrise-startup" > /etc/crontabs/root

/etc/init.d/cron restart
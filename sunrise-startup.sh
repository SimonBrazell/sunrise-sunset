#!/bin/sh

LATITUDE="YOUR_LATITUDE"
LONGITUDE="YOUR_LONGITUDE"
MAC_ADDRESS="YOUR_MAC_ADDRESS"
BROADCAST_ADDRESS="YOUR_BROADCAST_ADDRESS"

URL="https://api.sunrise-sunset.org/json?lat=$LATITUDE&lng=$LONGITUDE&date=$(date --date='next day' +'%Y-%m-%d')&formatted=0"

if ! OUTPUT=$(curl --write "%{http_code}\n" --fail --silent --request GET --header "Content-Type: application/json" "$URL"); then
  echo "$(echo "$(date +"%M")") $(echo "$(date +"%H" | awk '{ SUM=$1+1} END { print SUM }')") * * * /usr/local/bin/sunrise-startup" > /etc/crontabs/root
else
  SUNRISE=$(echo $OUTPUT | jq '.results.sunrise')
  SUNRISE="${SUNRISE%\"}"
  SUNRISE="${SUNRISE#\"}"
  echo "$(echo "$(date -d $SUNRISE +"%M")") $(echo "$(date -d $SUNRISE +"%H")") $(date -d $SUNRISE +"%d") $(date -d $SUNRISE +"%m") * /usr/bin/wakeonlan -i $BROADCAST_ADDRESS $MAC_ADDRESS && /usr/local/bin/sunrise-startup" > /etc/crontabs/root
fi

/etc/init.d/cron restart

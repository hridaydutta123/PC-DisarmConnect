#!/bin/sh

while true
do
	#connected = $(nmcli dev wifi con "DisarmHotspotDB")
	conn=`nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2`
	echo $conn
	if [ "$conn" != "yes:DisarmHotspotDB" ]
	then
			nmcli dev wifi con "DisarmHotspotDB"
			if [ "$conn" != "yes:DisarmHotspot" ]
			then
				nmcli dev wifi con "DisarmHotspot"
			fi
	
	fi

	sleep 10
	
done
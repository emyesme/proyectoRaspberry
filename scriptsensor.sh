
#!/bin/bash


while [ true ]
do
	temperatura=$(python BMP180.py | head -n1 | tail -1)
	presion=$(python BMP180.py | head -n2 | tail -1)
	altitud=$(python BMP180.py | head -n3 |tail -1)
	presionNivelMar=$(python BMP180.py | head -n4 | tail -1)
	
	echo ${temperatura}
	echo ${presion}
	echo ${altitud}
	echo ${presionNivelMar}
	
	curl --silent --request POST --header "X-THINGSPEAKAPIKEY: WNZ4XJ8Z8S3E0DWO" --data "field1=${temperatura}&field2=${presion}&field3=${altitud}&field4=${presionNivelMar}" http://api.thingspeak.com/update
 
	
	sleep 3m

done

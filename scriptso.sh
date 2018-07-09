#!/bin/bash

while [ true ]
do

	#porcentaje cpu de sistema
	cpuUsuario=$(top | head -n3 | tail -1 | cut -d ',' -f1 | awk {'print $(NF-1)'})
	cpuSistema=$(top | head -n3 | tail -1 | cut -d ',' -f2 | awk {'print $(NF-1)'})
 
	cpuTotal=`echo "$cpuUsuario + $cpuSistema" | bc`

	echo ${cpuTotal}


	#carga del sistema
	carga1=$(cat /proc/loadavg | cut -d ' ' -f1)
	echo ${carga1}
	
	#disco libre
	discoLibre=$(df | grep root | awk '{print ($4/($3+$4))*100.0}')
	echo ${discoLibre}

	#ram

	ram=$(free -m | grep Mem | awk '{print ($3/512.0)*100.0}')
	echo ${ram}
	#velocidad de subida y de bajada
	carga=$(python speedtest.py | grep 'Upload:' | cut -d ' ' -f2)
	descarga=$(python speedtest.py | grep 'Download:' | cut -d ' ' -f2)
	echo ${carga}
	echo ${descarga}

	#crontab -e tareas que se van a correr y su periodicidad

	#instruccion para subir la informacion
	curl --silent --request POST --header "X-THINGSPEAKAPIKEY: BG5CLAHII6CHQZAT" --data "field1=${cpuTotal}&field2=${carga1}&field3=${discoLibre}&field4=${ram}&field5=${carga}&field6=${descarga}" http://api.thingspeak.com/update
 
	sleep 3m

done

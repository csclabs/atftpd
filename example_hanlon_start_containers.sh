#!/bin/bash
docker run -d --name mongodb dockerfile/mongodb
docker run -d -p 8026:8026 --name hanlon --link mongodb:mongo cscdock/hanlon

while true; do 
	curl -I http://127.0.0.1:8026/hanlon/api/v1/config/ipxe
	rc=$?
	if [[ $rc == 0 ]] ; then
		docker run -d -p 69:69 --link hanlon:hanlon jcpowermac/atftpd
    		exit 0
	fi
	sleep 5
done


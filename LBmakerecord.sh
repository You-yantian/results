#!/bin/bash

> lograte.csv
> logrespondTime.csv
> logsession.csv
> logErrorRespond.csv
> logttime.csv
for i in {1..400}
do
	now=$(date +%c)
	echo "show stat" | sudo nc -U /var/run/haproxy/haproxy.sock | cut -d "," -f 5,15,34,61,62 | column -s, -t
	echo "$now"
	echo "show stat" | sudo nc -U /var/run/haproxy/haproxy.sock | cut -d "," -f 34 | tr "\n" "\t" >> lograte.csv
	echo "$now" >> lograte.csv
	echo "show stat" | sudo nc -U /var/run/haproxy/haproxy.sock | cut -d "," -f 61 | tr "\n" "\t" >> logrespondTime.csv
	echo "$now" >> logrespondTime.csv
	echo "show stat" | sudo nc -U /var/run/haproxy/haproxy.sock | cut -d "," -f 5 | tr "\n" "\t" >> logsession.csv
	echo "$now" >> logsession.csv
	echo "show stat" | sudo nc -U /var/run/haproxy/haproxy.sock | cut -d "," -f 15 | tr "\n" "\t" >> logErrorRespond.csv
	echo "$now" >> logErrorRespond.csv
	echo "show stat" | sudo nc -U /var/run/haproxy/haproxy.sock | cut -d "," -f 62 | tr "\n" "\t" >> logttime.csv
	echo "$now" >> logttime.csv
	sleep 30s
done

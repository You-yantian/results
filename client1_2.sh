#!/bin/bash

for i in {1..200}
do
	now=$(date +%c)i
	if [ $i -le 100 ]
        then
         rate=`expr $i \* 15 + 200`
	else
	 rate=`expr 3300 - $i \* 15`
	fi
        httperf --server 192.168.3.75 --port 80 --num-conns 80000 --rate=${rate}
        #date +%s
	echo "$now, $rate" >>log.csv
done


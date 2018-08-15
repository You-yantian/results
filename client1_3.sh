#!/bin/bash

for i in {1..200}
do
        now=$(date +%c)
	if [ $i -le 100 ]
	then
	  echo "$i<=100"
	  rate=`expr $i \* 20 + 100`
	else
	  echo "$i>100"
	  rate=`expr 4100 - $i \* 20`
	fi
        httperf --server 192.168.3.75 --port 80 --num-conns 80000 --rate=${rate}
        echo "$now, $rate" >>log.csv

done


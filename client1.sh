#!/bin/bash

for i in {1..300}
do
        now=$(date +%c)
	if [ $i -le 150 ]
        then
	 rate=`expr $i \* 10 + 300`
	else
	 rate=`expr 3500 - $i \* 10`
        fi
	httperf --server 192.168.3.75 --port 80 --num-conns 80000 --rate=${rate}
        #echo "${date +%s}, ">>log.csv
        echo "$now, $rate" >>log.csv
done


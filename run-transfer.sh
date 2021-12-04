#!/bin/bash
i=184
while :
do
	sudo nohup tcpdump --interface enp0s3 host 122.116.59.198 -w sample-$i.pcap &
	sleep 1

	./script.exp
	sleep 1

	sudo killall tcpdump
	((i++))
	sleep 5
done

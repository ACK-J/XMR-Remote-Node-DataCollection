#!/bin/bash
i=0
while :
do
	sudo nohup tcpdump --interface enp0s3 host 122.116.59.198 -w sample-update-$i.pcap &
	sleep 1

	./update-chain.exp
	sleep 1

	sudo killall tcpdump
	((i++))
	sleep $[ ( $RANDOM % 240 + 10 ) ]s
done

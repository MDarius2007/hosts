#!/bin/bash

cat /etc/hosts | while read ip nume trash;
do
	if [ -n "$ip" ] && [ "$ip" != "#" ]; then
		nslookup "$nume" | grep -q "$ip"
		if [ $? -ne 0 ]; then
			echo "Bogus IP for $nume in /etc/hosts!"
		fi
	fi
done

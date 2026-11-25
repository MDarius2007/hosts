#!/bin/bash

f() {
	nslookup "$1" "$3" | grep -q "$2"
	if [ $? -ne 0 ]; then
		echo "Bogus IP for $1 in /etc/hosts!"
	fi
}

cat /etc/hosts | while read ip nume trash;
do
	if [ -n "$ip" ] && [ "$ip" != "#" ]; then
		f "$nume" "$ip" "8.8.8.8"
	fi
done
echo "Modificat de Rares"

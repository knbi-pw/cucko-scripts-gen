#!/bin/bash
echo "drop malwarebazaar batch!"
cd /mnt/sdb2/MAGAZINE/ARMED/
EXT='.zip'
today=$(date -d '%Y-%m-%d')
d=2020-05-11 #SET START DATE HERE!!
while [ "$d" != today ]; do 
	c="${d}${EXT}"
	echo "dropping"
	wget https://mb-api.abuse.ch/downloads/$c
	mkdir -p ${d}
	7z e ${c} -pinfected -o${d}
	rm  -v ${c}
	d=$(date -I -d "$d + 1 day")
done
echo "will now su to cuckoo user!"
su - cuckoo -c "cuckoo submit --unique  /mnt/sdb2/MAGAZINE/ARMED/"

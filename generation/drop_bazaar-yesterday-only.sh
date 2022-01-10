#!/bin/bash
echo "drop malwarebazaar batch!"
#date +'FORMAT'
datestring=$(date +'%Y-%m-%-1d') 
### mm/dd/yyyy ###
#echo date+'%Y/%m/%d'
cd /mnt/sdb2/MAGAZINE/ARMED/
#cd /mnt/sdb2/MAGAZINE/STAGING
EXT='.zip'
#c="${datestring}${EXT}"
#OUT=$datestring+$EXT
#echo $c
yester=$(date -d "yesterday" '+%Y-%m-%d')
#echo $yester
c="${yester}${EXT}"
echo "dropping"
wget https://mb-api.abuse.ch/downloads/$c

mkdir -p ${yester}

7z e ${c} -pinfected -o${yester}
rm  -v ${c}
echo "will now su to cuckoo user!"
su - cuckoo -c "cuckoo submit --unique  /mnt/sdb2/MAGAZINE/ARMED/" 


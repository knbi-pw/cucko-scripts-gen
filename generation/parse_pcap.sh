#!/bin/bash

COUNTER_min=$1
COUNTER_max=$2
PORT=9001
echo "Analysis dump range start: "$COUNTER_min
echo "Analysis dump range end: "$COUNTER_max
#########
for ((i=$COUNTER_min;i<=$COUNTER_max;i++)); do
    

#########
echo "analysis number: "$i
URL_EVAL=$(curl -s  http://localhost:9001/analysis/$i/network/ | grep pcap | grep -Po '(?<=href=")[^"]*(?=")')
STATIC="http://localhost:9001"
FP=$STATIC$URL_EVAL
MD5=$(curl -s http://localhost:9001/analysis/$i/summary/| sed -n 's/<tt>\(.*\)<\/tt>/\1/Ip' | sed -n 's/<td class="break-everywhere">\(.*\)<\/td>/\1/Ip' | head -n 1
)
FNAME=$MD5".pcap"
echo "PCAP URL: "$FP
echo "FILE MD5: "$MD5
echo "PCAP #: "$i" URL: "$FP "FILE MD5: "$MD5 >> ./summary.txt
wget -q -O $FNAME $FP
done
#echo "generaring entropy...."
#mkdir -p public_repo
#cd ./public_repo
#cp ../*.pcap .
#a=0
#for i in *.pcap; do
#  new=$(printf "%04d.pcap" "$a") #04 pad to length of 4
#  mv -i -- "$i" "$new"
#  let a=a+1
#done
#echo "crypto done!"
echo "Exit();"

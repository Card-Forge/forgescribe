#!/bin/bash
setname=$1
wget -q -O /tmp/set.json "https://api.scryfall.com/sets/$setname?format=json"

sleep 0.1

count=`cat /tmp/set.json | jq .card_count`

echo "Found $count cards.."
echo "">oracles.txt
for i in $(seq 1 $count);
do
	sleep 0.1
	wget -q -O /tmp/$i.json "https://api.scryfall.com/cards/$setname/$i?format=json"
	name=`cat /tmp/$i.json | jq .name | sed "s/\"//g"`
	echo $name
	cat /tmp/$i.json | jq .oracle_text | sed "s/\"//g" | sed "s/Oracle://g" | sed "s/${name}/CARDNAME/g" | sed "s/
done


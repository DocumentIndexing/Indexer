#!/bin/sh

COUNTER=0
if [ -z $ELASTIC_URL ]; then
    ELASTIC_URL=elasticSearch:9200
fi
printf "waiting for $ELASTIC_URL   "
until curl --output /dev/null --silent --head --fail $ELASTIC_URL; do
    printf '.'
    if [ $COUNTER -gt 20 ]; then
        printf "\n waited too long\n"
        exit 2
    fi
    sleep 5
    let COUNTER=COUNTER+1
done
echo "Available"
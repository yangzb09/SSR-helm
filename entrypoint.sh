#!/usr/bin/env bash
logs=${LOG_PATH:-/logs}
conf=${CONFIG_PATH:-./conf/config.yml}
loop=$1

for i in `seq 1 $loop`
do
epoch=`date +%s`

nohup /bin/bash /root/ssr start &> ./ssr.log
tail -f ./ssr.log

sleep 1

done

# sleep
while true; do sleep 100; done

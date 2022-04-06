#!/bin/bash
#MongoDB
mongod -f mongod.conf

#Perf
# perf record -a -g -F 99 -p $(pgrep mongod) -- sleep 120
# perf script > logs/perf-data.perf

tail -f logs/mongod.log
#!/bin/bash

source head.sh

param=$(</dev/stdin)

stuid=`echo $param | awk -F "&" '{print $1}' | awk -F "=" '{print $2}'`
testid=`echo $param | awk -F "&" '{print $2}' | awk -F "=" '{print $2}'`
subid=`echo $param | awk -F "&" '{print $3}' | awk -F "=" '{print $2}'`
score=`echo $param | awk -F "&" '{print $4}' | awk -F "=" '{print $2}'`

$mysqlcmd -e "insert into score(stuid, testid, subid, score) values($stuid, $testid, $subid, $score)"

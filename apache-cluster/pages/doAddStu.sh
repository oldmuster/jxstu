#!/bin/bash

source head.sh

param=$(</dev/stdin)

name=`echo $param | awk -F "&" '{print $1}' | awk -F "=" '{print $2}'`
age=`echo $param | awk -F "&" '{print $2}' | awk -F "=" '{print $2}'`

$mysqlcmd -e "insert into stu(name, age) values(\"$name\", $age)"

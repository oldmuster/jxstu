#!/bin/bash

source head.sh

slist=`$mysqlcmd -e 'select * from test' | grep -v name | sed 's/\t/,/g'`

echo "<table border=\"1\">"
echo "  <tr>"
echo "    <th>编号</th>"
echo "    <th>名称</th>"
echo "  </tr>"

for fieldList in $slist; do
  echo "<tr>"
  fieldList=`echo $fieldList | sed 's/,/ /g'`
  for field in $fieldList; do
    echo "<td>"$field"</td>"
  done
  echo "</tr>"
done

echo "<table>"

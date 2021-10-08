#!/bin/bash

source head.sh

slist=`$mysqlcmd -e 'select * from stu' | grep -v name | sed 's/\t/,/g'`

echo "<table border=\"1\">"
echo "  <tr>"
echo "    <th>编号</th>"
echo "    <th>姓名</th>"
echo "    <th>年龄</th>"
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

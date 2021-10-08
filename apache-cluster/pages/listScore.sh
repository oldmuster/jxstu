#!/bin/bash

source head.sh

slist=`$mysqlcmd -e 'select stu.name, subject.name, test.name, score.score from score  join stu on stuid=stu.id  join test on testid=test.id  join subject on subid=subject.id;' | grep -v name | sed 's/\t/,/g'`

echo "<table border=\"1\">"
echo "  <tr>"
echo "    <th>姓名</th>"
echo "    <th>课程</th>"
echo "    <th>考试</th>"
echo "    <th>成绩</th>"
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

#!/bin/bash


mysqlcmd="mysql -h192.168.5.250 -uroot -p123 -P8066 jx"

echo "Content-Type:text/html;"
echo ""

echo "<a href="/listStu.sh">学生列表</a>"
echo "<a href="/listTest.sh">考试表</a>"
echo "<a href="/listSubject.sh">科目表</a>"
echo "<a href="/listScore.sh">成绩单</a>"
echo "<a href="/addStu.html">添加学生</a>"
echo "<a href="/addScore.html">添加成绩</a>"


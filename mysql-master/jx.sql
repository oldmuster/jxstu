
create table stu( -- 创建学生表
  id int auto_increment,  -- 学生ID
  name varchar(20) not null,
  age int not null,
  primary key(id)
);
insert into stu(name, age) values('亮',95),('航','80'),('索',76);

create table subject( -- 创建科目表
  id int auto_increment, -- 科目ID
  name varchar(20) not null,
  primary key(id)
);
insert into subject(name) values('网工'),('运维');

create table test( -- 创建考试表
  id int auto_increment, -- 考试ID
  name varchar(20) not null,
  primary key(id)
);
insert into test(name) values('月考');

create table score( -- 创建分数表
  stuid int,  -- 学生ID
  testid int, -- 考试ID
  subid int,  -- 课程ID
  score int   -- 分数
);
insert into score(stuid, testid, subid, score) values(1,1,1,90);
insert into score(stuid, testid, subid, score) values(1,1,2,95);
insert into score(stuid, testid, subid, score) values(2,1,1,10);
insert into score(stuid, testid, subid, score) values(2,1,2,2);
insert into score(stuid, testid, subid, score) values(3,1,1,10);
insert into score(stuid, testid, subid, score) values(3,1,2,9);

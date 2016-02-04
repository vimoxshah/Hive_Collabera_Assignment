create table students(rollno string, schoolname string, name string, age int, gender char(1), class string, subject string, marks int) row format delimited fields terminated by '|';

load data local inpath '/home/vimox/Documents/collabera/assignments/Students-db.txt' into table students;

create table studentstotalmarks as select S.rollno, S.schoolname, S.name, S.age, S.gender, S.class, sum(marks) as totalmarks from students as S group by S.rollno, S.schoolname, S.name, S.age, S.gender, S.class;

select STM.schoolname, STM.class, STM.rollno, STM.name, STM.totalmarks from studentstotalmarks as STM join ( select ISTM.schoolname, ISTM.class, max(ISTM.totalmarks) as totalmarks from studentstotalmarks as ISTM group by ISTM.schoolname, ISTM.class ) as MMJ on (STM.schoolname = MMJ.schoolname AND STM.class = MMJ.class) where STM.totalmarks = MMJ.totalmarks;

select STM.class, STM.schoolname, STM.rollno, STM.name, STM.totalmarks from studentstotalmarks as STM join ( select ISTM.class, max(ISTM.totalmarks) as totalmarks from studentstotalmarks as ISTM group by ISTM.class ) as MMJ on (STM.class = MMJ.class) where STM.totalmarks = MMJ.totalmarks;

select * from studentstotalmarks order by schoolname, totalmarks;

 select STM.schoolname, STM.class, STM.gender from studentstotalmarks as STM join ( select ISTM.schoolname, ISTM.class, max(ISTM.totalmarks) as totalmarks from studentstotalmarks as ISTM group by ISTM.schoolname,ISTM.class ) as MMJ on (STM.schoolname = MMJ.schoolname AND STM.class = MMJ.class) where STM.totalmarks = MMJ.totalmarks;


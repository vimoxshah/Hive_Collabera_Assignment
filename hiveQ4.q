create table sales (salesid string, total_sales int, commission_per double) row format delimited fields terminated by '|';

load data local inpath '/home/sagarpatel/Documents/collabera/assignments/sales.txt' into table sales;

add jar /home/sagarpatel/Documents/collabera/submissions/Q4CommissionHiveUDF.jar

CREATE TEMPORARY FUNCTION ccalc AS 'CommissionCalc';

create table updatedsales as select *, ccalc(total_sales, commission_per) from sales;

create table users(id int, name string)row format delimited fields terminated by '|';


load data local inpath '/home/vimox/Documents/collabera/assignments/users.txt' overwrite into table users;


create table bucketed_users(id int, name string) clustered by (id) into 5 buckets;


insert overwrite table bucketed_users select * from users;

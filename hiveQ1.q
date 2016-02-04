
create table movies(id INT, name STRING, year INT) ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';

select * 
from movies as M 
where M.year in (
                select min(year) 
                from movies w
                here year!=0);
                
                
select movies.id, movies.name, movies.year
from movies left outer join movieratings on (movies.id = movieratings.movieid)
where movieratings.rating is null;

create table updatedmovies as 
select M.id, M.name, M.year, sum(MRT.rating) as numrating, avg(MRT.rating) as avgrating
from movies as M left outer join movieratings as MRT on (M.id = MRT.movieid)  
group by M.id, M.name, M.year;

select SQT.id, SQT.name, SQT.year
from ( select UM.id, UM.name, UM.year, rank() over (order by numrating desc) as rank from updatedmovies as UM ) as SQT
where SQT.rank < 4;


CREATE DATABASE Lab2;

create table countries(
country_id serial primary key ,
country_name varchar(50) ,
region_id int ,
population int
);

insert into countries values(default , 'Kazakhstan', 01, 18000000);

insert into countries (country_id, country_name) values (default , 'Canada');

update countries set region_id = null ;

insert into countries (country_id, country_name, region_id, population) values (default , 'Germany', 03, 19874000),
(default , 'France', 04, 15324880),
(default , 'Greece', 05, 27541);

alter table countries
alter column country_name set default 'Kazakhstan';

insert into countries values
(01, default , 05, 2000000);

insert into countries (country_id , country_name)
values (default , default );

create table countries_new(
like countries
);

insert into countries_new
select * from countries;

update countries_new set region_id = 1
where region_id is null ;

update countries_new set population = population + (population*0.1)
returning country_name, population as "New Population";

delete from countries
where population < 100000;

delete from countries_new
as cn using countries as co
where cn.country_id=co.country_id
returning *;

delete from countries
returning *;
-- Create a database
create database pmtz_202310g_class_01


-- create a table

create table students(
	id int,
	name varchar(30),
	email varchar(30),
	age int,
	gender varchar(6),
	subject varchar(10)
);

-- insert some students

-- Single Value

insert into students (id,name,email,age,gender,subject) values (1,'Basit','basit@gmail.com',20,'Male','English');

-- Multiple Value

insert into students (id,name,email,age,gender,subject) values
	(2,'Khan','khan@gmail.com',22,'Male','Urdu'),
	(3,'Fatima','fatime@gmail.com',18,'Female','Physics'),
	(4,'kashif','kashif@gmail.com',24,'Male','English');

-- select command

-- All Columns

select * from students;

-- Specific Columns

select name,email from students;

-- Update data

-- Update Single Value

update students
set age=23 where name='Khan'


-- Update Multiple Value

update students
set age=23,subject= 'Chemistry' where name='Khan'


update students
set age=20 , subject='English' where id=1 or id=3;



-- delete students

delete from students where gender='Female'

-- truncate

truncate table students

-- Drop Table

drop table students;

-- Drop Database

drop database pmtz_202310g_class_01;
create database Emp_database;
use Emp_database;

-- Table creation CREATE commend -- 

create table Departments(
department_id int,
department_name varchar(100)
);

create table Location(
location_id int,
location varchar (30)
);

create table Employees(
employee_id int,
employee_name varchar(50),
gender enum("M,F"),
age int,
hire_date date,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2)
);

-- Alter comment --

alter table Employees  
add column Email varchar(30);

alter table Employees
modify column designation varchar(150),
drop column age,
rename column hire_date to date_of_joining;

-- RENAME comment --

Rename table Departments to Departments_Info;
Rename table Location to Locations;

-- TRUNCATE comment --

truncate table Employees;

-- DROP comment --

drop table Employees; 
drop database emp_database;
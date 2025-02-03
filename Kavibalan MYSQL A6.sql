-- EMPLOYEE DATABASE CREATION --

create database if not exists EMPLOYEE;

use EMPLOYEE;

create table DEPARTMENTS(
Department_ID int auto_increment primary key,
Department_Name varchar(100) unique not null
);

create table LOCATIONS(
Location_ID int auto_increment primary key,
Location varchar(30) unique not null
);

create table EMPLOYEES(
Employee_ID int auto_increment primary key,
Employee_Name varchar(50) not null,
Gender enum ("M","F"),
Age int check (Age>=18),
Hire_Date datetime default current_timestamp,
Designation varchar(100),
Department_ID int not null,
Location_ID int not null,
Salary decimal(10,2),
foreign key (Department_ID) references DEPARTMENTS (Department_ID),
foreign key (Location_ID) references LOCATIONS (Location_ID)
);

 insert into LOCATIONS(Location)
 value ("Chennai"),
       ("Bangalore"),
       ("Hyderabad"),
       ("Pune");
   
 
 insert into DEPARTMENTS(Department_Name)
 values 
 ("Software Development"),
 ("Marketing"),
 ("Data Science"),
 ("Human Resources"),
 ("Product Manager"),
 ("Content Creation"),
 ("Finance"),
 ("Design"),
 ("Research and Development"),
 ("Customer Support"),
 ("Business Development"),
 ("IT"),
 ("Operations");
 
 
 insert into EMPLOYEES (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) 
 value
    (5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
    (5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
    (5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
    (5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
    (5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
    (5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
    (5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
    (5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
    (5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
    (5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
    (5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
    (5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
    (5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
    (5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
    (5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
    (5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
    (5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
    (5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
    (5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
    (5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
    (5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
    (5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
    (5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
    (5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
    (5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
    (5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
    (5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
    (5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
    (5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
    (5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);

-- Table views --

select* from departments;
select* from employees;
select* from locations;

-- 1. Before Insert Trigger --

select avg(salary) from employees;

Delimiter //

create trigger Automatically_sets_the_salary
Before Insert on employees
for each row
Begin

if new.Salary is null then 
set new.salary =(select avg(salary) from Employees);
End if;

End //
Delimiter ;

/* TEST 
insert to the new employee details */ 

 insert into EMPLOYEES (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id) 
 value
    (5031, 'abi Singh', 'M', 25, '2016-07-14', 'Data Analyst', 3, 4);

select * from employees;

-- 2. After Delete Trigger --

select year(max(Hire_Date)) as latest_year  from employees;


Delimiter //

create trigger deletion_of_emp_who_joined_most_recent_year
after delete on employees
for each row
Begin
declare latest_year int;

select year(max(Hire_Date)) into latest_year  from employees;

if year(old.Hire_Date) = latest_year then
signal sqlstate '45000'
set message_text = 'recent year joined employee Cannot be deleted';
end if;

End //
Delimiter ;

-- TEST --

delete from employees where Employee_ID = 5026; -- ---> This is " recent year joined employee Cannot be deleted "
delete from employees where Employee_ID = 5011; -- ---> its deleted-- 

select* from employees;
 
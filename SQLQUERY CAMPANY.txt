create database company
use company

create table employee (
SSN int primary key Identity(1,1),
gender varchar(10),
DOB date,
fname varchar(10),
lname varchar(10),
supervisorID int,
foreign key(supervisorID)references employee(SSN),

)
create table department (
departmentnum int primary key,
departmentname varchar(10),
SSN int,
supervisorID int,
foreign key(supervisorID)references employee(SSN),
foreign key(SSN)references employee(SSN),

)
create table departmentlocation (
departmentnum int primary key,
location varchar(20),
foreign key(departmentnum)references department(departmentnum),

)

create table project (
projectnum int primary key,
projectname varchar(20),
location varchar(50),
city varchar(10),
departmentnum int,
foreign key(departmentnum)references department(departmentnum),

)




create table dependents (
DependentName varchar(20) PRIMARY KEY,
DOB date,
gender varchar(10),
SSN int,
foreign key(SSN) references employee(SSN)
)


create table mywork (
SSN int primary key,
projectnum int,
hours int,
foreign key(SSN)references employee(SSN),
foreign key(projectnum)references project(projectnum)

)



insert into employee (gender,DOB,fname,lname,supervisorID) VALUES
('Male','2025-10-12','Saad','Abdullah',1),
('Female','2015-3-22','laila','Said',2),
('Female','2013-6-9','Amal','Ali',4),
('Male','2015-5-12','Ali','moosa',5),
('Female','2014-8-6','Aysha','Juma',3)


select * from employee

insert into department (departmentnum,departmentname,supervisorID)
Values
(0214,'IT',2),
(1024,'Busniss',5),
(2048,'Eng',4),
(1032,'Project',1),
(1052,'Finance',3)


select * from department

insert into departmentlocation (departmentnum,location)
values
(1052,'Muscat'),
(2048,'Sohar'),
(1032,'Sur'),
(0214,'Ibri'),
(1024,'Salalah')

select * from departmentlocation


insert into project (projectnum,projectname,location,city,departmentnum)
values
(01,'trafficlights','Muscat','Matrah',1052),
(04,'Smartphone','Sur','Surcity',1032),
(03,'smartcity','Salalah','Dhofar',0214),
(05,'smartcar','Ibri','Ibri',2048),
(02,'smartwatch','Sohar','Soharcity',1024)



select * from project


insert into dependents (DependentName,DOB,gender)
values
('IT','2015-5-12','Male'),
('Business','2014-8-6','Female'),
('Engg','2013-6-9','Female'),
('Finance','2025-10-12','Male'),
('Project','2015-3-22','Female')


select * from dependents

insert into mywork (SSN,projectnum,hours)
values
(101,5,2),
(102,3,8),
(103,4,4),
(104,3,7),
(105,5,9);

SELECT * FROM mywork
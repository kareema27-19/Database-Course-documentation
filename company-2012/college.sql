create database college
use college

create table hostel (
hostelID int primary key,
pincode int,
)
select * from hostel
--------------------------------------------------------
create table course (
courseID int primary key,
coursenamne varchar(30),
duration varchar(30),

)
select * from course
------------------------------------------------------
create table student (
studentID int primary key,
DOB date,
Fname varchar(20)not null,
Lname varchar(20)not null,
phoneno int not null,


)

alter table student
add departmentID int foreign key references department (departmentID)
select * from student
alter table student
add hostelID int foreign key references hostel (hostelID)
---------------------------------------------------------------------
create table subj2 (
subjID int primary key identity(1,1),
subjname varchar(20),
facultyID int foreign key references faculty2(facultyID)

)
select * from subj
------------------------------------------------------------------------
create table faculty2(
facultyID int primary key,
name varchar(10)not null,
mobileno int,
department varchar(20),
salary decimal (10,2) not null

)


select * from faculty2
-----------------------------------------------------------
create table exam (
examID int primary key,
room varchar(10)null,
time varchar(10),
date date,
departmentID int,
foreign key(departmentID)references department(departmentID)

)
select * from exam
--------------------------------------------------------------
create table department (
departmentID int primary key,
departmentname varchar(30),
)

select * from department
----------------------------------------------------------------
create table studentcourse (
studentID int not null,
foreign key(studentID) references student(studentID),
courseID int not null,
foreign key(courseID) references course(courseID),
primary key (studentID,courseID)

)

select * from  studentcourse
-------------------------------------------------------------------
create table studentexam (
studentID int not null,
foreign key (studentID) references student(studentID),
examID int not null,
foreign key (examID) references exam(examID),
primary key (studentID,examID)

)
select * from studentexam
-------------------------------------------------------------------
create table studentsubj (
studentID int not null,
foreign key(studentID) references student(studentID),
subjID int not null,
foreign key(subjID) references subj(subjID),
primary key (studentID,subjID)

)
select * from studentsubj
--------------------------------------------------------------------------------------

insert into hostel (hostelID,pincode)
values
(111,012),
(112,013),
(113,014)
select * from hostel
----------------------------------------------------------------
insert into course (courseID,coursenamne,duration)
values
(100,'Math',4),
(101,'Arabic',2),
(102,'IT',3)
select * from course
--------------------------------------------------------------
insert into department (departmentID,departmentname)
values
(512,'ITdepartment'),
(342,'Englishdepartment'),
(410,'Engdepartment')
select * from department
-------------------------------------------------------------------------------
insert into student (studentID,DOB,Fname,Lname,phoneno,departmentID,hostelID)
values
(254,'2010-11-14','Ahed','Said','92041570',512,111),
(341,'2010-11-14','Ali','Saad','72157900',342,112),
(593,'2007-08-27','Aysha','Mosa','91402127',410,113);
select * from student

-----------------------------------------------------------------------------
insert into faculty2 (facultyID,name,mobileno,department,salary)
values
(568,'Ahmed',98124700,'ITdepartment',532.12),
(142,'Nahed',91000478,'Englishdepartment',710.14),
(318,'Nasser',72104892,'Engdepartment',814.50);

select * from faculty2
---------------------------------------------------------------------------

insert into exam (examID,room,time,date,departmentID)
values
(581,'room1','10:00','2024-11-01',512),
(347,'room2','04:00','2024-10-20',342),
(378,'room3','02:00','2024-09-04',410);

-----------------------------------------------------------------


insert into faculty2 (facultyID,name,mobileno,department,salary)
values
(568,'Ahmed',98124700,'ITdepartment',532.12),
(142,'Nahed',91000478,'Englishdepartment',710.14),
(318,'Nasser',72104892,'Engdepartment',814.50);


select * from faculty2

----------------------------------------------------------------------

insert into subj2 (subjname,facultyID)
values 
('Math1',568),
('Math2',142),
('Math3',318);

select * from subj2


SELECT facultyID FROM faculty2;
-----------------------------------------------------------------

subjID int primary key identity(1,1)
subjname varchar(20),
facultyID int,
foreign key(facultyID) references faculty2(facultyID)


select * from subj2
---------------------------------------------------------------------

insert into studentcourse (studentID,courseID)
values
(254,100),
(341,101),
(593,102);
---------------------------------------------------------

insert into  studentexam (studentID,examID)
values
(254,347),
(341,378),
(593,581);
--------------------------------------------------------------
create table studentsubj2(
studentID int,
subjID int,
primary key (studentID,subjID)
)
----------------------------------------------------------

insert into studentsubj2(studentID,subjID)
values
(254,1),
(341,2),
(593,3);

select subjID from subj2

select * from studentsubj2
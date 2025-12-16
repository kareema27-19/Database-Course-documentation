create database banking
use banking

create table customer (
customerID int primary key identity(1,1),
name varchar(20),
DOB date,

)
select * from customer
----------------------------------------------
create table account (
accountID int primary key identity(1,1),
date_of_duration date,
balance int,
saving decimal (10,2),
checking decimal (10,2),
customerID int,
foreign key(customerID) references customer(customerID)

)
select * from account
--------------------------------------------------------------------
alter table customer
add accountID int foreign key references account(accountID)
-------------------------------------------------------
create table customerAddress (
customeraddress varchar(30),
customerID int,
foreign key(customerID) references customer(customerID)

)
drop table customerAddress
select * from customerAddress
ALTER TABLE customerAddress
ADD CONSTRAINT PK_Address PRIMARY KEY (customerAddress);



create table customerAddress (
customeraddress varchar(30) primary key,
customerID int,
foreign key(customerID) references customer(customerID)

)
select * from customerAddress
-------------------------------------------------
create table customerphone (
customerphon int primary key,
customerID int,
foreign key(customerID) references customer(customerID)

)

select * from customerphone 
-----------------------------------------------
create table transactions (
uniquetransactions int,
amount int,
transfers int,
date date,
deposits int,
withdrawals int,
accountID int,
foreign key(accountID) references account(accountID)

)
drop table transactions
select * from transactions 

create table transactions (
uniquetransactions int primary key,
amount int,
transfers int,
date date,
deposits int,
withdrawals int,
accountID int,
foreign key(accountID) references account(accountID)

)
drop table transactions


create table transactions (
transactionsID int primary key,
amount decimal(10,2),
transfers decimal(10,2),
date date,
deposits decimal(10,2),
withdrawals decimal(10,2),
accountID int,
foreign key(accountID) references account(accountID)

)
-----------------------------------------------
create table loan (
loanID int,
amount int,
issuedate date,
type varchar(20),
customerID int,
foreign key(customerID) references customer(customerID)

)
drop table loan
select * from  loan

create table loan (
loanID int primary key,
amount int,
issuedate date,
type varchar(20),
customerID int,
foreign key(customerID) references customer(customerID)

)
-------------------------------------------------
create table branch (
branchID int primary key,
branchaddress varchar(20),
phoneNO int,
)
select * from branch
-----------------------------------
create table employee (
employeeID int primary key identity(1,1),
position varchar(10),
employeename varchar(20),
branchID int,
foreign key(branchID) references branch(branchID)

)
select * from employee
-----------------------------------------------
create table customerassist (
actiontype varchar(20),
customerID int,
foreign key(customerID) references customer(customerID),
employeeID int,
foreign key(employeeID) references employee(employeeID),
primary key (customerID,employeeID)

)


select * from customerassist
-------------------------------------------------------------------------------------------------------


insert into customer (name,DOB,accountID)
values
('Murad','1998-01-24',3),
('Issa','1984-01-22',4),
('Maryam','2001-05-01',5);
select * from customer
-----------------------------------------


insert into account (date_of_duration,balance,saving,checking,customerID)
values
('1998-11-01',400,300.02,150.11,3),
('1991-04-02',815,215.11,125.10,4),
('2010-07-11',900,500.25,242.05,5);

select * from account
--------------------------------------------


insert into customerAddress (customeraddress,customerID)
values
('Suwaiq',3),
('Sur',4),
('Salalah',5);

select * from customerAddress
-----------------------------------------------



insert into customerphone (customerphon,customerID)
values
('92324130',3),
('91000480',4),
('74120081',5);
select * from customerphone
------------------------------------------------



insert into transactions (transactionsID,amount,transfers,date,deposits,withdrawals,accountID)
values
(911,111.25,204.10,'2024-01-25',252.30,110.35,3),
(910,500.20,400.55,'2025-01-25',300.05,100.01,4),
(909,600.05,500.90,'2024-05-10',400.05,200.50,5);

select * from transactions
----------------------------------------------------------------


insert into loan (loanID,amount,issuedate,type,customerID)
values
(11,100000,'2025-12-12','PersonalLoan',3),
(12,150000,'2024-10-25','Home Loan',4),
(13,200000,'2023-11-30','Vehicle Loan',5)
select * from loan

----------------------------------------------

)
insert into branch (branchID,branchaddress,phoneNO)
values
(312,'Muscat','24860841'),
(313,'Ibri','26860849'),
(314,'Sohar','26814000');

select * from branch
------------------------------------


 insert into employee (position,employeename,branchID)
 values
 ('manager1','Ameer',312),
 ('manager2','Aysha',313),
 ('manager3','Abdullah',314);

 select * from employee
 ------------------------------------------------


insert into customerassist (actiontype,customerID,employeeID)
values
('Deposit',3,1),
('Withdrawal',4,2),
('Transfer',5,3);

 select * from customerassist
 -----------------------------------------------------
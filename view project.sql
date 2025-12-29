
--Part 2: Real-Life Implementation Task (Banking System)---
CREATE TABLE Customer ( 
CustomerID INT PRIMARY KEY, 
FullName NVARCHAR(100), 
Email NVARCHAR(100), 
Phone NVARCHAR(15), 
SSN CHAR(9) 
);
select * from Customer

insert into Customer (CustomerID,FullName,Email,Phone,SSN)
values
(111,'said nasser','saidn@gmail.com','99999901','214'),
(112,'noor asaad','noor@gmail.com','91200152','215');
----------------------------------------------------------------
CREATE TABLE Account ( 
    AccountID INT PRIMARY KEY, 
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID), 
    Balance DECIMAL(10, 2), 
    AccountType VARCHAR(50), 
    Status VARCHAR(20) 
); 
select * from Account

insert into Account ( AccountID, CustomerID,Balance,AccountType, Status)
values
(1110,111,5000.50,'saving','active'),
(1111,112,10000.60,'checking','inactive');

----------------------------------------------------------------------

CREATE TABLE Transactions ( 
    TransactionID INT PRIMARY KEY, 
    AccountID INT FOREIGN KEY REFERENCES Account(AccountID), 
    Amount DECIMAL(10, 2), 
    Type VARCHAR(10), -- Deposit, Withdraw 
    TransactionDate DATETIME 
); 
select * from Transactions

insert into Transactions ( TransactionID, AccountID , Amount,Type, TransactionDate)
values
(01,1110,4500.00,'transfer','2024-02-14'),
(02,1111,2000.00,'deposite','2023-01-20');
-------------------------------------------------
CREATE TABLE Loan ( 
    LoanID INT PRIMARY KEY, 
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID), 
    LoanAmount DECIMAL(12, 2), 
    LoanType VARCHAR(50), 
    Status VARCHAR(20) 
); 
select * from Loan

insert into Loan (LoanID, CustomerID, LoanAmount,LoanType,Status )
values
(55550,111,15000.00,'Personal Loan','active'),
(55551,112,20000.00,'home Loan','active');
-----------------------------------------------------------

----Part 3: View Creation Scenarios---
--Use Simple Views to implement the following--
--1. Customer Service View ---
--Show only customer name, phone, and account status (hide sensitive info like SSN or balance)--

create view v_banksystem
as
select
c.FullName as CustomerName,
c.Phone,
a.Status as accountstatus
from Customer c inner join Account a
on c.CustomerID = a.CustomerID;
select * from v_banksystem
---------------------------------------------------------------------------
--2. Finance Department View ---
-- Show account ID, balance, and account type.--

create view v_FinanceDepartment
as
select
AccountID,
Balance,
AccountType
from Account a;
select * from v_FinanceDepartment
----------------------------------------------
--3. Loan Officer View --
--Show loan details but hide full customer information. Only include CustomerID.--

create view v_LoanOfficer
as 
select 
LoanID,
CustomerID,
LoanAmount,
LoanType,
Status
from Loan;
select * from v_LoanOfficer
------------------------------------------------------------------

--4. Transaction Summary View --
--Show only recent transactions (last 30 days) with account ID and amount.---
create view v_TransactionSummary
as 
select
TransactionDate,
AccountID,
amount
from Transactions t
where TransactionDate>= DateADD(DAy, -30,getdate());
select * from v_TransactionSummary

-----------------------------------------------------------------------

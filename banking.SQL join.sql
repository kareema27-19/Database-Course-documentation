---Bank Database---
select * from account
select * from branch
select * from customer
select * from customerAddress
select * from customerassist
select * from customerphone
select * from employee
select * from loan
select * from transactions
==============================================
--Display branch ID, name, and the name of the employee who manages it.---
select 
b.branchID,
b.branchaddress as branch_name,
e.employeename as branch_manager
from branch b inner join employee e
on e.branchID = b.branchID;
=================================================
---Display branch names and the accounts opened under each.---
select * from branch
select * from account
alter table branch
add accountID int;

alter table branch
add constraint FK_branch_account
 foreign key (accountID) references account(accountID);

  update branch
 set accountID = 3 where branchID =312;
 update branch
 set accountID = 4 where branchID =313;
 update branch
 set accountID = 5 where branchID =314;
 ---Display branch names and the accounts opened under each.---
 select
 b.branchaddress as branch_name,
 a.accountID
 from branch b inner join account a
 on b.accountID = a.accountID;
=========================================================
---Display full customer details along with their loans.--- 
select 
c.customerID,
c.name,
c.DOB,
c.accountID,
l.amount as customer_loan
from customer c inner join loan l
on c.customerID = l.customerID;
============================================
--Display loan records where the loan office is in 'Alexandria' or 'Giza'.---
---we don't have office in 'Alexandria' or 'Giza'---
============================================================================
 --Display account data where the type starts with "S" (e.g., "Savings").----
 select 
 a.accountID,
 a.date_of_duration,
 a.balance,
 a.saving,
 a.checking,
 a.customerID,
 l.type 
 from account a inner join loan l
 on a.customerID = l.customerID
 where type like 'S%';

 =========================================================================
 --List customers with accounts having balances between 20,000 and 50,000.---
 select 
 c.customerID,
 c.name as customer_name,
 c.accountID,
 a.balance
 from customer c inner join account a
 on c.customerID = a.customerID
 where balance between 20.000 and 50.000;
 ========================================================

select * from branch
select * from loan
select * from customer

alter table branch
add loanID int;


alter table branch
add constraint FK_branch_loan 
 foreign key (loanID) references loan(loanID);

 
 update branch
 set loanID = 11 where branchID =312;
 
 update branch
 set loanID = 12 where branchID =313;
 update branch
 set loanID = 13 where branchID =314;
=================================================================
---Retrieve customer names who borrowed more than 100,000 LE from 'Cairo Main Branch'.---

select 
c.name as customer_name,
l.amount as customer_borrowed,
b.branchaddress as main_branch
from customer c inner join loan l
on c.customerID = l.customerID
inner join  branch b
on l.loanID = b.loanID
where l.amount>100000
and b.branchaddress = 'Sohar';

======================================================================================
---Find all customers assisted by employee "Amira Khaled".----

select * from account
select * from customer

select 
c.actiontype,
c.customerID,
c.employeeID,
e.employeename
from customerassist c inner join employee e
on c.employeeID = e.employeeID
where employeename ='Ameer';
==================================================================
--Display each customer’s name and the accounts they hold, sorted by account type.--- 


SELECT
    c.name AS customer_name,
    'Saving' AS account_type
FROM customer c
INNER JOIN account a
    ON c.customerID = a.customerID
WHERE a.saving IS NOT NULL AND a.saving > 0

UNION ALL

SELECT
    c.name AS customer_name,
    'Checking' AS account_type
FROM customer c
INNER JOIN account a
    ON c.customerID = a.customerID
WHERE a.checking IS NOT NULL AND a.checking > 0

ORDER BY account_type;
=============================================================================
---For each loan issued in Cairo, show loan ID, customer name, employee handling it, and branch name.---

select * from loan
select * from customer
select * from branch
select * from employee

select 
l.issuedate as loan_issued,
l.loanID,
c.name,
e.employeename,
b.branchaddress as branch_name
from customer c inner join loan l
on l.customerID = c.customerID
inner join branch b
on l.loanID = b.loanID
inner join employee e
on b.branchID = e.branchID;

=======================================================================
---Display all employees who manage any branch.----
select * from employee
select * from branch

select
 e.employeename as employee_manager,
 b.branchaddress
 from employee e inner join branch b
 on e.branchID = b.branchID;

 ============================================================================

  ---Display all customers and their transactions, even if some customers have no transactions yet----
  select * from customer
  select * from transactions

  select
  c.name as customer_name,
  t.deposits,
  t.withdrawals,
  t.transfers
  from customer c inner join transactions t
  on c.accountID = t.accountID;
  ===============================================================================
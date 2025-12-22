----1. Display the department ID, department name, manager ID, and the full name of the manager.----
select * from Departments
select * from Dependent
select * from Employee
select * from Project
select * from Works_for

select
d.Dname,
d.Dnum,
d.MGRSSN,
e.Fname + ' ' + e.Lname as managerfullname
from Departments d inner join Employee e
on d.MGRSSN = e.SSN;

=====================================================

----Display the names of departments and the names of the projects they control.-----

select
d.Dname as departmentname,
p.Pname as projectname
from Departments d inner join Project p
on  d.Dnum = p.Dnum;
=========================================================

---Display full data of all dependents, along with the full name of the employee they depend on.----------

select 
d.ESSN,
d.Dependent_name,
d.Sex,
d.Bdate,
e.Fname + ' ' + e.Lname as fullname
from Dependent d inner join  Employee e
on d.ESSN = e.SSN;

====================================================================
---Display the project ID, name, and location of all projects located in Cairo or Alex----

select 
p.Pnumber as projectID,
p.Pname as projectname,
p.Plocation as projectlocation
from Project p inner join Departments d
on p.Dnum = d.Dnum
where P.City in ('Cairo','Alex');
=========================================================
---Display all project data where the project name starts with the letter 'A'-----
select
p.Pname,
p.Pnumber,
p.Plocation,
p.City,
p.Dnum
from Project p
where pname like 'A%'; 
=========================================================
-----Display the IDs and names of employees in department 30 with a salary between 1000 and 2000 LE.-----
select 
SSN as EmployeeID,
Fname + ' ' + Lname as Employeename
from Employee 
where Dno = 30 
and salary between 1000 and 2000;
=======================================================================

---Retrieve the names of employees in department 10 who work ≥ 10 hours/week on the "AL Rabwah" project.----
select 
e.Fname + ' ' + e.Lname as Employeename
from Employee e inner join Works_for w
on e.SSn = w.ESSN
inner join Project p
on w.Pno = p.Pnumber
where e.Dno =10 and w.hours >=10 and p.Pname = 'AL Rabwah';
================================================================================
---Find the names of employees who are directly supervised by "Kamel Mohamed"---
select 
e.Fname + ' ' + e.Lname as Employeename
from Employee e inner join Employee s
on e.Superssn = s.SSN
where s.Fname = 'Kamel' and s.Lname = 'Mohamed';
====================================================================================
---Retrieve the names of employees and the names of the projects they work on, sorted by project name.--------

select 
e.Fname + ' ' + Lname as Employeename,
p.Pname as projectname
from Employee e inner join works_for w
on e.SSn = w.ESSN
inner join Project p
on w.Pno=p.Pnumber
order by p.Pname;
==================================================================================


 ---For each project located in Cairo, display the project number, controlling department name, manager's last name,address,and birthdate.---
 select
 p.Pnumber as ProjectNumber,
 d.Dname as DepartmentName,
 e.Lname as ManaegrLastname,
 e.Address,
 e.Bdate
 from Project p 
 inner join Departments d
 on p.Dnum = d.Dnum
 inner join Employee e
 on d.MGRSSN = e.SSN
 where p.Plocation = 'Cairo';

 =======================================================================

 ---Display all data of managers in the company.-----
 select e.*
 from Employee e 
 inner join Departments d
 On e.SSN = d.MGRSSN;
 ===================================================================
 Display all employees and their dependents, even if some employees have no dependents. 

 select
 e.SSN,
 e.Fname,
 e.LName,
 e.Address,
 e.Bdate,
 d.Dependent_name,
 d.Bdate AS Dependent_Bdate
fROM Employee e
Left join Dependent d
  On e.SSN = d.ESSN;
  =====================================================================================
--Display all employee data--
select * from employee
--Display employee first name, last name, salary, and department number--
select Fname,Lname,Salary,Dno from employee
--Display each employee’s full name and their annual commission (10% of annual salary) as annual_comm--

select Fname + ' ' + Lname as full_name,
salary * 12 * 0.10 as annual_comm from employee

--Display employee ID and name for employees earning more than 1000 LE monthly--

select SSN as employee_ID,
Fname + ' ' + Lname as employee_name from employee
Where salary > 1000

--Display employee ID and name for employees earning more than 10000 LE annually--
select SSN as employee_ID,
Fname + ' ' + Lname as employee_name from employee
Where salary * 12 > 10000;

 --Display names and salaries of all female employees--
 select Fname +' ' + Lname as full_name , salary
 from employee
 where Sex ='F'

 --Display employees whose salary is between 2000 and 5000--
 select Fname +' '+ Lname,salary
 from employee
 where salary between 2000 and 5000

 --Display employee names ordered by salary descending--
 select Fname +' '+ Lname as full_name , salary 
 from employee
 order by salary desc

  --Display the maximum, minimum, and average salary--
  select max(salary) as maxsalary,
  min(salary) as minsalary,
  avg(salary) as avgsalary
  from employee

  . --Display the total number of employee--
  SELECT COUNT(*)
FROM employee

 --Display employees whose first name starts with 'A'--
 SELECT *
FROM employee
WHERE fname LIKE 'A%'


 --Display employees who have no supervisor--
 select Fname + ' ' + Lname as full_name from employee
 where superssn is null

 --Insert your personal data into the employee table (Department = 30, SSN = 102672,superssn=112233,salary=3000)--

 insert into employee (Dno,SSN,superssn,salary)
 values(30,102672,112233,3000);
 select * from employee

 --Insert another employee (your friend) in department 30 with SSN = 102660, leaving salary and supervisor number null--
 insert into employee (Fname,Lname,Dno,SSN,salary,superssn)
 values('Amna','Ali',30,102660,null,null);
 select * from employee

  --Update your salary by 20%--

  update employee
  set salary =salary * .20
  where SSN = 102672;
  select * from employee


 --Increase salaries by 5% for all employees in department 30--
 update employee
 set salary = salary * 0.05
 where Dno =30;
 select * from employee

  --Delete employees with NULL salary--

  delete from employee
  where salary is null
  select * from employee


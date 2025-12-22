----college Database---
select * from course
select * from department
select * from exam
select *from faculty2
select * from hostel
select *from student
select * from studentcourse
select * from studentexam
select *from studentsubj2
select * from subj2
=====================================================================
---Display the department ID, name, and the full name of the faculty managing it.----
select
d.departmentID,
d.departmentname,
f.name as managerfullname
from department d inner join faculty2 f
on d.departmentname = f.department;

=======================================================================
-
alter table course
add departmentID int;

alter table course
add constraint FK_course_department 
 foreign key (departmentID) references department(departmentID);

 alter table course
 add studentID int;

 alter table course
 add constraint FK_course_student
 foreign key (studentID) references student(studentID);

 update course
 set departmentID = 342 where courseID =100;

 
 update course
 set departmentID = 410 where courseID =101;
 
 update course
 set departmentID = 512 where courseID =102;
 
 update course
 set studentID = 254 where courseID =100;
 
 update course
 set studentID = 341 where courseID =101;
 update course
 set studentID = 593 where courseID =102;
 ==========================================================================
 --Display each program's name and the name of the department offering it.----
---instead of program's name I will used course's name, because I don't have program.---
select 
c.coursenamne,
d.departmentname
from department d inner join course c
on c.departmentID = d.departmentID;

======================================================================
alter table student
add facultyID int;
alter table student 
add constraint FK_student_faculty2 
 foreign key (facultyID) references faculty2(facultyID);

  update student
 set facultyID = 142 where studentID =254;
   update student
 set facultyID = 318 where studentID =341;
   update student
 set facultyID = 568 where studentID =593;
 =======================================================================

----Display the full student data and the full name of their faculty advisor.----
select 
s.studentID,
s.DOB,
s.Fname,
s.Lname as fullname,
s.phoneno,
s. departmentID,
s.hostelID,
f.name as faculty_advisor
from student s inner join faculty2 f
on s.facultyID = f.facultyID;
============================================================================

alter table exam
add studentID int;
alter table student 
add constraint FK_student_exam 
 foreign key (studentID) references student(studentID);
  update exam
 set studentID = 254 where examID =347;
  update exam
 set studentID = 341 where examID =378;
   update exam
 set studentID = 593 where examID =581;
 ===================================================================================================
  

----Display class IDs, course titles, and room locations for classes in buildings 'A' or 'B'----
select
e.examID as class_ID,
c.coursenamne as course_titles,
e.room as room_locations
from exam e inner join student s
on s.studentID = e.studentID
inner join course c
on s.studentID = c.studentID
where e.room in ('room A','room B');
==================================================================================
---Display full data about courses whose titles start with "I" (e.g., "Introduction to..."----
select *
from course c
where coursenamne like 'I%';
==========================================================================
--- Find names of students who are advised by "Dr. Ahmed Hassan". ----
 select 
 s.Fname,
 s.Lname,
 name as faculty_name
 from student s inner join faculty2 f
 on f.facultyID = s.facultyID
 where Fname = 'Ahmed';
 =============================================================================
 ---Retrieve each student's name and the titles of courses they are enrolled in, ordered by course title.--- 
 select 
 s.Fname + ' ' + s.Lname as students_name,
 c.coursenamne as course_titles
 from student s inner join course c
 on s.studentID = c.studentID
 order by c.coursenamne;
 ===================================================================
 --For each class in Building 'Main', retrieve class ID, course name, department name, and faculty name teaching the class.---
 select
 e.examID as class_ID,
 c.coursenamne as coures_name,
 d.departmentname,
 name as facultyname
 from exam e inner join course c
 on e.studentID = c.studentID
 inner join department d
 on c.departmentID = d.departmentID
 inner join faculty2 f
 on d.departmentname = f.department;

============================================================================================================
---Display all faculty members who manage any department---
select 
f.facultyID,
f.name,
f.mobi
from faculty2


select * from faculty2







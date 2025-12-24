--SQL Aggregation Functions--
create database  OnlineLearning
use OnlineLearning
CREATE TABLE Instructors (
InstructorID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE
);
select * from  Instructors
============================================
CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50)
);
select * from  Categories

=============================================
CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
Title VARCHAR(100),
InstructorID INT,
CategoryID INT,
Price DECIMAL(6,2),
PublishDate DATE,
FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
select * from  Courses
=========================================================
CREATE TABLE Students ( 
StudentID INT PRIMARY KEY, 
FullName VARCHAR(100), 
Email VARCHAR(100), 
JoinDate DATE 
);
select * from  Students
======================================================
CREATE TABLE Enrollments ( 
EnrollmentID INT PRIMARY KEY, 
StudentID INT, 
CourseID INT, 
EnrollDate DATE, 
CompletionPercent INT, 
Rating INT CHECK (Rating BETWEEN 1 AND 5), 
FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
); 
select * from Enrollments
======================================================

INSERT INTO Instructors VALUES 
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'), 
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21');
================================================
INSERT INTO Categories VALUES 
(1, 'Web Development'), 
(2, 'Data Science'), 
(3, 'Business');
================================================
INSERT INTO Courses VALUES 
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'), 
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'), 
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'), 
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01');
====================================================

INSERT INTO Students VALUES 
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'), 
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'), 
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10'); 
INSERT INTO Enrollments VALUES 
(1, 201, 101, '2023-04-10', 100, 5), 
(2, 202, 102, '2023-04-15', 80, 4), 
(3, 203, 101, '2023-04-20', 90, 4), 
(4, 201, 102, '2023-04-22', 50, 3), 
(5, 202, 103, '2023-04-25', 70, 4), 
(6, 203, 104, '2023-04-28', 30, 2), 
(7, 201, 104, '2023-05-01', 60, 3);
============================================================
select * from  Instructors
select * from   Categories
select * from  Courses
select * from  Students
select * from Enrollments

Part 1: Warm-Up

----1. Display all courses with prices.---

select Title,Price from courses
=======================================

 ---Display all students with join dates.---

 select FullName,JoinDate from Students
 ==========================================

  
  --Show all enrollments with completion percent and rating.--
  select
  EnrollmentID,
  CompletionPercent,
  Rating from Enrollments
  ==================================================
 
 ---Count instructors who joined in 2023.--
 
 select count(InstructorID) as Instrutors
 from Instructors
 =========================================

 --Count students who joined in April 2023.--
 select count(StudentID)as Student
 from Students
 ========================================
 Part 2: Beginner Aggregation 

--- Count total number of students.---
 select count(StudentID)as total_no_of_Student
 from Students
 =========================================

 --Count total number of enrollments.--- 
  
 select count(EnrollmentID)
 from Enrollments
 ============================================
 ---Find average rating per course. ---
 select avg(Rating) as avg_rating
 from Enrollments
================================================

 --Count courses per instructor.---
 select count (courseID) as Course,InstructorID
 from courses
 group by InstructorID;

 ===========================================

  ---Count courses per category.----
  select count (courseID) as Course,CategoryID
  from Courses
  group by CategoryID;
  ==============================================

  ----Count students enrolled in each course.------------

  select count (StudentID) as Student,CourseID
  from Enrollments
  group by CourseID;

  ===================================================
  ---Find average course price per category.----
  select avg(price) as averge_price,categoryID
  from courses
  group by categoryID;
  ==================================================
   --Find maximum course price.---
   select max(price)as max_course_price
   from courses
   =============================================
    --Find min, max, and average rating per course----
	
Select
courseID,
min(Rating) as min_rating,
max(Rating) as max_rating,
avg(Rating) as avg_rating
from Enrollments
group by courseID;
================================================
--Count how many students gave rating = 5.---
select count(StudentID) as Student,Rating
from Enrollments
group by Rating;
=========================================

Part 3: Extended Beginner Practice 

 --Count enrollments per month.---
 select count(EnrollmentID) as Enrollment,EnrollDate
 from Enrollments
 group by EnrollDate;
 =============================================
  ---Find average course price overall.---
  select avg(price) as avg_course_price
  from Courses;

  ===============================================
  . --Count students per join month.---
  select count(StudentID) as Student,JoinDate
  from Students
  group by JoinDate;
  ===========================================

  ---Count ratings per value (1–5).---
  select count(EnrollmentID) as value,Rating
  from Enrollments
  where Rating between 1 and 5
  group by Rating;

  ==============================================
   --Find courses that never received rating = 5.---
 

   SELECT c.CourseID, c.Title
FROM Courses c
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
    AND e.Rating = 5
WHERE e.CourseID IS NULL;
=============================================
select * from courses
---Count courses priced above 30.---
select count(Price) as course_price
from courses
where price>30;
================================================
select * from Enrollments
 ---Find average completion percentage.---
 select avg(CompletionPercent)as completion_percentage
 from Enrollments;
 ==================================================
  --Find course with lowest average rating.---
  select * from Enrollments

  select  
  Top 1 courseID,avg(Rating) as lowest_avg_Rating
  from  Enrollments
  group by courseID
  order by lowest_avg_Rating;
===================================================

Reflection (End of Day 1)

What was easiest?
the easiest one is join

 What was hardest? 
 the harest one is count

 What does GROUP BY do in your own words? 
 easy to find data from tables

 ==============================================

 Day 1 Mini Challenge 
Course Performance Snapshot 
Show: 
select * from Courses
--Course title---
select 
Title as course_title
from Courses;

---Total enrollments---
select * from Enrollments

---Average rating--
select avg(Rating)
from Enrollments;

 --Average completion %--
 select avg(CompletionPercent) as avg_completion
 from Enrollments;
 ==============================
 --Part 4: JOIN + Aggregation--
 select * from Courses
  select * from Instructors
   select * from Enrollments
 --Course title + instructor name + enrollments.--
 select
 C.Title as course_title,
 I.FullName as instructor_name,
 E.EnrollmentID
 from Courses C inner join Instructors I
 on C.InstructorID = I.InstructorID
 inner join Enrollments E
 on C.CourseID = E.CourseID;
 -------------------------------------------
 select * from  Categories
 ---Category name + total courses + average price.---

 SELECT 
    cat.CategoryName,
    COUNT(c.CourseID) AS total_courses,
    AVG(c.price) AS avg_price
FROM Courses c
JOIN Categories cat ON c.CategoryID = cat.CategoryID
GROUP BY cat.CategoryName;

======================================================




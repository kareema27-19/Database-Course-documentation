create database ProjectPart2
use ProjectPart2

create table library (
libraryID int primary key identity(100,1),
libraryName varchar (50) 
);
select * from library
-------------------------------------------
create table book (
bookID int primary key identity(1,1),
title varchar (200),
ISBN varchar (150),
genre varchar (30),
availability bit default 1,
libraryID int not null,
foreign key(libraryID) references library (libraryID)
);
select *from book
----------------------------------------------------------
create table member (
memberID int primary key identity(200,1),
fullName varchar (50),
email varchar (200),
phone varchar (20)
);
select * from member
------------------------------------------------
create table loan (
loanID int primary key identity(10,1),
loandate date not null,
duedate date not null,
returndate date not null,
Status VARCHAR(20) NOT NULL DEFAULT 'Issued'
CHECK (Status IN ('Issued','Returned','Overdue')),
finepaid decimal (10,2) default 0,
bookID int not null,
foreign key (bookID) references book (bookID),
memberID int not null,
foreign key (memberID) references member (memberID)
);
select * from loan
------------------------------------------------------------------
create table staff (
staffID int primary key identity(1,1),
position varchar(20),
fullname varchar(20),
libraryID int not null,
foreign key(libraryID) references library (libraryID)
);
select * from staff
--------------------------------------------------------
create table review (
reviewID int primary key identity(1,1),
reviewDate DATE,
rating INT NOT NULL
check (rating BETWEEN 1 AND 5),
bookID int not null,
foreign key (bookID) references book (bookID),
memberID int not null,
foreign key (memberID) references member (memberID)
);
select * from review
------------------------------------------------------------------
create table payment (
paymentID int primary key identity(1,1),
amount decimal (10,2),
paymentdate date,
loanID int,
foreign key (loanID) references loan (loanID)
);
select * from payment
alter table payment
add paymentmethod varchar (20)
--------------------------------------------------------
insert into library (libraryName )
values
('Al_Noor_library'),
('Al_Shams_library'),
('Al_Huda_library');
select * from library
=========================================================
insert into  book (title, ISBN, genre, availability, libraryID)
values
('The Silent River','9780306406157','Education',0,100),
('The Little Prince','9780596009205','Children',1,101),
('The Lost Kingdom','9780262033848','Education',0,102),
('Database Systems', 'ISBN001', 'Education', 0, 100),
('SQL Fundamentals', 'ISBN002', 'Education', 1, 101),
('Physics Basics', 'ISBN003', 'Science', 0, 102),
('Chemistry 101', 'ISBN004', 'Science', 1, 100),
('Children Stories', 'ISBN005', 'Children', 0, 101),
('The Great Gatsby', '9780743273565', 'Fiction', 1, 100),
('To Kill a Mockingbird', '9780061120084', 'Fiction', 0, 101),
('1984', '9780451524935', 'Fiction', 1, 102),
('A Brief History of Time', '9780553380163', 'NON-fiction', 1, 102),
('Sapiens', '9780062316097', 'NON-fiction', 0, 101),
('Oxford Dictionary', '9780198611868', 'Reference', 1, 100),
('Encyclopedia Britannica', '9781593392925', 'Reference', 1, 102),
('SQL for Beginners', '9781119538506', 'NON-fiction', 1, 101),
('Harry Potter and the Sorcerer''s Stone', '9780439708180', 'Childern', 1, 102),
('Charlotte''s Web', '9780064400558', 'Childern', 0, 100),
('The Little Prince', '9780156012195', 'Childern', 1, 102),
('The Hobbit', '9780547928227', 'Fiction', 1, 100);
select * from book
========================================================================
insert into member (phone,email,fullName)
values
('94712035','malakalnoor25@gmail.com','MobarkKhamis'),
('78120455','noorali@gmail.com','NoorAli'),
('90147821','amalali@gmail.com','AmalAli'),
('90123456', 'ali.hassan@gmail.com', 'Ali Hassan'),
('91234567', 'fatima.ali@gmail.com', 'Fatima Ali'),
('92345678', 'mohammed.saeed@gmail.com', 'Mohammed Saeed'),
('93456789', 'aisha.khan@gmail.com', 'Aisha Khan'),
('94567890', 'salim.rahman@gmail.com', 'Salim Rahman'),
('95678901', 'layla.ahmed@gmail.com', 'Layla Ahmed'),
('96789012', 'omar.yousef@gmail.com', 'Omar Yousef');
select * from member
==================================================================
insert into loan (loanDate,dueDate,returnDate,status,finePaid,bookID, memberID)
values
('2025-01-01','2025-01-10', '2025-01-09', 'Overdue', 5.00,1,200),
('2025-01-05', '2025-01-15', '2025-01-14', 'Issued', 0.00,2,201),
('2024-12-01', '2024-12-10', '2024-12-09', 'Returned', 0.00,3,202),
('2024-11-01', '2024-11-10', '2024-11-12', 'Returned', 2.00,4,203),
('2024-10-01', '2024-10-10', '2024-10-15', 'Returned', 3.00,5,204),
('2022-04-18','2022-03-11','2022-06-22','Returned',5.00,6,205),
('2022-01-10','2022-01-10','2022-05-10','Overdue',0.00,7,206),
('2022-08-21','2022-04-10','2022-10-01','Issued',2.00,8,207),
('2025-01-01', '2025-01-10', '2025-01-09', 'Issued', 0.00,9,208),
('2025-01-01', '2025-01-10', '2025-01-09', 'Overdue', 5.00,10,209),
('2025-01-05', '2025-01-15', '2025-01-14', 'Issued', 0.00,11,200),
('2024-12-01', '2024-12-10', '2024-12-09', 'Returned', 0.00,12,201),
('2025-02-01', '2025-02-10', '2025-02-09', 'Issued', 0.00,13,202),
('2025-01-05', '2025-01-15', '2025-01-14', 'Overdue',7.50,14,203),
('2024-12-01', '2024-12-10', '2024-12-12', 'Returned', 2.00,15,204);
select * from loan
=========================================================================
insert into review (reviewdate,rating, bookID,memberID)
values
('2025-01-12',4,1,200),
('2024-11-15',5,2,201),
('2025-01-18',4,3,202),
('2024-02-14',4,4,203),
('2024-02-13',3,5,204);
select * from review
======================================================
insert into payment (loanID,paymentDate, amount, paymentmethod)
values
 (22,'2025-01-15', 5.00, 'cash'),
 (23,'2024-11-13', 2.00, 'card'),
 (24,'2024-10-16', 3.00, 'online'),
 (25,'2025-02-15',5.00,'online');
 select * from payment
 =========================================================

 insert into staff (fullName, position, libraryID)
 values
 ('Fatima Ali', 'Librarian',100),
 ('Asaad Said', 'Assistant Librarian',101),
 ('Aisha Rahman', 'Librarian',102);

 --Section 1: Complex Queries with Joins (40 points)--
 --1. Library Book Inventory Report--

 --Display library name, total number of books, number of available books, and number of books currently on loan for each library.--

select * from library
select * from book

select
l.libraryName,
count(b.bookID)as total_no_book,
sum (case when b.availability =1 then 1 else 0 end) as available_books,
sum(case when b.availability =0 then 1 else 0 end) as books_on_loan
from library l left join book b
on l.libraryID = b.libraryID
group by l.libraryName;
====================================================================
-----------------------------------------------------------------------
--2. Active Borrowers Analysis--
--List all members who currently have books on loan(status ='Issued'or'Overdue').Show member name, email, book title, loan date, due date, and current status--

select * from book
select * from loan
select * from member

select
m.fullName,
m.email,
b.title as bookTitle,
l.loandate,
l.duedate,
l.Status as currentstatus
from book b inner join loan l
on b.bookID = l.bookID
inner join member m
on l.memberID = m.memberID 
where l.Status in ('Issued','overdue');
==================================================================
------------------------------------------------------------------
--3. Overdue Loans with Member Details--

--Retrieve all overdue loans showing member name, phone number, book title, library
--name, days overdue (calculated as difference between current date and due date), and
--any fines paid for that loan---
select * from loan
select * from member
select * from library
select * from book

select 
m.fullName as member_name,
m.phone as phone_number,
b.title as book_title,
lib.libraryName as library_name,
 DATEDIFF(DAY, lo.dueDate, GETDATE()) AS days_overdue,
lo.finepaid
from loan lo inner join member m
on lo.memberID = m.memberID
inner join book b
on lo.bookID = b.bookID
inner join library lib
on lib.libraryID = b.libraryID
WHERE lo.dueDate < GETDATE()
  AND (lo.returnDate IS NULL OR lo.status = 'On Loan');

===============================================================
---------------------------------------------------------------

--4. Staff Performance Overview--
--For each library, show the library name, staff member names, their positions, and count of books managed at that library.--

select * from staff
select * from library
select * from member
select * from book
select * from loan
select * from review

select 
l.libraryName as library_name,
s.fullname as staff_member_name,
s.position as staff_position,
count (bookID) as book_managed
from staff s inner join library l
on s.libraryID = l.libraryID
left join book b
on l.libraryID =b.libraryID
group by
l.libraryName,s.fullname,s.position;
============================================================
----------------------------------------------------------------
--5. Book Popularity Report--
--Display books that have been loaned at least 3 times. Include book title, ISBN, genre,--
--total number of times loaned, and average review rating (if any reviews exist).--


select 
b.title as book_title,
b.ISBN,
b.genre,
count (l.loanID) as total_time_loaned,
avg (r.rating) as avg_review_rating
from book b inner join loan l
on b.bookID = l.bookID
left join review r
on
r.bookID = b.bookID
group by 
b.title,b.ISBN,b.genre
Having count(l.loanID) >= 3;
=======================================================
------------------------------------------------------

--6. Member Reading History--
--Create a query that shows each member's complete borrowing history including:--
--member name, book titles borrowed (including currently borrowed and previously--
--returned), loan dates, return dates, and any reviews they left for those books.---

select 
m.fullName as member_name,
b.title as book_title,
l.loandate,
l.returndate,
r.rating

from member m inner join loan l
on m.memberID = l.memberID
inner join book b
on b.bookID = l.loanID
left join review r
on m.memberID = r.memberID
and r.bookID = b.bookID
order by
m.fullName,l.loandate;

=====================================================
------------------------------------------------------



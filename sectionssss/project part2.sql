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
alter table book
add price decimal (10,0)
alter table book
drop column price

update book set price = 10.00 where bookID = 1;
update book set price = 11.05 where bookID = 2;
update book set price = 15.05 where bookID = 3;
update book set price = 11.25 where bookID = 4;
update book set price = 12.05 where bookID = 5;
update book set price = 11.05 where bookID = 6;
update book set price = 10.05 where bookID = 7;
update book set price = 15.00 where bookID = 8;
update book set price = 11.05 where bookID = 9;
update book set price = 13.05 where bookID = 10;
update book set price = 11.05 where bookID = 11;
update book set price = 20.05 where bookID = 12;
update book set price = 10.05 where bookID = 13;
update book set price = 12.05 where bookID = 14;
update book set price = 25.05 where bookID = 15;
update book set price = 20.00 where bookID = 16;
update book set price = 11.05 where bookID = 17;
update book set price = 15.05 where bookID = 18;
update book set price = 10.00 where bookID = 19;
update book set price = 10.05 where bookID = 20;
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

--7. Revenue Analysis by Genre --
--Calculate total fine payments collected for each book genre. Show genre name, total-- 
--number of loans for that genre, total fine amount collected, and average fine per loan.-- 

select * from payment
select * from book
select * from loan

select
b.genre as genre_name,
count(l.loanID) as total_no_of_loan,
sum(COALESCE(l.finepaid,0)) as total_fine_collected,
avg(COALESCE(l.finepaid,0)) as avg_fine_per_loan
from book b join loan l
on b.bookID = l.bookID
group by b.genre
order by total_fine_collected desc;
=======================================================
-------------------------------------------

Section 2: Aggregate Functions and Grouping (30 points) 

--8. Monthly Loan Statistics 
--Generate a report showing the number of loans issued per month for the current year. 
--Include month name, total loans, total returned, and total still issued/overdue.-- 

select 
loandate as month_name,
count(*) as total_loan,
sum(case when status = 'returned' then 1 else 0 end) as total_returned,
sum(case when status in ('issued','overdue') then 1 else 0 end) as total_issued_overdue
from loan
where year(loandate) = year (getdate())
group by (loandate)
order by (loandate);

=============================================
--------------------------------------------
--9. Member Engagement Metrics 
--For each member, calculate: total books borrowed, total books currently on loan, total 
--fines paid, and average rating they give in reviews. Only include members who have 
--borrowed at least one book.  

select * from member
select * from review
select
m.memberID,
m.fullName as member_name,
count(l.loanID) as total_books_borrowed,
sum(case when l.status in ('issued','overdue') then 1 else 0 end) as total_books_currently_on_loan,
sum(case when l.finepaid is not null then l.finepaid else 0 end) as total_fines_paid,
avg(r.rating) as avg_rating_given
from member m inner join loan l
on m.memberID = l.memberID
left join review r
on m.memberID = r.memberID
group by
m.memberID,m.fullName;

===============================================
-----------------------------------------------
--10. Library Performance Comparison 
--Compare libraries by showing: library name, total books owned, total active members 
--(members with at least one loan), total revenue from fines, and average books per member.--

select * from library
select * from book
select * from member
select * from loan
select * from payment

SELECT
    l.libraryName,
    
    COUNT(DISTINCT b.bookID) AS total_books_owned,

    COUNT(DISTINCT CASE WHEN ln.loanID IS NOT NULL THEN ln.memberID END) AS total_active_members,

    SUM(CASE WHEN ln.finePaid IS NOT NULL THEN ln.finePaid ELSE 0 END) AS total_fine_revenue,

    CASE 
        WHEN COUNT(DISTINCT CASE WHEN ln.loanID IS NOT NULL THEN ln.memberID END) = 0 
        THEN 0
        ELSE CAST(COUNT(DISTINCT b.bookID) AS FLOAT) / 
             CAST(COUNT(DISTINCT CASE WHEN ln.loanID IS NOT NULL THEN ln.memberID END) AS FLOAT)
    END AS avg_books_per_member

FROM Library l
LEFT JOIN Book b
    ON l.libraryID = b.libraryID
LEFT JOIN Loan ln
    ON b.bookID = ln.bookID

GROUP BY
    l.libraryName
ORDER BY
    total_fine_revenue DESC;

	==========================================================
	--------------------------------------------------------------
--11. High-Value Books Analysis 
--Identify books priced above the average book price in their genre. Show book title, 
--genre, price, genre average price, and difference from average.  


SELECT
    b.title,
    b.genre,
    b.price,
    genre_avg.avg_price          AS genre_avg_price,
    b.price - genre_avg.avg_price AS diff_from_avg
FROM
    book b
JOIN (
    SELECT
        genre,
        AVG(price) AS avg_price
    FROM
        book
    GROUP BY
        genre
) genre_avg
ON b.genre = genre_avg.genre
WHERE
    b.price > genre_avg.avg_price
ORDER BY
    b.genre,
    diff_from_avg DESC;
===================================================
--------------------------------------------------

--12. Payment Pattern Analysis 
--Group payments by payment method and show: payment method, number of 
--transactions, total amount collected, average payment amount, and percentage of total revenue--
  
  select
  paymentmethod,
  count(*) as number_of_transactions,
  sum(amount) as total_amount_collected,
  avg(amount) as avg_payment_amount,
  round(sum(amount)* 100.0 / (select sum(amount) from payment),2) as percentage_of_total_revenue
  from payment
  group by paymentmethod
  order by total_amount_collected;
  =========================================================
  ----------------------------------------------------------
  --Section 3: Views Creation (15 points)-- 
  --Create the following views: 
--13. vw_CurrentLoans 
--A view that shows all currently active loans (status 'Issued' or 'Overdue') with member --
--details, book details, loan information, and calculated days until due (or days overdue).--

create view vw_currentloan as
select
m.memberID,
m.fullName,
m.email,
m.phone,
b.bookID,
b.title,
b.ISBN,
b.genre,
l.loanID,
l.loandate,
l.duedate,
l.Status,
datediff(day,getdate(),l.duedate) as days_until_due
from loan l join member m 
on l.memberID = m.memberID
join book b on l.bookID = b.bookID
where l.Status in ('issued','overdue');

select * from vw_currentloan
===============================================
-------------------------------------------------

--14. vw_LibraryStatistics
--This should show library-level statistics including:

--Library name,Total books owned by the library,Number of available books,Total active members (members who have at least one loan from this library's books)
--Active loans (loans for books belonging to this library)
--Total staff working at the library
--Total revenue from fines (from loans of this library's books)--

--The key is counting members who have borrowed from that specific library's books, not members "belonging" to a library.

CREATE VIEW vw_LibraryStatistics AS
SELECT
    l.libraryName,
    COUNT(DISTINCT b.bookID) AS TotalBooks,
    SUM(CASE WHEN b.availability = 1 THEN 1 ELSE 0 END) AS AvailableBooks,
    COUNT(DISTINCT CASE WHEN lo.loanID IS NOT NULL THEN lo.memberID END) AS ActiveMembers,
    COUNT(lo.loanID) AS ActiveLoans,
    COUNT(DISTINCT s.staffID) AS TotalStaff,
    ISNULL(SUM(lo.finePaid), 0) AS TotalRevenueFromFines
FROM
    Library l
    LEFT JOIN Book b ON b.libraryID = l.libraryID
    LEFT JOIN Loan lo ON lo.bookID = b.bookID AND lo.status IN ('Issued', 'Overdue')
    LEFT JOIN Staff s ON s.libraryID = l.libraryID
GROUP BY
    l.libraryName;
	select * from vw_LibraryStatistics
	===============================================
	-----------------------------------------------
	--15. vw_BookDetailsWithReviews 
--A view combining book information with aggregated review data (average rating, total 
--reviews, latest review date) and current availability status.  

select * from book

 create view vw_BookDetailsWithReviews as
 select
 b.bookID,
 b.title,
 b.ISBN,
 b.genre,
 b.libraryID,
-- availability  (bit → readable status)

 case when b.availability = 1 then 'available' else 'on loan'
 end as availability_Status,
 count (r.reviewdate) as total_review,
 avg (cast(r.rating as decimal(3,2))) as avg_rating,
 max(r.reviewdate) as latest_reviewdate
 from book b left join review r
 on r.bookID = b.bookID
 group by
  b.bookID,
 b.title,
 b.ISBN,
 b.genre,
 b.libraryID,
 b.availability;
 select * from vw_BookDetailsWithReviews
 ============================================================
 ------------------------------------------------------------

 --Section 4: Stored Procedures (15 points)-- 
--Create stored procedures for the following operations: --

--16. sp_IssueBook-- 
--Input Parameters: MemberID, BookID, DueDate--  
--Functionality:  
--• Check if book is available 
--• Check if member has any overdue loans 
--• If validations pass, create a new loan record and update book availability 
--• Return appropriate success or error message

create procedure sp_issuebook
@memberID int,
@bookID int,
@duedate date
as
begin 
set nocount on;
--1.check if book exists and is available
if not exists (
select 1
from book 
where bookID = @bookID
and availability =1
)
begin

select 'error: book is not available for issue.' as message;
return;
end;
--2 check if member has overdue loan
if exists (
select 1 from loan
where memberID = @memberID
and Status = 'overdue'
)
begin
select 'error: member has overdue loan . book cannot be issued.' as message;
return;
end;
--3 create loan record
insert into loan (loandate,duedate,returndate,Status,finepaid,bookID,memberID)
values
(
getdate(),
@duedate,
null,
'issued',
0,
@bookID,
@memberID
);
--4 update book availabilty
update book set availability = 0
where bookID = @bookID;
---5 success message
select 'success: book issued successfully.' as message;
end;

=======================================
------------------------------------------
--17. sp_ReturnBook 
---Input Parameters: LoanID, ReturnDate  
--Functionality:  
--• Update loan status to 'Returned' and set return date 
--• Update book availability to TRUE 
--• Calculate if there's a fine (e.g., $2 per day overdue) 
--• If fine exists, automatically create a payment record with 'Pending' status 
--• Return total fine amount (if any)


CREATE PROCEDURE sp_ReturnBook
    @loanID INT,
    @returndate DATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @bookID INT,
        @duedate DATE,
        @Daysoverdue INT,
        @FineAmount DECIMAL(10,2);

    -- 1. Validate loan exists and is not already returned
    IF NOT EXISTS (
        SELECT 1
        FROM loan
        WHERE loanID = @loanID
          AND Status IN ('Issued', 'Overdue')
    )
    BEGIN
        SELECT 'Error: Invalid loan ID or book already returned.' AS Message;
        RETURN;
    END;

    -- 2. Get loan details
    SELECT
        @bookID = bookID,
        @duedate = duedate
    FROM Loan
    WHERE loanID = @LoanID;

    -- 3. Calculate overdue days
    SET @Daysoverdue = DATEDIFF(DAY, @duedate, @returndate);

    IF @Daysoverdue > 0
        SET @FineAmount = @Daysoverdue * 2.00;
    ELSE
        SET @FineAmount = 0;

    -- 4. Update loan record
    UPDATE Loan
    SET
        returndate = @returndate,
        Status = 'Returned',
        finepaid = @FineAmount
    WHERE loanID = @LoanID;

    -- 5. Update book availability
    UPDATE Book
    SET availability = 1
    WHERE bookID = @BookID;

    -- 6. Create payment record if fine exists
    IF @FineAmount > 0
    BEGIN
        INSERT INTO payment (
            paymentdate,
            amount,
            paymentmethod,
            loanID
        )
        VALUES (
            GETDATE(),
            @FineAmount,
            'Pending',
            @LoanID
        );
    END;

    -- 7. Return fine amount
    SELECT 
        'Book returned successfully.' AS Message,
        @FineAmount AS TotalFine;
END;
================================================================
------------------------------------------------------------------
--18. sp_GetMemberReport
--Input Parameters: MemberID
--Output: Multiple result sets showing
---• Member basic information
---• Current loans (if any)
---• Loan history with return status
--• Total fines paid and any pending fines
--• Reviews written by the member



create procedure  sp_GetMemberReport
@memberID int
as
begin
set nocount on;
select
memberID,
fullName,
email,
phone
from member
where memberID = @memberID;

select 
l.loanID,
b.title as booktitle,
l.loandate,
l.duedate,
l.Status,
datediff(day,getdate(), l.duedate)as dayuntildue
from loan l join book b on l.bookID = b.bookID
where l.memberID = @memberID
and l.Status in('issued','overdue');

select 
l.loanID,
b.title as booktitle,
l.loandate,
l.duedate,
l.returndate,
l.Status
from loan l join book b 
on l.bookID = b.bookID
where l.memberID = @memberID
order by l.loandate desc;

select 
isnull(sum(case when l.Status ='returned' then l.finepaid end),0) as totalfinepaid,
isnull(sum(case when l.Status = 'overdue' then l.finepaid end),0)as pendingfines
from loan l
where l.memberID = @memberID;

select
r.reviewID,
b.title as booktitle,
r.rating,
r.reviewdate
from review r join book b on r.bookID = b.bookID
where r.memberID = @memberID
order by r.reviewdate desc;
end;

=========================================================================
-------------------------------------------------------------------------

--19. sp_MonthlyLibraryReport
--Input Parameters: LibraryID, Month, Year
--Output: Comprehensive report showing:
--• Total loans issued in that month
--• Total books returned in that month
--• Total revenue collected
--• Most borrowed genre
--• Top 3 most active members (by number of loans

CREATE PROCEDURE sp_MonthlyLibraryReport
    @LibraryID INT,
    @Month INT,
    @Year INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Total loans issued in the month
    SELECT COUNT(*) AS TotalLoansIssued
    FROM Loan L
    INNER JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND YEAR(L.LoanDate) = @Year
      AND MONTH(L.LoanDate) = @Month;

    -- 2. Total books returned in the month
    SELECT COUNT(*) AS TotalBooksReturned
    FROM Loan L
    INNER JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND L.ReturnDate IS NOT NULL
      AND YEAR(L.ReturnDate) = @Year
      AND MONTH(L.ReturnDate) = @Month;

    -- 3. Total revenue collected (fines) in the month
    SELECT ISNULL(SUM(L.FinePaid),0) AS TotalRevenue
    FROM Loan L
    INNER JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND L.ReturnDate IS NOT NULL
      AND YEAR(L.ReturnDate) = @Year
      AND MONTH(L.ReturnDate) = @Month;

    -- 4. Most borrowed genre in the month
    SELECT TOP 1 B.Genre, COUNT(*) AS BorrowCount
    FROM Loan L
    INNER JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND YEAR(L.LoanDate) = @Year
      AND MONTH(L.LoanDate) = @Month
    GROUP BY B.Genre
    ORDER BY BorrowCount DESC;

    -- 5. Top 3 most active members in the month
    SELECT TOP 3 M.MemberID, M.FullName, COUNT(*) AS LoansCount
    FROM Loan L
    INNER JOIN Member M ON L.MemberID = M.MemberID
    INNER JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND YEAR(L.LoanDate) = @Year
      AND MONTH(L.LoanDate) = @Month
    GROUP BY M.MemberID, M.FullName
    ORDER BY LoansCount DESC;
END;

==========================================================
------------------------------------------------------





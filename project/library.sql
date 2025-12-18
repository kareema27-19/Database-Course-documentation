create database library
use library

create table library (

libraryID int primary key identity(1,1),
contact_NO varchar(10) not null,
name varchar(50) unique not null,
location varchar(50) not null,
established_year int,

);
select * from library
------------------------------------------------------------
create table staff (
staffID int primary key identity(1,1),
position varchar(20),
contact_NO varchar(10) not null,
fullname varchar(20),
libraryID int,
foreign key(libraryID) references library (libraryID),
)
select * from staff
--------------------------------------------------------------
create table member  (
memberID int primary key identity(1,1),
phone_NO varchar(10),
email varchar(100) not null unique,
fullname varchar(100),
membershipstartdate date not null,
)

select * from member
----------------------------------------------------------------------



CREATE TABLE Book (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(20) NOT NULL,
    ISBN VARCHAR(100) NOT NULL UNIQUE,
    Price DECIMAL(10,2)
        CHECK (Price > 0),
    Genre VARCHAR(15) NOT NULL
        CHECK (Genre IN ('Fiction','Non-fiction','Reference','Children')),
    Availability BIT DEFAULT 1,
    ShelfLocation VARCHAR(30) NOT NULL,
    LibraryID INT NOT NULL,

    CONSTRAINT FK_Book_Library
        FOREIGN KEY (LibraryID)
        REFERENCES Library(LibraryID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
select * from Book
alter table book
add memberID int foreign key references member(memberID)

----------------------------------------------------------------


CREATE TABLE Review (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    Comments VARCHAR(200) DEFAULT 'No comments',
    ReviewDate DATE NOT NULL,
    Rating INT NOT NULL
        CHECK (Rating BETWEEN 1 AND 5),
    BookID INT NOT NULL,
    MemberID INT NOT NULL,

    CONSTRAINT FK_Review_Book
        FOREIGN KEY (BookID)
        REFERENCES Book(BookID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT FK_Review_Member
        FOREIGN KEY (MemberID)
        REFERENCES Member(MemberID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
select * from review

------------------------------------------------------


CREATE TABLE Loan (
LoanID INT IDENTITY PRIMARY KEY,
LoanDate DATE NOT NULL,
DueDate DATE NOT NULL,
ReturnDate DATE,
Status VARCHAR(20) NOT NULL DEFAULT 'Issued'
CHECK (Status IN ('Issued','Returned','Overdue')),
MemberID INT NOT NULL,
BookID INT NOT NULL,
CHECK (ReturnDate IS NULL OR ReturnDate >= LoanDate),
FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (BookID) REFERENCES Book(BookID)
ON DELETE CASCADE ON UPDATE CASCADE
);
select * from Loan

--------------------------------------------------------------

CREATE TABLE Payment (
PaymentID INT IDENTITY PRIMARY KEY,
PaymentDate DATE NOT NULL,
Amount DECIMAL(10,2) NOT NULL
CHECK (Amount > 0),
Method VARCHAR(50),
LoanID INT NOT NULL,
FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
ON DELETE CASCADE ON UPDATE CASCADE
);
select * from payment

---------------------------------------------------

insert into library (contact_NO,name,location,established_year)
values
('92322490','Al_Noor_Shoar','Sohar','1999'),
('92001719','Al_Noor_Muscat','Muscat','2010'),
('71204581','Al_Noor_Sur','Sur','2019');



select * from library
-------------------------------------------------------------


insert into staff (position,contact_NO,fullname,libraryID)
values 

('manager','92011470','AhmedSalah',5),
('librarian1','71045810','MunaSaid',6),
('librarian2','94123040','AsaadSaid',7);
select * from staff
--------------------------------------------------


insert into member (phone_NO,email,fullname,membershipstartdate)
values
('94712035','malakalnoor25@gmail.com','MobarkKhamis','2020-02-12'),
('78120455','noorali@gmail.com','NoorAli','2010-11-25'),
('90147821','amalali@gmail.com','AmalAli','2023-05-24');
select *from member

---------------------------------------------------------------

insert into Book (Title,ISBN,Price,Genre,ShelfLocation,LibraryID)
values
('The Silent River','9780306406157',10.00,'Non-fiction','B2-Shelf3',5),
('The Little Prince','9780596009205',15.05,'Children','A1-Shelf1',6),
('The Lost Kingdom','9780262033848',20.15,'Fiction','C1-Shelf2',7);
select *from book
update Book
set memberID=5
where ISBN = 9780596009205;
update Book
set memberID=7
where ISBN = 9780306406157;
update Book
set memberID=6
where ISBN = 9780262033848;
-----------------------------------------------------------------------



		insert into Review (Comments,ReviewDate,Rating, BookID,memberID)
		values
		('enjoyed the story','2024-02-14',4,10,7),
		('average read','2024-02-13',2,11,5),
		('great book','2024-02-12',5,12,6);

		select *from Review
		-----------------------------------------------


insert into Loan (LoanDate,DueDate,ReturnDate,Status,memberID,BookID)
values
('2022-04-18','2022-03-11','2022-06-22','Returned',5,11),
('2022-01-10','2022-01-10','2022-05-10','Overdue',7,10),
('2022-08-21','2022-04-10','2022-10-01','Issued',6,12);

select *from Loan
---------------------------------------------------------


insert into Payment (PaymentDate,Amount,Method,LoanID)
values
('2014-02-21',20.02,'on line transfer',1),
('2014-02-20',10.02,'cash',2),
('2014-02-19',10.05,'cash',3);

select *from Payment
------------------------------------------------------------------


DQL

Display all book records.

select * from Book;

----------------------------------------
Display each book’s title, genre, and availability.

select Title,Genre,Availability from Book;
----------------------------------------------
Display all member names, email, and membership start date.

select fullname,email,membershipstartdate from member;
--------------------------------------------------------
Display each book’s title and price as BookPrice.

select Title,price as Bookprice from Book;
-------------------------------------------- 
List books priced above 250 LE.

select Title, price from Book
where price >250;
----------------------------------------------
List members who joined before 2023.

select fullname,membershipstartdate from member

where membershipstartdate <'2023';
-----------------------------------------------


Display books ordered by price descending

select Title,price from Book
 order by price desc;
 -------------------------------------------------

 Display the maximum, minimum, and average book price.

 select max(price) as maxprice,
 min(price) as minprice,
 avg(price) as avgprice from Book;
 -----------------------------------------------------
 
 Display total number of books

 select count (*) as totalBooks from Book;

 --------------------------------------------------------
  Display members with NULL email.

  select fullname,email from member
  where email is null;
  -----------------------------------------------------
  . Display books whose title contains 'Data'.

  select Title from Book
  where Title like '%Data%';
  ---------------------------------------------------------
  DML

  Insert another member with NULL email and phone.

  insert into member (phone_NO,email,fullname,membershipstartdate)
  values
  (null,'Sara12@gmail.com','SaraSalim','2023-02-12');
  
  select * from member
  --------------------------------------------------------

  Update the return date of your loan to today



  UPDATE Loan
SET ReturnDate = CAST(GETDATE() AS DATE),  -- sets only the date part
    Status = 'Returned'                    -- optional: update status to Returned
WHERE LoanID = 1;
-----------------------------------------------------------------------

 Increase book prices by 5% for books priced under 200.

 update Book
 set price = price * 0.05
 where price < 200;

 -----------------------------------------------------------
 

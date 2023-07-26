/* DATABASE MODEL*/

CREATE TABLE tbl_publisher (
		publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_PublisherAddress VARCHAR(200) NOT NULL,
		publisher_PublisherPhone VARCHAR(50) NOT NULL,
	);

CREATE TABLE tbl_book (
		book_BookID INT PRIMARY KEY NOT NULL,
		book_Title VARCHAR(100) NOT NULL,
		book_PublisherName VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name1 FOREIGN KEY REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
	);
    

CREATE TABLE tbl_book (
	book_BookID INT PRIMARY KEY NOT NULL,
	book_Title VARCHAR(100) NOT NULL,
	book_PublisherName VARCHAR(100) NOT NULL,
	FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_library_branch (
		library_branch_BranchID INT PRIMARY KEY NOT NULL,
		library_branch_BranchName VARCHAR(100) NOT NULL,
		library_branch_BranchAddress VARCHAR(200) NOT NULL
	);

CREATE TABLE tbl_borrower (
		borrower_CardNo INT PRIMARY KEY NOT NULL,
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerAddress VARCHAR(200) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL
	);

SELECT * FROM tbl_borrower

CREATE TABLE tbl_book_loans (
	book_loans_LoansID serial PRIMARY KEY NOT NULL,
	book_loans_BookID INT NOT NULL,
	book_loans_BranchID INT NOT NULL,
	book_loans_CardNo INT NOT NULL,
	book_loans_DateOut VARCHAR(50) NOT NULL,
	book_loans_DueDate VARCHAR(50) NOT NULL,
	FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE tbl_book_copies (
	book_copies_CopiesID serial PRIMARY KEY NOT NULL,
	book_copies_BookID INT NOT NULL,
	book_copies_BranchID INT NOT NULL,
	book_copies_No_Of_Copies INT NOT NULL,
	FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE
);

SELECT * FROM tbl_book_copies

CREATE TABLE tbl_book_authors (
	book_authors_AuthorID serial PRIMARY KEY NOT NULL,
	book_authors_BookID INT NOT NULL,
	book_authors_AuthorName VARCHAR(50) NOT NULL,
	FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE);


SELECT * FROM tbl_book_authors

/*INSERT INTO TABLES*/

	INSERT INTO tbl_publisher
		(publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')		
	;

INSERT INTO tbl_book
		(book_BookID, book_Title, book_PublisherName)
		VALUES 
		(1,'The Name of the Wind', 'DAW Books'),
		(2,'It', 'Viking'),
		(3,'The Green Mile', 'Signet Books'),
		(4,'Dune', 'Chilton Books'),
		(5,'The Hobbit', 'George Allen & Unwin'),
		(6,'Eragon', 'Alfred A. Knopf'),
		(7,'A Wise Mans Fear', 'DAW Books'),
		(8,'Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		(9,'Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		(10,'The Giving Tree', 'Harper and Row'),
		(11,'The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		(12,'Brave New World', 'Chalto & Windus'),
		(13,'The Princess Bride', 'Harcourt Brace Jovanovich'),
		(14,'Fight Club', 'W.W. Norton'),
		(15,'Holes', 'Scholastic'),    
		(16,'Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		(17,'Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		(18,'The Fellowship of the Ring', 'George Allen & Unwin'),
		(19,'A Game of Thrones', 'Bantam'),
		(20,'The Lost Tribe', 'Picador USA');


INSERT INTO tbl_library_branch
		(library_branch_BranchID, library_branch_BranchName, library_branch_BranchAddress)
		VALUES
		(1,'Sharpstown','32 Corner Road, New York, NY 10012'),
		(2,'Central','491 3rd Street, New York, NY 10014'),
		(3,'Saline','40 State Street, Saline, MI 48176'),
		(4,'Ann Arbor','101 South University, Ann Arbor, MI 48104');



INSERT INTO tbl_borrower
		(borrower_CardNo, borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
		VALUES
		(1,'Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		(2,'Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		(3,'Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		(4,'Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		(5,'Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		(6,'Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		(7,'Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		(8,'Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');

        
        
INSERT INTO tbl_book_loans
	(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate) 
	VALUES
		('1','4','2','1/12/18','2/12/18'),
		('3','4','7','1/3/18','2/3/18'),
		('18','4','7','1/3/18','2/3/18'),
		('12','4','2','1/4/18','2/4/18'),
		('11','4','3','1/15/18','2/15/18'),
		('9','4','3','1/15/18','2/15/18'),
		('7','4','7','1/1/18','2/2/18'),
		('4','4','3','1/1/18','2/2/18'),
		('1','4','3','2/2/17','3/2/18'),
		('20','4','3','1/3/18','2/3/18'),
		('1','4','2','1/12/18','2/12/18'),
		('3','4','7','1/13/18','2/13/18'),
		('18','4','7','1/13/18','2/13/18'),
		('12','4','2','1/14/18','2/14/18'),
		('11','4','3','1/15/18','2/15/18'),
		('9','4','3','1/15/18','2/15/18'),
		('7','4','7','1/19/18','2/19/18'),
		('4','4','3','1/19/18','2/19/18'),
		('1','4','3','1/22/18','2/22/18') RETURNING book_loans_LoansID;

		
	SELECT * FROM tbl_book_loans

INSERT INTO tbl_book_copies
		(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');

SELECT * FROM tbl_book_copies
 

INSERT INTO tbl_book_authors
		(book_authors_BookID,book_authors_AuthorName)
		VALUES
		('1','Patrick Rothfuss'),
		('2','Stephen King'),
		('3','Stephen King'),
		('4','Frank Herbert'),
		('5','J.R.R. Tolkien'),
		('6','Christopher Paolini'),
		('6','Patrick Rothfuss'),
		('8','J.K. Rowling'),
		('9','Haruki Murakami'),
		('10','Shel Silverstein'),
		('11','Douglas Adams'),
		('12','Aldous Huxley'),
		('13','William Goldman'),
		('14','Chuck Palahniuk'),
		('15','Louis Sachar'),
		('16','J.K. Rowling'),
		('17','J.K. Rowling'),
		('18','J.R.R. Tolkien'),
		('19','George R.R. Martin'),
		('20','Mark Lee');

SELECT tablename FROM pg_catalog.pg_tables WHERE schemaname = 'public';

SELECT * FROM tbl_book
SELECT * FROM tbl_library_branch
SELECT * FROM tbl_publisher
SELECT * FROM tbl_book_loans
SELECT * FROM tbl_borrower

/*Exercises*/
/* No 1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

with number1 as (SELECT copies.book_copies_BranchID AS Branch_ID, branch.library_branch_BranchName AS Branch_Name,
	   copies.book_copies_No_Of_Copies,
	   book.book_Title AS Book_Title
	   FROM tbl_book_copies AS copies
			INNER JOIN tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
			INNER JOIN tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID)
select * from number1 where book_title = 'The Lost Tribe' and branch_name = 'Sharpstown'


/* No 2- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
with number2 as (SELECT copies.book_copies_BranchID AS Branch_ID, branch.library_branch_BranchName AS Branch_Name,
	   copies.book_copies_No_Of_Copies,
	   book.book_Title AS Book_Title
	   FROM tbl_book_copies AS copies
			INNER JOIN tbl_book AS book ON copies.book_copies_BookID = book.book_BookID
			INNER JOIN tbl_library_branch AS branch ON book_copies_BranchID = branch.library_branch_BranchID)
select * from number2 where book_title = 'The Lost Tribe'

/* No 3- Retrieve the names of all borrowers who do not have any books checked out. */
		
SELECT borrower_BorrowerName, borrower_CardNo FROM tbl_borrower
	WHERE NOT EXISTS
		(SELECT * FROM tbl_book_loans
		WHERE book_loans_CardNo = borrower_CardNo)

/* No 4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate 
is 2/2/2018, retrieve the book title, the borrower's name, and the borrower's address.  */

SELECT Branch.library_branch_BranchName,  Book.book_Title,
   Borrower.borrower_BorrowerName, Borrower.borrower_BorrowerAddress,
   Loans.book_loans_DateOut, Loans.book_loans_DueDate
   FROM tbl_book_loans AS Loans
	INNER JOIN tbl_book AS Book ON Loans.book_loans_BookID = Book.book_BookID
	INNER JOIN tbl_borrower AS Borrower ON Loans.book_loans_CardNo = Borrower.borrower_CardNo
	INNER JOIN tbl_library_branch AS Branch ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
	WHERE Loans.book_loans_DueDate = '2/2/18' AND Branch.library_branch_BranchName = 'Sharpstown'

/* No 5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */

SELECT  library_branch_BranchName as Lib_Branch, COUNT (book_loans_BranchID) as number_books_loaned
	FROM tbl_book_loans
	INNER JOIN tbl_library_branch ON tbl_book_loans.book_loans_BranchID = tbl_library_branch.library_branch_BranchID
	GROUP BY library_branch_BranchName

/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out. */

WITH borrow AS (SELECT borrower_BorrowerName AS BorrowersName, borrower_BorrowerAddress AS BorrowerAddress, COUNT(book_loans_CardNo) AS count_books
FROM tbl_borrower
JOIN tbl_book_loans on tbl_borrower.borrower_CardNo = tbl_book_loans.book_loans_CardNo
GROUP BY borrower_BorrowerName, borrower_BorrowerAddress order by count_books)
SELECT * FROM borrow where count_books > 5


/* No 7- For each book authored by "Stephen King", retrieve the title and the number of copies 
owned by the library branch whose name is "Central".*/

SELECT book_authors_AuthorName, book_title, library_branch_BranchName, book_copies_No_Of_Copies FROM tbl_book_authors
	JOIN tbl_book ON tbl_book_authors.book_authors_BookID = tbl_book.book_BookID
	JOIN tbl_book_copies ON tbl_book_authors.book_authors_BookID = tbl_book_copies.book_copies_BookID
	JOIN tbl_library_branch ON tbl_book_copies.book_copies_BranchID = tbl_library_branch.library_branch_BranchID
WHERE book_authors_AuthorName = 'Stephen King' AND library_branch_BranchName = 'Central' 

/* No 8- Which borrower has more books borrowed*/

SELECT borrower_BorrowerName, borrower_BorrowerAddress, COUNT(book_loans_CardNo) AS NumberofBooksBorrowed FROM tbl_borrower
JOIN tbl_book_loans ON tbl_borrower.borrower_CardNo = tbl_book_loans.book_loans_CardNo
GROUP BY borrower_BorrowerName,borrower_BorrowerAddress ORDER BY NumberofBooksBorrowed DESC LIMIT 1

/* No 9- Which library branch has more books borrowed*/

SELECT library_branch_BranchName, COUNT(book_loans_CardNo) AS NumberofBooksBorrowed FROM tbl_library_branch
JOIN tbl_book_loans ON tbl_library_branch.library_branch_BranchID = tbl_book_loans.book_loans_BranchID
GROUP BY library_branch_BranchName ORDER BY NumberofBooksBorrowed DESC LIMIT 1

/* No 10- For each of the books, who is the publisher and which library branch can they be found?*/

SELECT book_title, publisher_PublisherName AS PublisherName, library_branch_BranchName AS BranchName,
book_copies_BookID
FROM tbl_book 
JOIN tbl_publisher ON tbl_book.book_PublisherName = tbl_publisher.publisher_PublisherName
JOIN tbl_book_copies ON tbl_book.book_BookID = tbl_book_copies.book_copies_CopiesID
JOIN tbl_library_branch ON tbl_book_copies.book_copies_BranchID = tbl_library_branch.library_branch_BranchID



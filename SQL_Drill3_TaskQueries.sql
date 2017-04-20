USE dbLibMgmtSys
GO

--Create queries from dbLibMgmtSys

--Task 1: How many copies of book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
--AND Task 2:How many copies of book titled "The Lost Tribe" are owned by each library branch?

CREATE PROC uspLibCopiesBranch @Title VARCHAR(100) = NULL, @BranchName VARCHAR(50) = NULL
AS
SELECT BOOK_COPIES.BookId,BOOK.Title,BOOK_COPIES.BranchId,LIBRARY_BRANCH.BranchName,BOOK_COPIES.No_Of_Copies 
FROM BOOK_COPIES 
JOIN BOOK 
ON BOOK_COPIES.BookId = BOOK.BookId
JOIN LIBRARY_BRANCH
ON BOOK_COPIES.BranchId = LIBRARY_BRANCH.BranchId
WHERE BOOK.Title LIKE '%' + ISNULL(@Title,Title) +'%'
 AND LIBRARY_BRANCH.BranchName LIKE '%' + ISNULL(@BranchName,BranchName)

EXEC uspLibCopiesBranch 'The Lost Tribe'

--Task 3: Retrieve the names of all borrowers who do not have any books checked out.

SELECT BORROWER.CardNo, BORROWER.Name 
FROM BORROWER 
WHERE BORROWER.CardNo NOT IN (SELECT CardNo FROM BOOK_LOANS)

--Task 4: Assume that Today is April 9, 2017

SELECT BOOK.Title, BORROWER.Name, BORROWER.[Address]
FROM BOOK, BORROWER, BOOK_LOANS, LIBRARY_BRANCH
WHERE LIBRARY_BRANCH.BranchName= 'Sharpstown' 
AND BOOK_LOANS.DueDate= '2017-04-09'
AND BOOK_LOANS.CardNo = BORROWER.CardNo 
AND BOOK_LOANS.BookId = BOOK.BookId

--Task 5
SELECT LIBRARY_BRANCH.BranchName, COUNT(*) AS 'Total Loaned'
FROM LIBRARY_BRANCH
JOIN BOOK_LOANS
ON BOOK_LOANS.BranchId = LIBRARY_BRANCH.BranchId
GROUP BY LIBRARY_BRANCH.BranchName

--Task 6
SELECT BORROWER.Name, BORROWER.[Address], COUNT(*) AS 'No. of Books Checked Out'
FROM BORROWER
JOIN BOOK_LOANS
ON BORROWER.CardNo = BOOK_LOANS.CardNo
GROUP BY BORROWER.CardNo, BORROWER.Name, BORROWER.[Address]
HAVING COUNT(*) > 5

--Task 7
SELECT BOOK.Title, BOOK_COPIES.No_Of_Copies
FROM BOOK_AUTHORS
JOIN BOOK
ON BOOK.BookId = BOOK_AUTHORS.BookId
JOIN BOOK_COPIES
ON BOOK_COPIES.BookId = BOOK.BookId
JOIN LIBRARY_BRANCH
ON LIBRARY_BRANCH.BranchId = BOOK_COPIES.BranchId
WHERE BOOK_AUTHORS.AuthorName = 'Stephen King' AND LIBRARY_BRANCH.BranchName = 'Central'
USE dbLibMgmtSys
GO
-- Create tables for dbLibMgmtSys
CREATE TABLE BOOK_AUTHORS 
(BookId int PRIMARY KEY NOT NULL, AuthorName VARCHAR(70) NOT NULL)

CREATE TABLE BOOK 
(BookId int PRIMARY KEY NOT NULL, Title VARCHAR(100) NOT NULL, PublisherName VARCHAR(100) NOT NULL)

CREATE TABLE PUBLISHER
(Name VARCHAR(100) PRIMARY KEY NOT NULL, [Address] VARCHAR(300) NULL, [Phone] VARCHAR(20) NULL)

CREATE TABLE BOOK_COPIES
(BookId int NOT NULL, BranchId int NOT NULL, No_Of_Copies int NOT NULL)

DROP TABLE BOOK_LOANS

CREATE TABLE BOOK_LOANS
(BookId int NOT NULL, BranchId int NOT NULL, CardNo int NOT NULL, DateOut date NOT NULL, DueDate date NOT NULL)

CREATE TABLE LIBRARY_BRANCH
(BranchId int PRIMARY KEY NOT NULL, BranchName VARCHAR(100) NOT NULL, [Address] VARCHAR(300) NOT NULL)

CREATE TABLE BORROWER
(CardNo int PRIMARY KEY NOT NULL, Name VARCHAR(50) NOT NULL, [Address] VARCHAR(300) NOT NULL, [Phone] VARCHAR(20) NULL)



-- Populate tables with data

INSERT INTO BOOK
VALUES (1001, 'The Lost Tribe', 'Tribal Publishing')

INSERT INTO BOOK --(BookId, Title, Publisher) Format
VALUES (1002, 'Carrie', 'Doubleday'), (1003, 'Reusing Old Graves', 'Shaw & Sons Ltd'),(1004, 'How to Avoid Huge Ships', 'Tidewater'),(1005, 'Why Cats Paint', 'Ten Speed Press'),
(1006, 'The Grass is Always Greener Over the Septic Tank', 'Fawcett'),(1007, 'Do Androids Dream of Electric Sheep?', 'Ballantine Books'),(1008, 'Corpses Say The Darndest Things', 'Stylus-of-Iron'),(1009, 'Nostradamus Ate My Hamster', 'Transworld Publishers'),(1010, 'Chopping Spree', 'Bantam Books'),
(1011, 'Killer Pancake', 'Bantam Books'),(1012, 'How to Tell if Your Cat is Plotting to Kill You', 'Andrews McMeel Publishing'), (1013, 'HELP! A Bear is Eating Me!', 'Eraserhead Press'), (1014, 'The Art of Daydreaming', 'Realist Publishing'), (1015, 'Procrastinate to Success!', 'Scholars Inc Books'), (1016, 'Captain Ruffles and Clifford', 'Bark Tree Books'),
(1017, 'The Bassist Pretense', 'Frequency Corp') , (1018, 'Simpler, Safer, Smarter', 'Duft Pank ') ,(1019, 'Wave After Wave', 'Boyce Drive'), (1020, 'I Got This!:The Best Lie Ever', 'FakingIt Publications')

INSERT INTO LIBRARY_BRANCH -- BranchId, BranchName, Address
VALUES (1, 'Sharpstown', '88 Sharp St. Town, MA 89450'),(2, 'Central','45 University Dr. College Station, TX 77840')

INSERT INTO LIBRARY_BRANCH -- -- BranchId, BranchName, Address
VALUES (3, 'Harris', '1085 West Drive Cypress, TX 77056'),(4, 'Moana District','50 Acqua St. Maui, HI 10645'), (5, 'Silicon Wafer','1245 Typo Drive San Jose, CA 90101')

INSERT INTO BOOK_AUTHORS --BookID, Author format
VALUES (1001, 'Juju Bad'), (1002, 'Stephen King'), (1003, 'Douglas Davies'),(1004, 'Captain John W. Trimmer'),(1005, 'Heather Busch, Burton Silver'),
(1006, 'Erma Bombeck'),(1007,'Philip K. Dick'),(1008, 'Doug Lamoreux'),(1009, 'Robert Rankin'),(1010, 'Diane Mott Davidson'),
(1011, 'Diane Mott Davidson'),(1012, 'Matthew Inman'), (1013, 'Mykle Hansen'), (1014, 'Cloud VanWhyte'), (1015, 'Gru Villain'), (1016, 'Kirby Poscky'),
(1017, 'Mari Cablo') , (1018, 'Blu Dabididai') ,(1019, 'Richard Norsek'), (1020, 'Baldy Heady')

INSERT INTO BOOK_COPIES -- BookID, Branch_Id, No_of_copies
VALUES (1001, 1, 5),(1002, 1, 7),(1003, 1, 9),(1004, 1, 3),(1005, 1, 5),(1006, 1, 7),(1007, 1, 9),(1008, 1, 3),(1009, 1, 5),(1010, 1, 9),
(1011, 2, 2), (1012, 2, 4),(1013, 2, 6),(1014, 2, 8),(1015, 2, 6),(1016, 2, 4),(1017, 2, 2),(1018, 2, 4),(1019, 2, 6),(1020, 2, 8),
(1002, 3, 2), (1004, 3, 4),(1006, 3, 3),(1008, 3, 5),(1010, 3, 6),(1012, 3, 8),(1014, 3, 7),(1016, 3, 9),(1018, 3, 5),(1020, 3, 5),
(1001, 4, 7), (1003, 4, 7),(1005, 4, 6),(1007, 4, 6),(1009, 4, 5),(1011, 4, 5),(1015, 4, 4),(1017, 4, 4),(1019, 4, 3),(1020, 4, 3),
(1001, 5, 2), (1002, 5, 2),(1003, 5, 5),(1004, 5, 5),(1005, 5, 3),(1011, 5, 3),(1012, 5, 4),(1013, 5, 4),(1014, 5, 7),(1015, 5, 7)

INSERT INTO BOOK_COPIES
VALUES (1002,2,9)

INSERT INTO BORROWER --CardNo, Name, Address, Phone
VALUES (11111, 'Karen Cameron','3079 Custer Street Erie, PA 16505','814-833-0406'),(22222, 'Jesse Ellis','2593 Woodlawn Drive New Berlin, WI 53151','414-727-3457'),
(33333,'Clarence Fontenot','2104 Trouser Leg Road Springfield, MA 01103','413-893-4869'),(44444,'Robert Garcia','846 Hillcrest Circle Rockford, MN 55373','763-477-6818'),
(55555,'Enid McCarver','3895 Pleasant Hill Road Los Angeles, CA 90017','562-205-1156'),(66666,'Lashell Smith', '4420 Viking Drive Worthington, OH 43085','740-761-2028'),
(77777,'Bryan Vanhorn','620 Heritage Road Fresno, CA 93721','559-778-9738'),(88888,'Missy Luzvimind','1005 Alpaca Way Orange, CA 92668','714-704-7081'),

INSERT INTO BORROWER
VALUES (10101,'Kenneth Mancini','1897 White Pine Lane Fredericksburg, VA 22401','540-604-5661'), (20202, 'Joshua Snook','934 Simons Hollow Road Scranton, PA 18503','570-840-1407')

INSERT INTO BOOK_LOANS -- BookId, BranchId,CardNo, DateOut, DueDate
VALUES(1001,1,11111,'2017-04-14','2017-04-28'),(1002,1,11111,'2017-04-14','2017-04-28'),(1003,1,11111,'2017-04-14','2017-04-28'),(1004,1,11111,'2017-04-14','2017-04-28'),(1005,1,11111,'2017-04-14','2017-04-28'),(1006,1,11111,'2017-03-02','2017-03-18'),(1007,1,11111,'2017-03-02','2017-03-18'),(1008,1,11111,'2017-03-02','2017-03-18'),(1009,1,11111,'2017-03-02','2017-03-18'),(1010,1,11111,'2017-03-02','2017-03-18'),
(1011,2,88888,'2017-04-24','2017-05-10'),(1012,2,88888,'2017-04-24','2017-05-10'),(1013,2,88888,'2017-04-24','2017-05-10'),(1014,2,88888,'2017-04-24','2017-05-10'),(1015,2,88888,'2017-04-24','2017-05-10'),(1016,2,88888,'2017-03-02','2017-03-18'),(1017,2,88888,'2017-03-02','2017-03-18'),(1018,2,88888,'2017-03-02','2017-03-18'),(1019,2,88888,'2017-03-02','2017-03-18'),(1020,2,88888,'2017-03-02','2017-03-18'),
(1002,3,22222,'2017-03-24','2017-04-09'),(1004,3,22222,'2017-03-24','2017-04-09'),(1006,3,22222,'2017-03-24','2017-04-09'),(1008,3,22222,'2017-03-24','2017-04-09'),(1010,3,22222,'2017-03-24','2017-04-09'),
(1001,4,33333,'2016-03-10','2016-03-24'),(1003,4,33333,'2016-03-10','2016-03-24'),(1005,4,33333,'2016-03-10','2016-03-24'),(1007,4,33333,'2016-03-10','2016-03-24'),(1009,4,33333,'2016-03-10','2016-03-24'),
(1001,5,44444,'2017-03-24','2017-05-09'),(1002,5,44444,'2017-03-24','2017-05-09'),(1003,5,44444,'2017-03-24','2017-05-09'),(1004,5,44444,'2017-03-24','2017-05-09'),(1005,5,44444,'2017-03-24','2017-05-09'),
(1005,1,55555,'2016-01-07','2016-01-23'),(1006,1,55555,'2016-01-07','2016-01-23'),(1007,1,55555,'2016-01-07','2016-01-23'),(1008,1,55555,'2016-01-07','2016-01-23'),(1009,1,55555,'2016-01-07','2016-01-23'),
(1016,2,66666,'2017-01-05','2017-01-21'),(1017,2,66666,'2017-01-05','2017-01-21'),(1018,2,66666,'2017-01-05','2017-01-21'),(1019,2,66666,'2017-01-05','2017-01-21'),(1020,2,66666,'2017-01-05','2017-01-21'),
(1012,3,77777,'2017-02-11','2017-02-28'),(1014,3,77777,'2017-02-11','2017-02-28'),(1016,3,77777,'2017-02-11','2017-02-28'),(1018,3,77777,'2017-02-11','2017-02-28'),(1020,3,77777,'2017-02-11','2017-02-28')

SELECT * FROM BOOK_LOANS WHERE CardNo = 11111

	UPDATE BOOK_LOANS
	SET DueDate = '2017-04-16'
	WHERE CardNo = 11111 AND BookId= 1001

DROP DATABASE IF EXISTS `books`;
CREATE DATABASE IF NOT EXISTS `books`;
USE `books`;
SET NAMES utf8mb4;
SET character_set_client = utf8mb4;

CREATE TABLE `Customers` (
	`CustomerID` int NOT NULL,
    `Name` varchar (20) NOT NULL,
    `Address` varchar (20) NOT NULL,
    `City` varchar (20) NULL,
    `Region` varchar (20) NULL,
    `PostalCode` varchar (20) NULL,
    `Country` varchar (20) NULL,
    `Email` varchar (20) NULL,
    `Salutation` varchar (20) NULL,
    `ContactNumber` decimal (20) NULL, 
    PRIMARY KEY (`CustomerID`),
    INDEX `CustomerID` (`CustomerID` ASC),
    INDEX `Name` (`Name` ASC) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Publisher` (
`PublisherID` int NOT NULL,
`PublishingCompanyName` varchar (20) NOT NULL,
`ContactName` varchar (20) NULL,
`Address` varchar (20) NULL,
`City` varchar (20) NULL,
`Region` varchar (20) NULL,
`PostalCode` varchar (20) NULL,
`Country` varchar (20) NULL,
`Phone` varchar (20) NULL,
`Copyright` varchar (20) NULL,
  PRIMARY KEY (`PublisherID`),
    INDEX `PublisherID` (`PublisherID` ASC),
    INDEX `PublishingCompanyName` (`PublishingCompanyName` ASC) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Genre` (
`GenreID` int NOT NULL,
`Region` varchar (20) NULL,
`Sub-genre` varchar (20) NULL,
`Age Category` varchar (20) NULL,
 PRIMARY KEY (`GenreID`),
    INDEX `GenreID` (`GenreID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Editors` (
`EditorID` int NOT NULL,
`ContactName` varchar (20) NULL,
`Address` varchar (20) NULL,
`City` varchar (20) NULL,
`Region` varchar (20) NULL,
`PostalCode` varchar (20) NULL,
`Country` varchar (20) NULL,
`Phone` varchar (20) NULL,
 PRIMARY KEY (`EditorID`),
    INDEX `EditorID` (`EditorID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Order` (
`OrderID` int NOT NULL,
`CustomerID` int NOT NULL,
`TypeofSale` varchar (20) NULL,
`OrderDate` varchar (20) NULL,
`ShipName` varchar (20) NULL,
`ShipAddress` varchar (20) NULL,
`ShipCity` varchar (20) NULL,
`ShipRegion` varchar (20) NULL,
`ShipPostalCode` varchar (20) NULL,
`ShipCountry` varchar (20) NULL,
 PRIMARY KEY (`OrderID`),
 FOREIGN KEY (`CustomerID`) REFERENCES `Customers`(`CustomerID`),
    INDEX `OrderID` (`OrderID` ASC)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Author` (
`AuthorID` int NOT NULL,
`GenreID` varchar (20) NOT NULL,
`BookID` varchar (20) NULL,
`Name` varchar (20) NOT NULL,
`Country` varchar (20) NULL,
  PRIMARY KEY (`AuthorID`),
  FOREIGN KEY (`GenreID`) REFERENCES `Genre`(`GenreID`),
  FOREIGN KEY (`BookID`) REFERENCES `Books`(`BookID`),
   INDEX `AuthorID` (`AuthorID` ASC),
    INDEX `Name` (`Name` ASC) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Royalty` (
`RoyaltyRate` int NOT NULL,
`AuthorID` int NOT NULL,
`BookID` int NOT NULL,
`Category` varchar (20) NULL,
`Period` varchar (20) NULL,
`TypeofSale` varchar (20) NULL,
`PriceperUnit` varchar (20) NULL,
`AuditClause` varchar (20) NULL,
 PRIMARY KEY (`RoyaltyRate`),
 FOREIGN KEY (`AuthorID`) REFERENCES `Author`(`AuthorID`),
 FOREIGN KEY (`BookID`) REFERENCES `Books`(`BookID`),
    INDEX `RoyaltyRate` (`RoyaltyRate` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Books` (
`BookID` int NOT NULL,
`AuthorID` int NOT NULL,
`GenreID` int NOT NULL,
`PublisherID` int NOT NULL,
`RoyaltyRate` int NOT NULL,
`UnitPrice` varchar (20) NOT NULL,
`UnitsInStock` varchar (20) NULL,
`UnitsinOrder` varchar (20) NULL,
`Cover` varchar (20) NULL,
`BookTitle` varchar (50) NOT NULL,
`ISBN` varchar (20) NOT NULL,
  PRIMARY KEY (`BookID`),
  FOREIGN KEY (`AuthorID`) REFERENCES `Author`(`AuthorID`),
  FOREIGN KEY (`GenreID`) REFERENCES `Genre`(`GenreID`),
  FOREIGN KEY (`PublisherID`) REFERENCES `Publisher`(`PublisherID`),
  FOREIGN KEY (`RoyaltyRate`) REFERENCES `Royalty`(`RoyaltyRate`),  
    INDEX `BookID` (`BookID` ASC),
    INDEX `BookTitle` (`BookTitle` ASC) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


------- INPUT DATA FORMAT ---- 

INSERT INTO `Customers` VALUES (1, 'Rosario', '12 Inman St', 'Cambridge', 'MA', 02139, 'USA', 'rosario@gmail.com', 'Ms', 8571231234);
INSERT INTO `Customers` VALUES (2, 'Pamela', '15 George St', 'Cambridge', 'MA', 02139, 'USA', 'pamela@gmail.com', 'Ms', 8572345678);
INSERT INTO `Customers` VALUES (3, 'Francisco', '34 Bristol St', 'Cambridge', 'MA', 02139, 'USA', 'francisco@gmail.com', 'Mr', 85786078564);

INSERT INTO `Publisher` VALUES (11, 'Publicando', 'German', '14 flowers st', 'Cambridge', 'MA', 02139, 'USA', 8579999999, '©2018 Jane Doe');
INSERT INTO `Publisher` VALUES (22, 'Amigos', 'Gonzalo', '24 media st', 'Cambridge', 'MA', 02139, 'USA', 8577777777, '©2019 Jake');
INSERT INTO `Publisher` VALUES (33, 'Flores', 'Cristina', '56 mass st', 'Cambridge', 'MA', 02139, 'USA', 8578888888, '©2020 Mall');
 
INSERT INTO `Genre` VALUES (111, 'Asia', 'Poetry', 'Adult');
INSERT INTO `Genre` VALUES (222, 'Europe', 'Lyrics', 'Kids');
INSERT INTO `Genre` VALUES (333, 'Latam', 'Novel', 'Adult');

INSERT INTO `Editors` VALUES (1111, 'Francisco', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Editors` VALUES (2222, 'Luna', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Editors` VALUES (3333, 'Melissa', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `Order` VALUES (001, 1, 'Online', '15-Oct', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Order` VALUES (002, 2, 'Store', '16-Oct', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `Order` VALUES (003, 3, 'Online', '17-Oct', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `Author` VALUES (100, 111, 00001, 'DaVinci', 'Peru');
INSERT INTO `Author` VALUES (101, 222, 00002, 'DaVinci', 'Peru');
INSERT INTO `Author` VALUES (102, 333, 00003, 'DaVinci', 'Peru');

INSERT INTO `Royalty` VALUES (10, 100, 00001, NULL, NULL, NULL, 45, 560);
INSERT INTO `Royalty` VALUES (20, 200, 00002, NULL, NULL, NULL, 50, 456);
INSERT INTO `Royalty` VALUES (30, 300, 00003, NULL, NULL, NULL, 78, 777);

INSERT INTO `Book` VALUES (00001, 100, 111, 11, 10, 45, 765, 5, 'Hard', 'Los Palitos', '1234567');
INSERT INTO `Book` VALUES (00002, 200, 222, 22, 20, 50, 345, 4, 'E-book', 'Los Loros', '1234546');
INSERT INTO `Book` VALUES (00003, 300, 333, 33, 30, 78, 745, 3, 'Hard', 'Las Aguas', '1234577');

------- QUERIES----

------- BOOKS PER AUTHOR ----

SELECT t1.`BookID` 
	, COUNT (t2.`AuthorID`) AS BookperAuthor
FROM `Books` AS t1
INNER JOIN `Author` AS t2
ON t1.`BookID` = t2.`AuthorID`;

 ------- AUTHORS PER BOOK ----
 
SELECT t1.`AuthorID`
	, COUNT(t2.`BookID`) AS countofBooks
FROM `Books` AS t1
INNER JOIN `Books` AS t2
ON t1.`AuthorID` = t2.`BookID`;


 ------- AUTHOR ROYALTIES ON A BOOK ----
SELECT t1.`AuthorID`
	, SUM(t2.`RoyaltyRate`) AS sumofRoyalties
FROM `Books` AS t1
INNER JOIN `Books` AS t2
ON t1.`AuthorID` = t2.`RoyaltyRate`;

 ------- AUTHOR ROYALTIES PER AUTHOR ----

SELECT t1.`AuthorID` 
, SUM (t3.`RoyaltyRate`) AS Royalties_on_a_Book
	FROM `Author` AS t1
JOIN `Books` AS t2
	ON t1.`AuthorID` = t2.`BookID`
JOIN `Royalty` AS t3

	ON t3.`RoyaltyRate` = t2.`BookID`;
	
        
------- BOOKS IN A GENRE ----
SELECT t1.`BookID`
	, COUNT(t2.`BookID`) AS countofBooks
FROM `Books` AS t1
INNER JOIN `Genre` AS t2
ON t1.`BookID` = t2.`GenreID`;    
    


------- BOOKS PUBLISHED BY A PUBLISHER ----
SELECT t1.`BookID`
	, COUNT(t2.`BookID`) AS Bookspublished
FROM `Books` AS t1
INNER JOIN `Publisher` AS t2
ON t1.`BookID` = t2.`PublisherID`;    


------- EDITORS PER BOOK ----    
SELECT t1.`EditorID`
	, COUNT(t2.`EditorID`) AS EditorperBook
FROM `Editors` AS t1
INNER JOIN `Books` AS t2
ON t1.`EditorID` = t2.`BookID`;


------- BOOKS PER EDITOR ----    
SELECT t1.`BookID`
	, COUNT(t2.`BookID`) AS BooksperEditor
FROM `Books` AS t1
INNER JOIN `Editors` AS t2
ON t1.`BookID` = t2.`EditorID`;


------- BOOKS IN AN ORDER ----    
SELECT t1.`BookID`
	, COUNT(t2.`BookID`) AS BooksinOrder
FROM `Books` AS t1
INNER JOIN `Order` AS t2
ON t1.`BookID` = t2.`OrderID`;


------- ORDERS FOR A BOOK ----
SELECT t1.`BookID`
	, COUNT(t2.`OrderID`) AS OrdersforBook
FROM `Books` AS t1
INNER JOIN `Order` AS t2
ON t1.`BookID` = t2.`OrderID`;


------- CUSTOMER ORDERS ----
SELECT Customers.`Name`
FROM Customers
LEFT JOIN `Order`
ON Customers.CustomerID = `Order`.OrderID;


------- ORDERS PER CUSTOMER ----    
SELECT t1.`CustomerID`
	, COUNT(t2.`OrderID`) AS OrdersperCustomer
FROM `Customers` AS t1
INNER JOIN `Order` AS t2
ON t1.`CustomerID` = t2.`OrderID`;

    
    
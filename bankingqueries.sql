show databases ;

create database BankingDB;
use BankingDB;

create table customers(
    customerID INT,
    firstName varchar(50),
    lastName varchar(50),
    email varchar(100),
    phone varchar(10)
);

desc customers;

ALTER TABLE customers
ADD CONSTRAINT pk_customer_id PRIMARY KEY (customerID);

select * from customers;

ALTER table customers
ADD AccountCreationDate Date;

CREATE TABLE Accounts (
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

ALTER TABLE Accounts
ADD CONSTRAINT pk_Account_id PRIMARY KEY (AccountID);

CREATE TABLE Transactions (
TransactionID INT,
TransactionDate DATE,
Amount DECIMAL,
TransactionType VARCHAR(10)
);

ALTER TABLE Transations
ADD CONSTRAINT pk_Transaction_id PRIMARY KEY (TransactionID);

CREATE TABLE Branches (
branchID INT,
branchName VARCHAR(100),
branchAddress VARCHAR(200),
branchPhone VARCHAR(15)
);

ALTER TABLE Branches
ADD CONSTRAINT pk_branch_id PRIMARY KEY (branchID);

desc Branches;

CREATE TABLE Loans (
LoanID INT,
LoanAmount DECIMAL(10,2),
InterestRate DECIMAL(5,2),
StartDate DATE,
EndDate DATE
);

ALTER TABLE Loans
ADD CONSTRAINT pk_loan_id PRIMARY KEY (LoanID);

desc Loans;

CREATE TABLE AccountBranches (
    AssignmentDate DATE
    );

desc loans;

ALTER TABLE customers
ADD DateOfBirth DATE;

desc customers;

ALTER TABLE customers
MODIFY Phone VARCHAR(20);

desc customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBAlance
CHECK (Balance >= 100);

desc accounts;

DROP TABLE AccountBranches;

DROP TABLE Branhes;

DROP TABLE Transctions;

ALTER TABLE Accounts
ADD customerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT Fk_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

alter table Accounts
drop column customersID;

desc Accounts;

ALTER TABLE customers
MODIFY Firstname VARCHAR(50) NOT NULL;

desc customers;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

desc Customers;

ALTER TABLE Accounts
DROP COLUMN Customers;

ALTER TABLE customers
ALTER COLUMN lastname set default "NA";

ALTER TABLE Accounts
ADD branchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT Fk_Accounts_Branches
FOREIGN KEY (branchID)
REFERENCES Branches(branchID);

desc Accounts;

ALTER TABLE Accounts
DROP COLUMN Branches;

ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Transactions
ADD CONSTRAINT fk_AccountID
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

desc Transactions;

ALTER TABLE Loans
ADD customerID INT;

ALTER TABLE Loans
ADD CONSTRAINT fk_customerID
FOREIGN KEY (customerID)
REFERENCES customers(customerID);

desc loans;


CREATE TABLE KYC (
KYCID INT PRIMARY KEY,
AadharNo VARCHAR(12) NOT NULL,
PanNo VARCHAR(10) NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT fk_customer
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

desc KYC;

SHOW CREATE TABLE KYC; -- you can change table name as per your requirement 

-- you can get information about constraint applies on a secific table 
-- by the query written below

SELECT 
CONSTRAINT_NAME,
CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'bankingdb'
AND TABLE_NAME = 'kyc';

INSERT INTO Customers
VALUES
(101,'Amit','Sharma','amit@gmail.com','9876543210','2024-01-15','1998-05-10');

INSERT INTO Customers
(customerid,firstname,lastname,email,phone,accountcreationdate,dateofbirth)
VALUES(102,'Priya','Patil','priya@gmail.com','2343532523','2024-02-15','1999-08-22');

select * from Customers;

INSERT INTO Customers
(phone,email,lastname,firstname,accountcreationdate,dateofbirth,customerid)
values ('9876543212','rahul@gmail.com','Verma','Rahul','2024-03-12','1997-11-14',103);

INSERT INTO Customers
VALUES
(104,'Sneha','Joshi','sneha@gmail.com','9876543213','2024-04-18','2000-01-05'),
(105,'Karan','Mehta','karan@gmail.com','9876543214','2024-05-25','1996-12-30');

INSERT INTO Branches
VALUES
(1,'Nagpur Branch','Sitabuldi, Nagpur','0712-123456'),
(2,'Pune Branch','Shivaji Nagar, Pune','020-223344'),
(3,'Mumbai Branch','Andheri, Mumbai','022-334455');

select * from branches;


INSERT INTO Accounts
VALUES
(1001,'Savings',25000,1,101),
(1002,'Current',45000,2,102),
(1003,'Savings',18000,1,103),
(1004,'Current',72000,3,104),
(1005,'Savings',15000,2,105);


select * from accounts;

INSERT INTO Transactions
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);

select * from transactions;

INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);

select * from loans;

UPDATE customers
set email = 'amit2026@yahoo.com'
where customerid = 101;

UPDATE customers
set lastName = 'joshi'
where customerid = 102;

select * from customers;
select * from branches;

UPDATE branches
set branchaddress = 'Civil, Nagpur',
branchphone = '9766-641822'
where branchID = 1;

select * from branches;

select * from KYC;

INSERT INTO KYC 
values (701,'273856438989','UNKJG2323J',101),
(702,'232267437628','UNKHG5643K',103),
(703,'245479333783','UNKID8962K',102);

SELECT * FROM KYC;

DELETE FROM KYC WHERE KYCID = 702;

DELETE FROM KYC;



select accountid,accounttype,balance 

select * from customers
where customerid = 104;


SELECT 
    *
FROM
    accounts
WHERE
    accounttype = 'savings'
        AND balance > 20000;
        
        SELECT 
    *
FROM
    accounts
WHERE
    accounttype = 'savings'
        OR balance > 20000;
        -- find all accounts where account type 
        select * from accounts
        where NOT accounttype >= 'Savings' ;
        
         select * from accounts
        where NOT accounttype = 'Savings' ;
        
         select * from accounts
        where NOT accounttype != 'Savings' ;
        
         select * from accounts
        where NOT accounttype <> 'Savings' ;
        
        select * from loans; 
        
        select * from loans
        where interestrate = 8.5 OR interestrate = 9.0;


 select * from loans
        where interestrate IN (8.5,9.0);
        
        select * from transactions
where Transactiontype not in ("deposit", "withdrawal");
        
        select * from loans
        where interestrate BETWEEN 7.5 AND 8.5;
        
        -- find all customer having alance between 20k and 60k 
        select * from accounts
        where balance BETWEEN 20000 and 60000;
        
        -- find all customer having alance between 20k and 60k 
        -- and account type should be current 
        select * from accounts
        where balance BETWEEN 20000 and 60000 and accounttype = 'current';
        
        select * from customers;
        
        -- LIKE operator
        select * from customers
        where lastname LIKE 'J%';
        
         select * from customers
        where lastname LIKE '%a';
        
        select * from customers
        where firstname LIKE '%a';
        
        select * from customers
        where firstname LIKE '%ya';
        
        select * from customers
        where firstname LIKE 'P____';
        
          select * from customers
        where firstname LIKE 'A___';
        
        select * from customers;
        
        select * from accounts;
        
        -- Sort accounts table as per balance in descending order
        
        select * from accounts
        order by balance;
        
        select * from accounts
        order by balance desc;
        
        select * from accounts
        order by balance desc, balance desc ;
        
       -- - Extra practice data for banking_db (MySQL 8.0)
-- Run AFTER the original dump has been restored.
-- Insert order respects foreign keys: branches -> customers -> accounts -> kyc -> loans -> transactions
-- NOTE: chk_MinBalance requires Balance >= 1000 (NULL is allowed by a CHECK constraint).
-- NOTE: Aadhaar / PAN values below are FAKE, for practice only.

USE banking_db;

        
        -- BRANCHES  (NULL address / NULL phone; branch 6 has no accounts)
        INSERT INTO branches (BranchID, BranchName, BranchAddress, BranchPhone) VALUES
(4, 'Nashik Branch',      'College Road, Nashik',      NULL),
(5, 'Chandrapur Branch',  NULL,                        '07172-250100'),
(6, 'Aurangabad Branch',  'Station Road, Aurangabad',  '0240-334455');

select * from branches;

INSERT INTO customers (customerID, FirstName, lastname, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(106, 'Neha',   'Kulkarni', 'neha.k@gmail.com',       '9876543215', '2024-06-10', '1995-03-18'),
(107, 'Vikram', 'Singh',    NULL,                     '9876543216', '2024-07-01', '1994-07-07'),
(108, 'Anjali', NULL,       'anjali@outlook.com',     NULL,         '2024-08-14', '2001-09-12'),
(109, 'Rohan',  'Deshmukh', 'rohan.d@yahoo.com',      '9876543218', NULL,         '1993-02-25'),
(110, 'Pooja',  'Joshi',    'pooja@gmail.com',        '9876543219', '2024-09-30', NULL),
(111, 'Suresh', 'Patil',    NULL,                     NULL,         '2024-10-05', '1990-06-15'),
(112, 'Meera',  'Nair',     'meera.nair@gmail.com',   '9876543221', '2025-01-20', '1999-12-01'),
(113, 'Amit',   'Verma',    'amitv@rediffmail.com',   '9876543222', '2025-02-11', '1998-05-10'),
(115, 'Sanjay', 'Mehta',    'sanjay.m@gmail.com',     NULL,         '2025-04-09', '1988-10-28');

select * from customers;

-- lastname omitted on purpose, so the DEFAULT 'NA' is applied
INSERT INTO customers (customerID, FirstName, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(114, 'Kavita', 'kavita@gmail.com', '9876543223', '2025-03-03', '2002-04-17');
        
        -- ACCOUNTS  (NULL AccountType / Balance / CustomerID / BranchID)
-- Customers 114 and 115 intentionally have NO account.
-- ---------------------------------------------------------
INSERT INTO accounts (AccountID, AccountType, Balance, CustomerID, BranchID) VALUES
(1006, 'Savings', 32000.00,  106,  1),
(1007, 'Current', 150000.00, 107,  3),
(1008, 'Savings', NULL,      108,  2),
(1009, NULL,      5000.00,   109,  4),
(1010, 'Savings', 1000.00,   110,  4),
(1011, 'Current', 98000.00,  111,  5),
(1012, 'Savings', 12000.00,  112,  NULL),
(1013, 'Current', 27500.50,  101,  3),
(1014, 'Savings', 60000.00,  NULL, 1),
(1015, 'Savings', 8500.00,   113,  2);

select * from accounts;
        
-- KYC  (table was empty; only some customers have KYC)
-- No KYC for 108, 110, 111, 113, 114, 115
-- ---------------------------------------------------------
INSERT INTO kyc (kycid, aadharNo, panNo, customerid) VALUES
(1, '234567890123', 'ABCPS1234A', 101),
(2, '345678901234', 'BCDPJ2345B', 102),
(3, '456789012345', 'CDEPV3456C', 103),
(4, '567890123456', 'DEFPJ4567D', 104),
(5, '678901234567', 'EFGPM5678E', 105),
(6, '789012345678', 'FGHPK6789F', 106),
(7, '890123456789', 'GHIPS7890G', 107),
(8, '901234567890', 'HIJPD8901H', 109),
(9, '112233445566', 'IJKPN9012I', 112);

select * from kyc;

-- LOANS  (NULL InterestRate / LoanAmount / EndDate / CustomerID)
-- ---------------------------------------------------------
INSERT INTO loans (LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID) VALUES
(504, 400000.00, 8.25, '2025-01-10', '2030-01-10', 105),
(505, 150000.00, NULL, '2025-02-01', '2027-02-01', 106),
(506, 900000.00, 7.50, '2025-03-05', NULL,         107),
(507, NULL,      9.50, '2025-04-01', '2029-04-01', 109),
(508, 300000.00, 8.50, '2025-05-15', '2030-05-15', 101),
(509, 120000.00, 10.00,'2025-06-01', '2026-06-01', NULL);
        
        select * from loans;
        
        -- TRANSACTIONS  (NULL Amount / TransactionType / AccountID / TransactionDate)
-- Accounts 1008, 1009, 1012, 1014 have no transactions.
-- ---------------------------------------------------------
INSERT INTO transactions (TransactionID, TransactionDate, Amount, TransactionType, AccountID) VALUES
(6,  '2025-01-18', 1500.00,  'Deposit',    1005),
(7,  '2025-01-20', NULL,     'Deposit',    1006),
(8,  '2025-02-02', 4500.00,  'Withdrawal', 1006),
(9,  '2025-02-05', 20000.00, 'Deposit',    1007),
(10, '2025-02-10', 2500.00,  NULL,         1007),
(11, '2025-02-14', 800.00,   'Transfer',   1001),
(12, '2025-02-20', 12000.00, 'Transfer',   1004),
(13, '2025-03-01', 6000.00,  'Deposit',    NULL),
(14, '2025-03-05', 3500.00,  'Withdrawal', 1010),
(15, NULL,         9000.00,  'Deposit',    1011),
(16, '2025-03-15', 500.00,   'Withdrawal', 1002),
(17, '2025-03-18', 15000.00, 'Deposit',    1013),
(18, '2025-04-01', 2200.00,  'Withdrawal', 1013),
(19, '2025-04-10', 7500.00,  'Deposit',    1001),
(20, '2025-04-12', 1000.00,  'Transfer',   1015);

select * from transactions;

-- Quick sanity check
SELECT 'branches' AS tbl, COUNT(*) AS cnt FROM branches
UNION ALL SELECT 'customers', COUNT(*) FROM customers
UNION ALL SELECT 'accounts', COUNT(*) FROM accounts
UNION ALL SELECT 'kyc', COUNT(*) FROM kyc
UNION ALL SELECT 'loans', COUNT(*) FROM loans
UNION ALL SELECT 'transactions', COUNT(*) FROM transactions;



-- DISTINCT CLAUSE
select DISTINCT accounttype from accounts;
select distinct transactiontype from transactions;
select distinct customerid,loanid from loans;

-- limit clause 
select * from transactions
LIMIT 5;
select * from transactions
order by amount desc
limit 3;

-- find top 2 transactions having highest withhdrawal amount 
select * from transactions
where transactiontype = "withdrawal"
order by Amount desc
limit 2;

-- OFFSET clause
select * from customers;
select * from customers
LIMIT 5 OFFSET 5;

-- find the customer having highest loan amount.
select * from loans
Order by loanamount desc
LIMIT 1 OFFSET 2;

-- NULL
select customerID,firstname,lastname,email from customers 
where email IS NOT NULL;

select customerID,firstname,lastname from customers 
where lastname IS NULL;

select customerID,firstname,lastname,email,phone from customers 
where email IS NULL AND phone IS NULL;
-- where email IS NULL OR phone IS NULL;

-- CASE Statements
select * from loans;

select loanid,loanamount,customerid,
case 
when loanamount >= 500000 THEN "High value loan"
when loanamount >= 200000 THEN "Median value loan"
ELSE "Low value loan"
END AS LoanCategory
FROM loans;

USE bankingdb;
Select * from Customers
Where Email is Null;

SELECT * FROM Customers
WHERE Phone IS NOT NULL;

SELECT
    FirstName,
    Email,
    Phone,
    COALESCE(Email, Phone, 'No contact') AS BestContact
FROM Customers;

SELECT
    AccountID,
    Balance,
    Balance > 30000 AS Result,
    (Balance > 30000) IS UNKNOWN AS IsUnknown
FROM Accounts;

select AccountID,
balance,
balance > 30000 AS RESULT,
( balance > 30000) IS UNKNOWN AS Isunknown
from accounts;

SELECT
    COUNT(*) as TotalRows,
    COUNT(LoanAmount) as Loanamountcount,
    COUNT(InterestRate) as Interestratecount
FROM loans;

-- String function 

select upper("hello");

select upper(firstname) AS FirstName, Phone, email, from customer;
select lower ;

-- length() function 
SELECT LENGTH('NAGPUR') AS 'NoOfCharacters';-- gives o/p in number of bytes
SELECT LENGTH('नागपूर')p in number of bytes
Select char_length("NAGPUR"); -- gives o/p in number of characters
Select char_length("नागपूर"); -- gives o/p in number of characters

-- concat() function

select concat("hello"," ","World") as ConcatenatedString;
select concat(firstname," ",lastname) as fullname, phone,email from customers;


-- substring() or substr() function
select substr("Hello World India",7,5) as extractedstring;

select customerid, concat(substr(firstname,1,1),".",lastname) as fullname, phone,email from customers;

-- trim() function

SELECT LENGTH('hello World');
SELECT LENGTH(TRIM(' Hello World  '));
SELECT LENGTH(TRIM(SUBSTRING('Hello World', 6)));

-- replace() function

select replace("Mat mat Mat","M","C");

-- Round() function


select avg(Balance) from accounts
where accounttype = "savings";

select round(avg(Balance),2) as Avgbalance from accounts
where accounttype = "savings";

select round(3.6);
select round(3.3);
select round(3.5);

-- Ceil() or Ceiling() function
select ceiling(avg(Balance)) from accounts
where accounttype = "Savings";

-- floor() function

select floor(avg(Balance)) from accounts
where accounttype = "savings";


-- Absolution() function .... It removes the sign
select abs(-3656);
select abs(-1.34);
select abs(6.464);

-- mod() function
select  (7/3);
select mod(7,3);

-- power()
select power(2.3);
select power(1.5,3);

-- SQRT()

select sqrt(123);
select sqrt(144);











        
        
        
        




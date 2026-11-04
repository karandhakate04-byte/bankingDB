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
        
        
        
        
        
        
        




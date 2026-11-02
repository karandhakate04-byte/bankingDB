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
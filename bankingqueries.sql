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

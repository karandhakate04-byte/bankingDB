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

select * from customers;

ALTER table customers
ADD AccountCreationDate Date;

CREATE TABLE Accounts (
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

CREATE TABLE Transctions (
TransactionID INT,
TransactionDate DATE,
Amount DECIMAL,
TransactionType VARCHAR(10)
);

CREATE TABLE Branches (
branchID INT,
branchName VARCHAR(100),
branchAddress VARCHAR(200),
branchPhone VARCHAR(15)
);

CREATE TABLE Loans (
LoanID INT,
LoanAmount DECIMAL(10,2),
InterestRate DECIMAL(5,2),
StartDate DATE,
EndDate DATE
);



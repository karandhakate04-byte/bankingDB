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


create database ineuron
show databases
use ineuron

## creating a table

create table dep(
depid int not null,
depname varchar(100),
depaddress varchar(255))

select * from dep


Insert INTO dep VALUES (21,"Biology","Azad Nagar")
Insert INTO dep VALUES (22,"Chemistry","Azad Nagar")
Insert INTO dep VALUES (23,"Physics","Azad Nagar")
Insert INTO dep VALUES (24,"Maths","Azad Nagar")
Insert INTO dep VALUES (25,"Statistics","Azad Nagar")

select * from dep where depname = "Biology"

## Creating a primary key

create table dep_pk(
depid int not null,
depname varchar(100),
depaddress varchar(255),
primary key (depid))

SELECT * FROM dep_pk

Insert INTO dep_pk VALUES (21,"Biology","Azad Nagar")
Insert INTO dep_pk VALUES (22,"Chemistry","Azad Nagar")
Insert INTO dep_pk VALUES (23,"Physics","Azad Nagar")
Insert INTO dep_pk VALUES (24,"Maths","Azad Nagar")
Insert INTO dep_pk VALUES (25,"Statistics","Azad Nagar")



CREATE TABLE emp(
empid int NOT NULL,
empname varchar(100),
empadd varchar (255),
depid int,
PRIMARY KEY (empid),
FOREIGN KEY (depid) REFERENCES dep_pk(depid))

SELECT * FROm dep

SELECT * FROM emp	

Insert INTO dep VALUES (1,"Bio","Azad Nagar")
Insert INTO dep VALUES (2,"Chem","Azad Nagar")
Insert INTO dep VALUES (3,"Phy","Azad Nagar")
Insert INTO dep VALUES (4,"Math","Azad Nagar")
Insert INTO dep VALUES (5,"Stats","Azad Nagar")

SELECT * from emp WHERE cust_name like "A%a"

create table empinfo (
Firstname varchar(12),
Lastname varchar(10),
city int ,
state int ))
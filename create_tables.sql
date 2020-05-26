create database jsdemo;
use jsdemo;
CREATE TABLE LOCATION(
location varchar(50) PRIMARY KEY
);
CREATE TABLE CUSTOMER(
custName varchar(50),
custPassword varchar(50),
mobile BIGINT PRIMARY KEY,
address varchar(100),
location varchar(50),
email varchar(100),
foreign key(location) references LOCATION(location)
);

create TABLE RESTAURANT(
category varchar(50),
restName varchar(100),
restId BIGINT primary key,
servingState boolean,
rating double,
location varchar(50),
foreign key(location) references LOCATION(location)
);

create table DISH(
dishName varchar(100) primary key,
veg boolean,
category varchar(50)
);
create table DELIVERYPERSON(
divPersonId BIGINT primary key,
location varchar(50),
salary double,
divPersonName varchar(50),
rating double,
available boolean,
foreign key(location) references LOCATION(location)
);
create table CIRCLE(
followerId BIGINT,
followeeId BIGINT,
foreign key(followerId) references Customer(mobile),
foreign key(followeeId) references Customer(mobile)
);
create table SERVES(
restId BIGINT,
dishName varchar(100),
price double,
available boolean,
foreign key(restId) references RESTAURANT(restId),
foreign key(dishName) references DISH(dishName),
primary key(restId,dishName) 
);
create table RECOMMENDS(
mobile BIGINT,
restId BIGINT,
foreign key(mobile) references CUSTOMER(mobile),
foreign key(restId) references RESTAURANT(restId)
);
create table ORDERS(
mobile BIGINT,
restId BIGINT,
orderId BIGINT primary key,
orderDate date,
orderStatus varchar(50),
foreign key(mobile) references CUSTOMER(mobile),
foreign key(restId) references RESTAURANT(restId)
);
create table INGREDIENTS(
dishName varchar(100),
mainIngredient varchar(100),
foreign key(dishName) references DISH(dishName)
);



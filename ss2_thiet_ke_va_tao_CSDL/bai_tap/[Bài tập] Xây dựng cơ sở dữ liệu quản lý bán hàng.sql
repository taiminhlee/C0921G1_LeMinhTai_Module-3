create database quan_li_ban_hang;

use quan_li_ban_hang;

create table customer (
cID int primary key,
cName varchar(50),
cAge int
);

create table product (
pID int primary key,
pName varchar(50),
pPrice double
);

create table `Order`(
oID int primary key,
cID int,
oDate date,
oTotalPrice double,
foreign key (cID) references customer(cID)
);

create table OrderDetail (
oID int,
pID int,
odQTY varchar(50),
primary key (oID,pID),
foreign key (pID) references product(pID),
foreign key (oId) references  `Order`(oId)
);


use quan_li_ban_hang;

insert into Customer
value
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into `Order`
value 
(1,1,'2006/3/21',Null),
(2,2,'2006/3/23',Null),
(3,1,'2006/3/16',Null);

insert into Product
value
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',3),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into OrderDetail
value
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select o.oID, o.oDate, pr.pPrice as oPrice 
from `Order` as o
join OrderDetail as `orD` on o.oID=`orD`.oID
join Product pr on `orD`.pID=pr.pID;

select cus.`cName`, pr.pName
from Customer as cus
join `Order` on cus.cID=`Order`.cID
join `OrderDetail` as orDe on `Order`.oID=orDe.oID
join Product as pr on orDe.pID=pr.pID;

select cus.cName
from Customer as cus
left join `Order`on cus.cID=`Order`.cID;


select `Order`.oID, `Order`.oDate, sum(orDe.odQTY*pr.pPrice) oTotalPrice
from  `Order`
join `OrderDetail` as orDe on `Order`.oID=orDe.oID
join Product as pr on orDe.pID=pr.pID
group by `Order`.oID;

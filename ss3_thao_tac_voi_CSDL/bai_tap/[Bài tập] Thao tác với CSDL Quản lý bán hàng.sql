use quan_li_ban_hang;

insert into Customer
value
(1,`Minh Quan`,10),
(2,`Ngoc Oanh`,20),
(3,`Hong Ha`,50);

insert into `Order`
value 
(1,1,'2006/3/21',Null),
(2,2,'2006/3/23',Null),
(3,1,'2006/3/16',Null);

insert into Product
value
(1,'May Giat',3);

select o.oID, o.oDate, p.pPrice as oPrice 

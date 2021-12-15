create database demo_products;
use demo_products;

create table products (
id int primary key auto_increment,
product_Code varchar (20),
product_Name varchar (50),
produc_tPrice double,
product_Amount int,
product_Description varchar (20),
product_Status varchar (10)
);

insert into products
value
(1,'A4','May Giat',4,6,'hf','sdfs'),
(2,'F7','Tu Lanh',56,2,'kh','kj'),
(3,'T2','Dieu Hoa',5,3,'yut','vbn'),
(4,'I8','Quat',8,9,'ljkn','nhmy'),
(5,'R1','Bep Dien',6,5,'tte','jgj');

create unique index idx_prCode on products(product_Code);
create unique index indx_pr on products(product_Name,produc_tPrice);

explain select *
from products 
where product_Code = 'T2';


explain select *
from products 
where product_Name = 'Dieu Hoa';

create view view_pr as
select product_Code, product_Name, produc_tPrice, product_Status
from products;

select * from view_pr;

update view_pr
set product_Status ='abc'
where product_Name ='Quat';

select * from view_pr;
 
drop view view_pr;

delimiter //
create procedure display()
begin
select *
from products;
end;
// delimiter ;

call display();

delimiter //
create procedure add_pr()
begin
insert products
value (6,'U8','Ti Vi',42,6,'sfsdf','dkg');
end;
// delimiter ;

call add_pr();

delimiter //
create procedure edit(id_pr int)
begin
update products
set product_Status ='abc'
where id =id_pr;
end;
// delimiter ;

call edit(2);

delimiter //
create procedure delete_pr(id_pr int)
begin
delete from products
where id =id_pr;
end;
// delimiter ;

call delete_pr(6);

create database furama;
use furama;

create table position (
position_id int primary key auto_increment,
position_name varchar(45)
);

create table education_degree (
education_degree_id int primary key auto_increment,
education_degree_name varchar(45)
);

create table division (
division_id int primary key auto_increment,
division_name varchar(45)
);

create table `role` (
role_id int primary key auto_increment,
role_name varchar(225)
);

create table `user` (
user_name varchar(225) primary key,
user_password varchar(225)
);

create table user_role (
role_id int,
user_name varchar(225),
foreign key(role_id) references `role`(role_id),
foreign key(user_name) references `user`(user_name)
);

create table employee (
employee_id int primary key auto_increment,
employee_name varchar(45),
employee_birthday date,
employee_id_card varchar(45),
employee_salary double,
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int,
user_name varchar(225),
foreign key(position_id) references position (position_id),
foreign key(education_degree_id) references education_degree (education_degree_id),
foreign key(division_id) references division (division_id),
foreign key(user_name) references `user` (user_name)
);

create table attach_service (
attach_service_id int primary key auto_increment,
attach_service_name varchar(45),
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(45)
);

create table customer_type (
customer_type_id int primary key auto_increment,
customer_type_name varchar(45)
);

create table customer (
customer_id int primary key auto_increment,
customer_type_id int,
customer_name varchar(45),
customer_birthday date,
customer_gender bit(1),
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45),
foreign key(customer_type_id) references customer_type(customer_type_id)
);

create table service_type (
service_type_id int primary key auto_increment,
service_name_name varchar(45)
);

create table rent_type (
rent_type_id int primary key auto_increment,
rent_type_name varchar(45),
rent_type_cost double
);

create table service (
service_id int primary key auto_increment,
service_name varchar(45),
service_area int,
service_cost double,
service_max_people int,
rent_type_id int,
service_type_id int,
standrand_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floos int,
foreign key(rent_type_id) references rent_type(rent_type_id),
foreign key(service_type_id) references service_type(service_type_id)
);

create table contract (
contract_id int primary key auto_increment,
contract_start_date datetime,
contract_end_date datetime,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id int,
service_id int,
foreign key(employee_id) references employee(employee_id),
foreign key(customer_id) references customer(customer_id),
foreign key(service_id) references service(service_id)
);

create table contract_detail (
contract_detail_id int primary key auto_increment,
contract_id int,
attach_service_id int,
quantity int,
foreign key(contract_id) references contract(contract_id),
foreign key(attach_service_id) references attach_service(attach_service_id)
);

alter table customer
add customer_status bit(1) ;

insert into customer (customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address, customer_status)
value
(1,'Nguyễn Thị Hào','1970-11-07',b'0','643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',1),
(3,'Phạm Xuân Diệu','1992-08-08',b'1','865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',1),
(1,'Trương Đình Nghệ','1990-02-27',b'1','488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1);

insert into customer_type(customer_type_id, customer_type_name)
value
(1,'Diamond'),	
(2,'Platinium'),	
(3,'Gold'),	
(4,'Silver'),	
(5,'Member');

select * from customer
join customer_type ct on customer.customer_type_id=ct.customer_type_id;

insert into customer ( customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address, customer_status)
value
(4,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',1);

insert into position (position_name)
value
("Lễ tân"),
("Phục vụ"),
("Chuyên viên"),
("Giám sát"),
("Quản lý"),
("Giám đốc");

insert into division (division_name)
value
("Sale-Marketing"),
("Hành chính"),
("Phục vụ"),
("Quản lý");

insert into education_degree (education_degree_name)
value
("Trung cấp"),
("Cao đẳng"),
("Đại học"),
("Sau đại học");

insert into `user` (user_name, user_password)
value
('annguyen@gmail.com', "annguyen789"),
('binhlv@gmail.com', "binhvl11"),
('thiyen@gmail.com', "thiyennn"),
('toan0404@gmail.com', "toann1234");

insert into employee (employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone,
 employee_email, employee_address, position_id, education_degree_id, division_id, user_name,employee_status)
 value
 ('Nguyễn Văn An','1970-11-07','456231786','10000000','0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1,'annguyen@gmail.com',1),
 ('Lê Văn Bình','1997-04-09','654231234','7000000','0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2,'binhlv@gmail.com',1),
 ('Hồ Thị Yến','1995-12-12','999231723','14000000','0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2,'thiyen@gmail.com',1),
 ('Võ Công Toản','1980-04-04','123231365','17000000','0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4,'toan0404@gmail.com',1);
 
 select * from employee as em
 join position po on em.position_id=po.position_id
 join education_degree edu on em.education_degree_id=edu.education_degree_id
 join division di on em.division_id=di.division_id
 join `user` on em.user_name=`user`.user_name;
 
 alter table employee
 add employee_status bit(1);
 
 insert into employee (employee_status)
 value 
 (b1),
 (b1),
 (b1),
 (b1);

 









 








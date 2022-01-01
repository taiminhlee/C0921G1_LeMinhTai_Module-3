CREATE DATABASE demo;
use demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)

BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$

DELIMITER ;

  

DELIMITER $$

CREATE PROCEDURE insert_user(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)

BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$

DELIMITER ;

create table Permision(

id int(11) primary key,

name varchar(50)

);

 

create table User_Permision(

permision_id int(11),

user_id int(11)

);

insert into Permision(id, `name`) values(1, 'add');

insert into Permision(id, `name`) values(2, 'edit');

insert into Permision(id, `name`) values(3, 'delete');

insert into Permision(id, `name`) values(4, 'view');

DELIMITER $$
create procedure display()
begin
select * from users;
end$$
DELIMITER ;

call display();

DELIMITER $$
create procedure edit(
in id_user int,

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)
begin
update users set `name`=user_name, email=user_email, country=user_country
where id=id_user;
end$$
DELIMITER ;

call edit();

delimiter $$
create procedure `delete`(
in id_user int
)
begin
delete from users
where id=id_user;
end$$
delimiter ;


call `delete`();


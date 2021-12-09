CREATE TABLE `student` (
`id` INT PRIMARY KEY,
`name` VARCHAR(45),
`age` INT,
`country` VARCHAR(45)
 );

insert into `student`
value 
(1, 'Nguyễn Văn A', 20, 'Việt Nam'),
(2, 'Nguyễn Văn B', 21, 'Việt Nam');

update student
set country = 'Thái Lan'
where id=2;

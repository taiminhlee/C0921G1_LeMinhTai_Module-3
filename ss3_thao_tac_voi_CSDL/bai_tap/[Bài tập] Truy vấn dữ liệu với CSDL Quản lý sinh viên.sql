use quan_li_sinh_vien;

select *
from student
where StudentName like '%h%';

select *
from class
where StartDate like '%12%';

select *
from `subject`
where credit between 3 and 5;

update student
set ClassId =2
where StudentName='Hung';


select s.StudentName, sub.SubName, mark.Mark
from Student as s
join Mark on s.StudentID=Mark.StudentID
join `Subject` as sub on Mark.SubId=sub.SubId
order by mark.Mark desc, s.StudentName;

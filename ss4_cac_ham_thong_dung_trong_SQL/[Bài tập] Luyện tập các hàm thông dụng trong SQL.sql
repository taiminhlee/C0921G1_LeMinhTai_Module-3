use quan_li_sinh_vien;

select SubName
from `subject`
having max(Credit);

select `subject`.SubId, `subject`.SubName, `subject`.Credit, `subject`.`Status` 
from `subject`
 join Mark on `subject`.SubId=Mark.SubId
having max(mark);

select stu.StudentId, stu.StudentName, stu.Address, stu.Phone, avg(m.mark) diem_trung_binh
from Student stu
join Mark m on stu.StudentId=m.StudentId
group by m.StudentId
order by diem_trung_binh desc;

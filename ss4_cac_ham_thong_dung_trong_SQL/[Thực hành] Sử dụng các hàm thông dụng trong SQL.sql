use quan_li_sinh_vien;

SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

SELECT S.StudentId, S.StudentName, Mark
FROM Student S
         join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId;
-- HAVING AVG(Mark) > 15;

SELECT S.StudentId, S.StudentName, Mark
FROM Student S
         join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId
HAVING AVG(Mark) > 15;

SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);



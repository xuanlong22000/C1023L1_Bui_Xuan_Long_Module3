use student;

SELECT * FROM Subject_ WHERE Credit = (SELECT MAX(Credit) FROM Subject);

SELECT * FROM Subject_
WHERE SubjectID IN (SELECT SubjectID FROM Marks WHERE Mark = (SELECT MAX(Mark) FROM Marks));

SELECT Students.StudentID, Students.StudentName, AVG(Marks.Mark) AS AverageMark
FROM Students
LEFT JOIN Marks ON Students.StudentID = Marks.StudentID
GROUP BY Students.StudentID, Students.StudentName
ORDER BY AverageMark DESC;


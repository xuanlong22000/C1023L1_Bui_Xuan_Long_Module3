
SELECT * FROM Students WHERE StudentName LIKE 'h%';

SELECT * FROM Classes WHERE MONTH(StartTime) = 12;

SELECT * FROM Subjects WHERE Credit BETWEEN 3 AND 5;

UPDATE Students SET ClassID = 2 WHERE StudentName = 'Hung';

SELECT StudentName, SubName, Mark FROM Marks ORDER BY Mark DESC, StudentName ASC;


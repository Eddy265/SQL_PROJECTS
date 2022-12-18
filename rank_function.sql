/*Overview of SQL RANK functions

We have the following rank functions.
    ROW_NUMBER()
    RANK()
    DENSE_RANK()
    NTILE()

In the SQL RANK functions, we use the OVER() clause to define a set of rows in the result set. 
We can also use SQL PARTITION BY clause to define a subset of data in a partition. You can also 
use Order by clause to sort the results in a descending or ascending order.

Before we explore these SQL RANK functions, let’s prepare sample data. In this sample data, we 
have exam results for three students in Maths, Science and English subjects.

CREATE THE DATABASE*/

CREATE TABLE ExamResult
(StudentName VARCHAR(70), 
 Subject     VARCHAR(20), 
 Marks       INT
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'Maths', 
 65
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'Science', 
 80
);
INSERT INTO ExamResult
VALUES
('Lily', 
 'english', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Maths', 
 50
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'Science', 
 70
);
INSERT INTO ExamResult
VALUES
('Isabella', 
 'english', 
 90
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Maths', 
 55
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'Science', 
 60
);
INSERT INTO ExamResult
VALUES
('Olivia', 
 'english', 
 89
);


/*RANK()
    Partition*/

SELECT Studentname, 
       Subject, 
       Marks, 
       RANK() OVER(PARTITION BY Studentname ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY Studentname;

    --without partition
SELECT Studentname, 
       Subject, 
       Marks, 
       RANK() OVER(ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY Rank;

--Dense_Rank()
SELECT Studentname, 
       Subject, 
       Marks, 
       Dense_RANK() OVER(ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY Rank;


--Let’s use DENSE_RANK function in combination with the SQL PARTITION BY clause.
SELECT Studentname, 
       Subject, 
       Marks, 
       DENSE_RANK() OVER(PARTITION BY Subject ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY Studentname, 
         Rank;

Update Examresult set Marks=70 where Studentname='Isabella' and Subject='Maths'

--spot the difference between rank() and Dense_Rank()
--Rank()
SELECT Studentname, 
       Subject, 
       Marks, 
       RANK() OVER(PARTITION BY StudentName ORDER BY Marks ) Rank
FROM ExamResult
ORDER BY Studentname;
         

--Dense_Rank()
SELECT Studentname, 
       Subject, 
       Marks, 
       DENSE_RANK() OVER(PARTITION BY StudentName ORDER BY Marks ) Rank
FROM ExamResult
ORDER BY Studentname;


--ROW NUMBER()
--with order by
SELECT Studentname, 
       Subject, 
       Marks, 
       ROW_NUMBER() OVER(ORDER BY Marks) RowNumber
FROM ExamResult;

--without order by
SELECT Studentname, 
       Subject, 
       Marks, 
       ROW_NUMBER() over() RowNumber
FROM ExamResult;

--NTILE(N)
SELECT *, 
       NTILE(3) OVER (ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY rank;

--We can use SQL PARTITION BY clause to have more than one partition. In the following query, 
--each partition on subjects is divided into two groups.
SELECT *, 
       NTILE(2) OVER(PARTITION  BY subject ORDER BY Marks DESC) Rank
FROM ExamResult
ORDER BY subject, rank;


/*Practical usage of SQL RANK functions

Suppose we want to get the data of the students from ranks 1 to 3. In the following query, 
we use common table expressions(CTE) to get data using ROW_NUMBER() function and later filtered 
the result from CTE to satisfy our condition.*/

WITH StudentRanks AS
(
  SELECT *, ROW_NUMBER() OVER( ORDER BY Marks Desc) AS Ranks
  FROM ExamResult
)
 
SELECT StudentName , Marks, Subject, Ranks
FROM StudentRanks
WHERE Ranks >= 1 and Ranks <=3
ORDER BY Ranks

--We can use the OFFSET FETCH command starting from SQL Server 2012 to fetch a specific number of records.
WITH StudentRanks AS
(
  SELECT *, ROW_NUMBER() OVER( ORDER BY Marks desc) AS Ranks
  FROM ExamResult
)
 
SELECT StudentName , Marks, Subject, ranks 
FROM StudentRanks
ORDER BY Ranks OFFSET 1 ROWS FETCH NEXT 4 ROWS ONLY;

----

WITH StudentRanks AS
(
  SELECT *, ROW_NUMBER() OVER( ORDER BY Marks desc) AS Ranks
  FROM ExamResult
)
 
SELECT StudentName , Marks, Subject, ranks 
FROM StudentRanks
ORDER BY Ranks FETCH NEXT 4 ROWS ONLY;


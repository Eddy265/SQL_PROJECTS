/* Student Attendance Tracking Function
This function is used to track the attendance of students in a data analytics bootcamp. The function is written in plpgsql and creates a function named "attendance".
Functionality
The function reads a text file containing names of students who are present in the class. The function then checks each name in the text file against the names in the "students" table in the database. If a name matches, the function inserts a record in the "attendance" table with the date and "present" as the attendance status. If a name doesn't match, the function inserts a record with the date and "absent" as the attendance status.
Input
The function reads a text file containing the names of students who are present. The path to this file is hardcoded in the function and can be changed as per the requirement.
Output
The function returns a list of students whose attendance was marked as present in the "attendance" table.
Limitations
The function assumes that the names in the text file and the "students" table are exactly the same. Any mismatch in the names will result in incorrect attendance tracking.
Usage
To use this function, call it by its name "attendance()" and it will return a list of students whose attendance was marked as present.
Example
SELECT * FROM attendance();
Additional Information
This function can be scheduled to run automatically using pgAgent or any other scheduling tool.*/


CREATE OR REPLACE FUNCTION attendance() 
RETURNS SETOF students AS
$$
DECLARE
  present text[] := array(SELECT regexp_split_to_table(pg_read_file('C:/Users/euzoe/Downloads/name2.txt'), ',\s+')) AS name;
  attendance_date DATE := NOW()::DATE; 
  student_attendance RECORD;
BEGIN
  FOR student_attendance IN SELECT DISTINCT id, name, email FROM students WHERE name LIKE ANY(present) LOOP
    INSERT INTO attendance (student_id, name, email, date, attend_status)
    VALUES (student_attendance.id, student_attendance.name, student_attendance.email, attendance_date, 'present')
    ON CONFLICT (student_id, date) DO UPDATE SET attend_status = 'present';
  END LOOP;

  FOR student_attendance IN SELECT DISTINCT id, name, email FROM students WHERE name NOT LIKE ANY(present) LOOP
    INSERT INTO attendance (student_id, name, email, date, attend_status)
    VALUES (student_attendance.id, student_attendance.name, student_attendance.email, attendance_date, 'absent')
    ON CONFLICT (student_id, date) DO NOTHING;
  END LOOP;

  RETURN QUERY SELECT * FROM students WHERE name LIKE ANY(present);
END;
$$ LANGUAGE plpgsql;

--------

SELECT * FROM attendance();

--filter student attendance for the current date
SELECT name, attend_status, date FROM attendance 
WHERE date = current_date --INTERVAL '1 day'
ORDER BY attend_status DESC;

--read the txt file
SELECT regexp_split_to_table(pg_read_file('C:/Users/euzoe/Downloads/name2.txt'), ',') AS name;


--Check for those absent for more than 2 days
--with the dates as rows
SELECT name, string_agg(date::text, ', ') AS absent_dates
FROM attendance
WHERE attend_status = 'absent'
GROUP BY name
HAVING COUNT(DISTINCT date) > 2
order by MIN(date) ASC;


--with the dates absent as the columns
SELECT name,
    MAX(CASE WHEN date = '2023-03-10' THEN attend_status ELSE NULL END) AS "2023-03-10",
    MAX(CASE WHEN date = '2023-03-14' THEN attend_status ELSE NULL END) AS "2023-03-14",
    MAX(CASE WHEN date = '2023-03-16' THEN attend_status ELSE NULL END) AS "2023-03-16"
FROM attendance
WHERE attend_status = 'absent'
GROUP BY name
HAVING COUNT(DISTINCT date) > 2
ORDER BY MIN(date) ASC;

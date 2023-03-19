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

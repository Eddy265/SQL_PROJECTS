# Student Attendance Tracking Function
This function is used to track the attendance of students in a data analytics bootcamp. The function is written in plpgsql and creates a function named "attendance".
Functionality
The function reads a text file containing names of students who are present in the class. The function then checks each name in the text file against the names in the 
"students" table in the database. If a name matches, the function inserts a record in the "attendance" table with the date and "present" as the attendance status. 
If a name doesn't match, the function inserts a record with the date and "absent" as the attendance status.

Input
The function reads a text file containing the names of students who are present. The path to this file is hardcoded in the function and can be changed as per the 
requirement.

Output
The function returns a list of students whose attendance was marked as present in the "attendance" table.
Limitations
The function assumes that the names in the text file and the "students" table are exactly the same. Any mismatch in the names will result in incorrect attendance 
tracking.

Usage
To use this function, call it by its name "attendance()" and it will return a list of students whose attendance was marked as present.
Example

SELECT * FROM attendance();

Additional Information
This function can be scheduled to run automatically using pgAgent or any other scheduling tool.*/

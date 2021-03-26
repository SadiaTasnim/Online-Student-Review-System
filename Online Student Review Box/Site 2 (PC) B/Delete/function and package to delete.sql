SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
---------package created to delete from Student and Employee
CREATE OR REPLACE PACKAGE DeleteSite2 AS
	FUNCTION Delete_Student(student_id IN Student.StudentID%TYPE)
	RETURN NUMBER;
	FUNCTION Delete_Employee(employee_id IN Employee.EmployeeID%TYPE)
	RETURN NUMBER;
	FUNCTION Delete_Feedback(feedback_id IN Feedback_Details.FeedbackID%TYPE)
	RETURN NUMBER;
END DeleteSite2;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY DeleteSite2 AS
	
    ----function to delete from student table
	
	FUNCTION Delete_Student(student_id IN Student.StudentID%TYPE)
	RETURN NUMBER
	IS
	BEGIN
        Delete from Student where StudentID = student_id ;
		Delete from Student@Site1 where StudentID = student_id ;
		RETURN 1;
	END Delete_Student;

	
	----function to delete from employee table
	
	FUNCTION Delete_Employee(employee_id IN Employee.EmployeeID%TYPE)
	RETURN NUMBER
	IS
	BEGIN
		Delete from Employee where EmployeeID = employee_id ;
		Delete from Employee@Site1 where EmployeeID = employee_id ;
		RETURN 1;
	END Delete_Employee;
	
	----function to delete feedback
	
	FUNCTION Delete_Feedback(feedback_id IN Feedback_Details.FeedbackID%TYPE)
	RETURN NUMBER
	IS
	BEGIN
		Delete from Feedback where FeedbackID = feedback_id ;
		Delete from Feedback_Details where FeedbackID = feedback_id ;
		Delete from Feedback@Site1 where FeedbackID = feedback_id ;
		Delete from Feedback_Details@Site1 where FeedbackID = feedback_id ;
		RETURN 1;
	END Delete_Feedback;

END DeleteSite2;
/



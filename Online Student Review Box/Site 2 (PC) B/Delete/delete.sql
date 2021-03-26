SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
---------package created to delete from Student and Employee
CREATE OR REPLACE PACKAGE DeleteSite2 AS
	PROCEDURE Delete_Student(student_id IN Student.StudentID%TYPE);
	PROCEDURE Delete_Employee(employee_id IN Employee.EmployeeID%TYPE);
	PROCEDURE Delete_Feedback(feedback_id IN Feedback_Details.FeedbackID%TYPE);
END DeleteSite2;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY DeleteSite2 AS
	
    ----procedure for delete in student table
	
	PROCEDURE Delete_Student(student_id IN Student.StudentID%TYPE)
	IS
	BEGIN
	    DBMS_OUTPUT.PUT_LINE('Student');
        Delete from Student where StudentID = student_id ;
	END Delete_Student;

	
	----procedure for delete in Employee table
	
	PROCEDURE Delete_Employee(employee_id IN Employee.EmployeeID%TYPE)
	IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Employee');
		Delete from Employee where EmployeeID = employee_id ;
	END Delete_Employee;
	
	----procedure to delete feedback 
	
	PROCEDURE Delete_Feedback(feedback_id IN Feedback_Details.FeedbackID%TYPE)
	IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Feedback');
		Delete from Feedback where FeedbackID = feedback_id ;
		Delete from Feedback_Details where FeedbackID = feedback_id ;
	END Delete_Feedback;

END DeleteSite2;
/

-------main

DECLARE
	
BEGIN
	DeleteSite2.Delete_Student('M20');
	DeleteSite2.Delete_Employee('M20');
	DeleteSite2.Delete_Feedback('M21');
END;
/
SET SERVEROUTPUT ON;
SET VERIFY OFF;
---------package created to delete from Student and Employee
CREATE OR REPLACE PACKAGE DeleteCite1 AS
	PROCEDURE Delete_Student(student_id IN Student.StudentID%TYPE);
	PROCEDURE Delete_Employee(employee_id IN Employee.EmployeeID%TYPE);
END DeleteCite1;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY DeleteCite1 AS
	
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

END DeleteCite1;
/

-------main

DECLARE
	
BEGIN
	DeleteCite1.Delete_Student('M20');
	DeleteCite1.Delete_Employee('M20');
END;
/
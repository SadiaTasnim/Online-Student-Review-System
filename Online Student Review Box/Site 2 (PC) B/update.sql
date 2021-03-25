SET SERVEROUTPUT ON;
SET VERIFY OFF;
---------package created to delete from Student and Employee
CREATE OR REPLACE PACKAGE UpdateSite2 AS
	PROCEDURE Update_Student(student_id IN Student.StudentID%TYPE);
	PROCEDURE Update_Employee(employee_id IN Employee.EmployeeID%TYPE);
END UpdateSite2;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY UpdateSite2 AS
	
    ----procedure for delete in student table
	
	PROCEDURE Update_Student(student_id IN Student.StudentID%TYPE)
	IS
	BEGIN
	    DBMS_OUTPUT.PUT_LINE('Student');
        
	END Update_Student;

	
	----procedure for delete in Employee table
	
	PROCEDURE Update_Employee(employee_id IN Employee.EmployeeID%TYPE)
	IS
	BEGIN
		DBMS_OUTPUT.PUT_LINE('Employee');
		
	END Update_Employee;
	


END UpdateSite2;
/

-------main

DECLARE
	
BEGIN
	UpdateSite2.Update_Student('M20');
	UpdateSite2.Update_Employee('M20');

END;
/
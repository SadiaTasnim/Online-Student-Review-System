SET SERVEROUTPUT ON;
SET VERIFY OFF;
---------package created to delete from Student and Employee
CREATE OR REPLACE PACKAGE UpdateCite1 AS
	PROCEDURE Update_Student(student_id IN Student.StudentID%TYPE);
	PROCEDURE Update_Employee(employee_id IN Employee.EmployeeID%TYPE);
END UpdateCite1;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY UpdateCite1 AS
	
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
	


END UpdateCite1;
/

-------main

DECLARE
	
BEGIN
	UpdateCite1.Update_Student('M20');
	UpdateCite1.Update_Employee('M20');

END;
/
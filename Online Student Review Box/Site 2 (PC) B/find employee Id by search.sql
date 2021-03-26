SET SERVEROUTPUT ON;
SET VERIFY OFF;
select * from Employee;

CREATE OR REPLACE VIEW All_Employee AS
SELECT * FROM Employee UNION  SELECT * FROM Employee@Site1;


/*Package*/
CREATE OR REPLACE PACKAGE show_employee_Id AS
	PROCEDURE show_Employee;
END show_employee_Id;
/

/*Package Body*/

CREATE OR REPLACE PACKAGE BODY show_employee_Id AS
	PROCEDURE show_Employee
	IS
	employee_id        Employee.EmployeeID%TYPE ;
	name               Employee.Emp_Name%TYPE :='&Name';
	designation        Employee.Emp_Designation%TYPE :='&Designation' ;
	emp_shift          Employee.Emp_Shift%TYPE ;
	emp_branch         Employee.Emp_Branch%TYPE ;
	emp_email          Employee.Emp_Email%TYPE ;
	row_no INT ;
	BEGIN
	   	FOR R IN (SELECT * FROM All_Employee WHERE Emp_Name LIKE '%' || INITCAP(name) || '%' AND Emp_Designation LIKE '%' || INITCAP(designation) || '%'  ) LOOP
	     	DBMS_OUTPUT.PUT_LINE('-------------- ');
		 	DBMS_OUTPUT.PUT_LINE('Employee ID: '||R.EmployeeID);
			DBMS_OUTPUT.PUT_LINE('Name: ' || R.Emp_Name);
			DBMS_OUTPUT.PUT_LINE('Designation: ' || R.Emp_Designation);
			DBMS_OUTPUT.PUT_LINE('Branch: ' || R.Emp_Branch ||'('|| R.Emp_Shift||')');
			DBMS_OUTPUT.PUT_LINE('Email Address: ' || R.Emp_Email);
        END LOOP;
		
	END show_Employee;
	
END show_employee_Id;
/
DECLARE
BEGIN
   show_employee_Id.show_Employee;
END;
/
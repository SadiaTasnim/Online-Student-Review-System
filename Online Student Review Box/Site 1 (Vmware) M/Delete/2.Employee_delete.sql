SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
CREATE OR REPLACE VIEW All_Employee AS
SELECT * FROM Employee UNION  SELECT * FROM Employee@Site2;
--show all Employee
SELECT * FROM All_Employee;

DECLARE
	catch            number ;
	row_no           number ;
	employee_id      Employee.EmployeeID%TYPE :='&Employee_ID';
BEGIN
    employee_id := UPPER(employee_id);
	SELECT COUNT(EmployeeID) INTO row_no FROM All_Employee WHERE EmployeeID = employee_id;
	IF row_no>0 THEN
	   catch := DeleteSite1.Delete_Employee(employee_id);
	ELSE
	    DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
	    DBMS_OUTPUT.PUT_LINE('Please Enter a valid ID');
		DBMS_OUTPUT.PUT_LINE('----------------------------------');
	END IF;
END;
/

--SELECT * FROM Employee UNION  SELECT * FROM Employee@Site2;
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
DECLARE
	emp_name           Employee.Emp_Name%TYPE :='&Name';
	designation        Employee.Emp_Designation%TYPE :='&Designation' ;
	emp_shift          Employee.Emp_Shift%TYPE :='&Shift';
	emp_branch         Employee.Emp_Branch%TYPE :='&Branch';
	emp_email          Employee.Emp_Email%TYPE :='&Email' ;
    total_m            NUMBER;
	total_b            NUMBER;
BEGIN

    emp_branch := INITCAP(emp_branch);
	
	total_m := branchname_check.check_motijheel(emp_branch);
	total_b := branchname_check.check_banasree(emp_branch);
	
	/*Check if Motijheel or Banasree*/
	IF total_m = 1 and total_b = 0 THEN
	   emp_branch:='Motijheel';
	ELSIF total_m = 0 and total_b = 1 THEN
	   emp_branch:='Banasree';   
	END IF;
	
	InsertSite2.Insert_Employee(INITCAP(emp_name),INITCAP(designation),INITCAP(emp_shift),INITCAP(emp_branch),emp_email);
END;
/

--SELECT * FROM Employee UNION  SELECT * FROM Employee@Site1;

commit;
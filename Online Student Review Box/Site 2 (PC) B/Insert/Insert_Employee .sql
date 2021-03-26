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
    contain_m          VARCHAR2(10);
	contain_b          VARCHAR2(10);
BEGIN

    emp_branch := INITCAP(emp_branch);
	
	select REGEXP_SUBSTR(emp_branch,'Mot') into contain_m from dual;
	select REGEXP_SUBSTR(emp_branch,'Ban') into contain_b from dual;
	
	/*Check if Motijheel or Banasree*/
	IF contain_m='Mot' THEN
	   emp_branch:='Motijheel';
	ELSIF contain_b='Ban' THEN
	   emp_branch:='Banasree';
	END IF;
	
	InsertSite2.Insert_Employee(INITCAP(emp_name),INITCAP(designation),INITCAP(emp_shift),INITCAP(emp_branch),emp_email);
END;
/

--SELECT * FROM Employee UNION  SELECT * FROM Employee@Site1;

@"F:\GITHUB\Online-Student-Review-System\Online Student Review Box\Site 2 (PC) B\Insert\Functions_And_packages.sql"
@"F:\GITHUB\Online-Student-Review-System\Online Student Review Box\Site 2 (PC) B\trigger.sql"
commit;
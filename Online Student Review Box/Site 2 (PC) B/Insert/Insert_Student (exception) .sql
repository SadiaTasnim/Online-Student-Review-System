SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
DECLARE
    input_roll   varchar2(10):= '&roll';
	input_class  varchar2(10):= '&Class';
	roll         Student.std_ClassRoll%TYPE ;
	name         Student.Std_Name%TYPE := '&Name';
	class_       Student.Std_Class%TYPE ;
	sec          Student.Std_Section%TYPE := '&Section' ;
	shift        Student.Std_Shift%TYPE := '&Shift';
	branch       Student.Std_Branch%TYPE := '&Branch';
	email        Student.Std_Email%TYPE := '&Email'; 
	contain_m    VARCHAR2(10);
	contain_b    VARCHAR2(10);
BEGIN

    branch := INITCAP(branch);
	
	select REGEXP_SUBSTR(branch,'Mot') into contain_m from dual;
	select REGEXP_SUBSTR(branch,'Ban') into contain_b from dual;
	
	/*Check if Motijheel or Banasree*/
	IF contain_m='Mot' THEN
	   branch:='Motijheel';
	ELSIF contain_b='Ban' THEN
	   branch:='Banasree';
	END IF;
	
	/*Check if class and roll is integer or not*/
	roll := TO_NUMBER(input_roll);
	class_ := TO_NUMBER(input_class);
	
	InsertSite2.Insert_Student(roll,INITCAP(name),class_,UPPER(sec),INITCAP(shift),INITCAP(branch),email);
	
	EXCEPTION
		WHEN VALUE_ERROR THEN
		    DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
		    DBMS_OUTPUT.PUT_LINE('----------------------------------');
			DBMS_OUTPUT.PUT_LINE('Please Enter a valid Class Or Roll');
			DBMS_OUTPUT.PUT_LINE('----------------------------------');
	
END;
/

--SELECT * FROM Student UNION  SELECT * FROM Student@Site1;

@"F:\GITHUB\Online-Student-Review-System\Online Student Review Box\Site 2 (PC) B\Insert\Functions_And_packages.sql"
@"F:\GITHUB\Online-Student-Review-System\Online Student Review Box\Site 2 (PC) B\trigger.sql"

commit;
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
	total_m      NUMBER;
	total_b      NUMBER;
BEGIN

    branch := INITCAP(branch);
	/*Check if Motijheel or Banasree*/
	total_m := branchname_check.check_motijheel(branch);
	total_b := branchname_check.check_banasree(branch);

	IF total_m = 1 and total_b = 0 THEN
	   branch:='Motijheel';
	ELSIF total_m = 0 and total_b = 1 THEN
	   branch:='Banasree';   
	END IF;
	
	/*Check if class and roll is integer or not*/
	roll := TO_NUMBER(input_roll);
	class_ := TO_NUMBER(input_class);
	
	InsertSite1.Insert_Student(roll,INITCAP(name),class_,UPPER(sec),INITCAP(shift),INITCAP(branch),email);
	
	EXCEPTION
		WHEN VALUE_ERROR THEN
		    DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
		    DBMS_OUTPUT.PUT_LINE('----------------------------------');
			DBMS_OUTPUT.PUT_LINE('Please Enter a valid Class Or Roll');
			DBMS_OUTPUT.PUT_LINE('----------------------------------');
	
END;
/

--SELECT * FROM Student UNION  SELECT * FROM Student@Site2;

commit;
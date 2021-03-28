SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;

/*Student Table*/
CREATE OR REPLACE VIEW All_Student AS
SELECT * FROM Student UNION  SELECT * FROM Student@Site1;
commit;

DECLARE
    input_roll            varchar2(10):= '&roll';
	input_class           varchar2(10):= '&Class';
	feedback_std_roll     Feedback_Details.std_ClassRoll%TYPE ;
	feedback_std_class    Feedback_Details.Std_Class%TYPE ;
	feedback_std_sec      Feedback_Details.Std_Section%TYPE :='&Section';
	feedback_emp_id       Feedback_Details.EmployeeID%TYPE :='&Employee_ID';
	feedback_std_branch   Feedback_Details.Branch%TYPE :='&Branch';
	feedback_review       Feedback.Review%TYPE :='&Review';
    total_m               NUMBER;
	total_b               NUMBER;
	row_no                INT;
BEGIN

    feedback_std_branch := INITCAP(feedback_std_branch);
	
	total_m := branchname_check.check_motijheel(feedback_std_branch);
	total_b := branchname_check.check_banasree(feedback_std_branch);
	
	/*Check if Motijheel or Banasree*/
	IF total_m = 1 and total_b = 0 THEN
	   feedback_std_branch:='Motijheel';
	ELSIF total_m = 0 and total_b = 1 THEN
	   feedback_std_branch:='Banasree';
	END IF;
	
	/*Check if class and roll is integer or not*/
	feedback_std_roll := TO_NUMBER(input_roll);
	feedback_std_class := TO_NUMBER(input_class);

	/* Check if the student if in database or not */
	SELECT COUNT(*) INTO row_no FROM All_Student where std_ClassRoll = feedback_std_roll AND Std_Class = feedback_std_class AND
                                                       Std_Section = UPPER(feedback_std_sec)AND Std_Branch = feedback_std_branch ;

	IF row_no >0 THEN 
	  InsertSite2.Insert_Feedback(feedback_std_roll,feedback_std_class,UPPER(feedback_std_sec),UPPER(feedback_emp_id),INITCAP(feedback_std_branch),feedback_review);
    ELSE
	        DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
		    DBMS_OUTPUT.PUT_LINE('----------------------------------');
			DBMS_OUTPUT.PUT_LINE('Please Enter valid information.');
			DBMS_OUTPUT.PUT_LINE('----------------------------------');
	END IF;
	 
	EXCEPTION
		WHEN VALUE_ERROR THEN
		    DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
		    DBMS_OUTPUT.PUT_LINE('----------------------------------');
			DBMS_OUTPUT.PUT_LINE('Please Enter a valid Class Or Roll');
			DBMS_OUTPUT.PUT_LINE('----------------------------------');
END;
/

--SELECT * FROM Feedback UNION  SELECT * FROM Feedback@Site1;

commit;
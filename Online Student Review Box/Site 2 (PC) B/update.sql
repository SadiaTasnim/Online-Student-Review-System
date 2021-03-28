SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;

/*Student Table*/
CREATE OR REPLACE VIEW All_Student AS
SELECT * FROM Student UNION  SELECT * FROM Student@Site1;

---------package created for insert in Student and Employee
CREATE OR REPLACE PACKAGE UpdateSite2 AS
	PROCEDURE Update_Student(student_id IN Student.StudentID%TYPE,roll IN Student.std_ClassRoll%TYPE ,name IN Student.Std_Name%TYPE ,
							class_ IN Student.Std_Class%TYPE ,sec IN Student.Std_Section%TYPE ,
							email IN Student.Std_Email%TYPE);
END UpdateSite2;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY UpdateSite2 AS
	
    ----function to insert in student table
	
	PROCEDURE Update_Student(student_id IN Student.StudentID%TYPE,roll IN Student.std_ClassRoll%TYPE ,name IN Student.Std_Name%TYPE ,
							class_ IN Student.Std_Class%TYPE ,sec IN Student.Std_Section%TYPE ,
							email IN Student.Std_Email%TYPE)
	IS
	row_no INT ;
	row_no2 INT ;
	BEGIN
		
	   SELECT COUNT(StudentID) INTO row_no FROM Student WHERE StudentID = student_id ;
	   SELECT COUNT(StudentID) INTO row_no2 FROM Student@Site1 WHERE StudentID = student_id;
	   IF row_no > 0 THEN
			UPDATE Student SET std_ClassRoll = roll, Std_Name = name, Std_Class= class_ ,Std_Section=sec,
            Std_Email=email WHERE StudentID = student_id;
	   ELSIF row_no2 >0 THEN
			UPDATE Student@Site1 SET std_ClassRoll = roll, Std_Name = name, Std_Class= class_ ,Std_Section=sec,
            Std_Email=email WHERE StudentID = student_id;
	   ELSE
	        DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
		    DBMS_OUTPUT.PUT_LINE('----------------------------------');
			DBMS_OUTPUT.PUT_LINE('Please Enter a valid ID');
		    DBMS_OUTPUT.PUT_LINE('----------------------------------');
	   END IF;
	END Update_Student;

END UpdateSite2;
/


/* Search student */

DECLARE
 
	name         Student.Std_Name%TYPE := '&Name';
	roll         Student.std_ClassRoll%TYPE:= '&Roll';
	class_       Student.Std_Class%TYPE:= '&Class';
	sec          Student.Std_Section%TYPE := '&Section' ;
	email        Student.Std_Email%TYPE := '&Email'; 
	
BEGIN
	FOR R IN (SELECT * FROM All_Student WHERE  Std_Name LIKE '%' ||INITCAP(name)|| '%' AND
                                               std_ClassRoll LIKE '%' || roll || '%' AND 
	                                           Std_Class LIKE '%' ||class_|| '%' AND
										       Std_Section LIKE '%' ||UPPER(sec)|| '%' AND
	                                           Std_Email LIKE '%' ||email|| '%')LOOP
	     	DBMS_OUTPUT.PUT_LINE('---------------------');
			DBMS_OUTPUT.PUT_LINE('Student ID :  ' || R.StudentID);
			DBMS_OUTPUT.PUT_LINE('Name       :  ' || R.Std_Name);
			DBMS_OUTPUT.PUT_LINE('Roll       :  ' || R.std_ClassRoll);
			DBMS_OUTPUT.PUT_LINE('Class      :  ' || R.Std_Class);
			DBMS_OUTPUT.PUT_LINE('Sec        :  ' || R.Std_Section);
			DBMS_OUTPUT.PUT_LINE('Email      :  ' || R.Std_Email);
    END LOOP;
	
END;
/ 


/* Update */

DECLARE
    student_id   Student.StudentID%TYPE := '&ID';
    input_roll   varchar2(10):= '&roll';
	name         Student.Std_Name%TYPE := '&Name';
	input_class  varchar2(10):= '&Class';
	roll         Student.std_ClassRoll%TYPE;
	class_       Student.Std_Class%TYPE;
	sec          Student.Std_Section%TYPE := '&Section' ;
	shift        Student.Std_Shift%TYPE ;
	branch       Student.Std_Branch%TYPE ;
	email        Student.Std_Email%TYPE := '&Email'; 

BEGIN

    branch := INITCAP(branch);
	student_id := UPPER(student_id);

	/*Check if class and roll is integer or not*/
	roll := TO_NUMBER(input_roll);
	class_ := TO_NUMBER(input_class);
	
	UpdateSite2.Update_Student(student_id,roll,INITCAP(name),class_,UPPER(sec),email);
	
	EXCEPTION
		WHEN VALUE_ERROR THEN
		    DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
		    DBMS_OUTPUT.PUT_LINE('----------------------------------');
			DBMS_OUTPUT.PUT_LINE('Please Enter a valid Class Or Roll');
			DBMS_OUTPUT.PUT_LINE('----------------------------------');
END;
/
commit;

CREATE OR REPLACE VIEW All_Student AS
SELECT * FROM Student UNION  SELECT * FROM Student@Site2;
select * from All_Student;
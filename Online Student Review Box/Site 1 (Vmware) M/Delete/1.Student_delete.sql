SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
CREATE OR REPLACE VIEW All_Student AS
SELECT * FROM Student UNION  SELECT * FROM Student@Site2;
--show all student
SELECT * FROM All_Student;

DECLARE
	catch            number ;
	row_no           number ;
	student_id       Student.StudentID%TYPE :='&Student_ID';
BEGIN
    student_id := UPPER(student_id);
	SELECT COUNT(StudentID) INTO row_no FROM All_Student WHERE StudentID = student_id;
	IF row_no>0 THEN
	   catch := DeleteSite1.Delete_Student(student_id);
	ELSE
	    DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
	    DBMS_OUTPUT.PUT_LINE('Please Enter a valid ID');
		DBMS_OUTPUT.PUT_LINE('----------------------------------');
	END IF;
END;
/
--SELECT * FROM Student UNION  SELECT * FROM Student@Site2;
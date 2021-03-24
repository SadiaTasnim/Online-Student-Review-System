SET SERVEROUTPUT ON;
SET VERIFY OFF;
---------package created for insert in Student and Employee
CREATE OR REPLACE PACKAGE InsertCite1 AS
	PROCEDURE Insert_Feedback;
END InsertCite1;
/
---------Created package body
CREATE OR REPLACE PACKAGE BODY InsertCite1 AS

	----procedure for insert Feedback
	
	PROCEDURE Insert_Feedback
	IS
	feedback_id           Feedback_Details.FeedbackID%TYPE ;
	feedback_std_roll     Feedback_Details.std_ClassRoll%TYPE :='&Roll';
	feedback_std_class    Feedback_Details.Std_Class%TYPE :='&Class' ;
	feedback_std_sec      Feedback_Details.Std_Section%TYPE :='&Section';
	feedback_emp_id       Feedback_Details.EmployeeID%TYPE :='&Employee_ID';
	feedback_std_branch   Feedback_Details.Branch%TYPE ;
	feedback_date         Feedback_Details.Date_%TYPE ;
	feedback_review       Feedback.Review%TYPE :='&Review';
	row_no_ INT ;
	BEGIN

		DBMS_OUTPUT.PUT_LINE('Feedback');
	END Insert_Feedback;


END InsertCite1;
/

-------main

DECLARE
	
BEGIN
	InsertCite1.Insert_Feedback;
END;
/
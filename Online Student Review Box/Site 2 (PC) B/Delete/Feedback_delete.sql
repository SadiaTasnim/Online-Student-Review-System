SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
CREATE OR REPLACE VIEW All_Feedback AS
SELECT * FROM Feedback UNION  SELECT * FROM Feedback@Site1;
--show all Employee
SELECT * FROM All_Feedback;

DECLARE
	catch            number ;
	row_no           number ;
	feedback_id_     Feedback_Details.FeedbackID%TYPE := '&feedback_id' ;
BEGIN
    feedback_id_ := UPPER(feedback_id_);
	SELECT COUNT(FeedbackID) INTO row_no FROM All_Feedback WHERE FeedbackID = feedback_id_;
	IF row_no>0 THEN
	   catch := DeleteSite2.Delete_Feedback(feedback_id_);
	ELSE
	    DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
        DBMS_OUTPUT.PUT_LINE('----------------------------------');
	    DBMS_OUTPUT.PUT_LINE('Please Enter a valid ID');
		DBMS_OUTPUT.PUT_LINE('----------------------------------');
	END IF;
END;
/
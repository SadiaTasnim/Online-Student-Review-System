SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER Student_trigger
AFTER INSERT OR UPDATE OR DELETE
ON Student
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('--------------------------');
	DBMS_OUTPUT.PUT_LINE('Student information updated');
	DBMS_OUTPUT.PUT_LINE('--------------------------');
END;
/


CREATE OR REPLACE TRIGGER Employee_trigger
AFTER INSERT OR UPDATE OR DELETE
ON Employee
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('-----------------------------');
	DBMS_OUTPUT.PUT_LINE('Employee information updated');
	DBMS_OUTPUT.PUT_LINE('-----------------------------');
END;
/

CREATE OR REPLACE TRIGGER Feedback_trigger
AFTER INSERT OR UPDATE OR DELETE
ON Feedback
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('----------------');
	DBMS_OUTPUT.PUT_LINE('Review updated');
	DBMS_OUTPUT.PUT_LINE('-----------------');
END;
/
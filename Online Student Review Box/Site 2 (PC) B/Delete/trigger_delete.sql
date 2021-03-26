SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER Student_insert_trigger
AFTER DELETE
ON Student
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Student information deleted');
	DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
END;
/


CREATE OR REPLACE TRIGGER Employee_insert_trigger
AFTER DELETE 
ON Employee
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Employee information deleted');
	DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
END;
/

CREATE OR REPLACE TRIGGER Feedback_insert_trigger
AFTER DELETE 
ON Feedback
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Review deleted');
	DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
END;
/
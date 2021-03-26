SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER Student_insert_trigger
AFTER INSERT 
ON Student
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Student information saved in Banasree Branch');
	DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
END;
/


CREATE OR REPLACE TRIGGER Employee_insert_trigger
AFTER INSERT 
ON Employee
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Employee information saved in Banasree Branch');
	DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
END;
/

CREATE OR REPLACE TRIGGER Feedback_insert_trigger
AFTER INSERT 
ON Feedback
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
	DBMS_OUTPUT.PUT_LINE('Review saved in Banasree Branch');
	DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
END;
/
SET VERIFY OFF;
SET SERVEROUTPUT ON;
DECLARE
	enter int:=&enter;
	take int;
	take2 int;
BEGIN
    IF enter = 1 THEN
	    take :=&take;
		DBMS_OUTPUT.PUT_LINE(take);
        --InsertStudent.Insert_Student;
    ELSE
	    take2 :=&take2;
		DBMS_OUTPUT.PUT_LINE(take2);
        --InsertEmployee.Insert_Employee;
    END IF;
	
END;
/
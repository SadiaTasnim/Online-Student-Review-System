SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
---------package created for insert in Student and Employee
CREATE OR REPLACE PACKAGE Insertsite1 AS
	PROCEDURE Insert_Student(roll IN Student.std_ClassRoll%TYPE ,name IN Student.Std_Name%TYPE ,
							class_ IN Student.Std_Class%TYPE ,sec IN Student.Std_Section%TYPE ,
							shift IN Student.Std_Shift%TYPE ,branch IN Student.Std_Branch%TYPE ,
							email IN Student.Std_Email%TYPE);
							
	PROCEDURE Insert_Employee(emp_name IN Employee.Emp_Name%TYPE ,designation IN Employee.Emp_Designation%TYPE ,
                           	 emp_shift IN Employee.Emp_Shift%TYPE ,emp_branch IN Employee.Emp_Branch%TYPE ,
	                         emp_email IN Employee.Emp_Email%TYPE);
							 
	PROCEDURE Insert_Feedback(feedback_std_roll IN Feedback_Details.std_ClassRoll%TYPE ,feedback_std_class IN Feedback_Details.Std_Class%TYPE ,
	                          feedback_std_sec IN Feedback_Details.Std_Section%TYPE ,feedback_emp_id  IN Feedback_Details.EmployeeID%TYPE ,
	                          feedback_std_branch  IN Feedback_Details.Branch%TYPE ,feedback_review IN Feedback.Review%TYPE);
END Insertsite1;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY Insertsite1 AS
	
    ----function to insert in student table
	
	PROCEDURE Insert_Student(roll IN Student.std_ClassRoll%TYPE ,name IN Student.Std_Name%TYPE ,
							class_ IN Student.Std_Class%TYPE ,sec IN Student.Std_Section%TYPE ,
							shift IN Student.Std_Shift%TYPE ,branch IN Student.Std_Branch%TYPE ,
							email IN Student.Std_Email%TYPE)
	IS
	student_id   Student.StudentID%TYPE ;
	row_no INT ;
	BEGIN
		IF branch = 'Banasree' THEN
		    SELECT COUNT(*) INTO row_no FROM Student;
		    student_id := 'B' || TO_CHAR(row_no+1);
            INSERT INTO Student VALUES(student_id,roll,name,class_,sec,shift,branch,email);
			
        ELSIF branch = 'Motijheel' THEN
		    SELECT COUNT(*) INTO row_no FROM Student@site2;
		    student_id := 'M' || TO_CHAR(row_no+1);
            INSERT INTO Student@site2 VALUES(student_id,roll,name,class_,sec,shift,branch,email);
		ELSE
			DBMS_OUTPUT.PUT_LINE('--------------------------');
			DBMS_OUTPUT.PUT_LINE('Branch name incorrect : Motijheel / Banasree');
			DBMS_OUTPUT.PUT_LINE('--------------------------');
        END IF;	
	
	END Insert_Student;
	

	
	----procedure to insert in Employee table
	
	PROCEDURE Insert_Employee(emp_name IN Employee.Emp_Name%TYPE ,designation IN Employee.Emp_Designation%TYPE ,
                           	 emp_shift IN Employee.Emp_Shift%TYPE ,emp_branch IN Employee.Emp_Branch%TYPE ,
	                         emp_email IN Employee.Emp_Email%TYPE)
	IS
	employee_id  Employee.EmployeeID%TYPE ;
	row_no INT ;
	BEGIN
		IF emp_branch = 'Banasree' THEN
		    SELECT COUNT(*) INTO row_no FROM Employee;
		    employee_id := 'B' || TO_CHAR(row_no+1);
            INSERT INTO Employee VALUES(employee_id,emp_name,designation,emp_shift,emp_branch,emp_email);
		
        ELSIF emp_branch  = 'Motijheel' THEN
		    SELECT COUNT(*) INTO row_no FROM Employee@site2;
		    employee_id := 'M' || TO_CHAR(row_no+1);
            INSERT INTO Employee@site2 VALUES(employee_id,emp_name,designation,emp_shift,emp_branch,emp_email); 
		ELSE
			DBMS_OUTPUT.PUT_LINE('--------------------------');
			DBMS_OUTPUT.PUT_LINE('Branch name incorrect : Motijheel / Banasree');
			DBMS_OUTPUT.PUT_LINE('--------------------------');
        END IF; 
		
	END Insert_Employee;
	
	
	----procedure to insert Feedback
	
	PROCEDURE Insert_Feedback(feedback_std_roll IN Feedback_Details.std_ClassRoll%TYPE ,feedback_std_class IN Feedback_Details.Std_Class%TYPE ,
	                          feedback_std_sec IN Feedback_Details.Std_Section%TYPE ,feedback_emp_id  IN Feedback_Details.EmployeeID%TYPE ,
	                          feedback_std_branch  IN Feedback_Details.Branch%TYPE ,feedback_review IN Feedback.Review%TYPE)
	IS
	feedback_id     Feedback_Details.FeedbackID%TYPE ;
	feedback_date   Feedback_Details.Date_%TYPE ;
	row_no INT ;
	BEGIN	
		select sysdate into feedback_date from dual;
		
		IF feedback_std_branch = 'Banasree' THEN
		    SELECT COUNT(*) INTO row_no FROM Feedback_Details;
		    feedback_id := 'B' || TO_CHAR(row_no+1);
			INSERT INTO Feedback_Details VALUES(feedback_id,feedback_std_roll,feedback_std_class,feedback_std_sec,feedback_emp_id,feedback_std_branch,feedback_date);
		    INSERT INTO Feedback VALUES(feedback_id,feedback_review);
           
        ELSIF feedback_std_branch = 'Motijheel' THEN
		    SELECT COUNT(*) INTO row_no FROM Feedback_Details@site2;
		    feedback_id := 'M' || TO_CHAR(row_no+1);
			INSERT INTO Feedback_Details@site2 VALUES(feedback_id,feedback_std_roll,feedback_std_class,feedback_std_sec,feedback_emp_id,feedback_std_branch,feedback_date);
		    INSERT INTO Feedback@site2 VALUES(feedback_id,feedback_review);
        ELSE
			DBMS_OUTPUT.PUT_LINE('--------------------------');
			DBMS_OUTPUT.PUT_LINE('Branch name incorrect : Motijheel / Banasree');
			DBMS_OUTPUT.PUT_LINE('--------------------------');   
        END IF;			
	END Insert_Feedback;


END Insertsite1;
/


/*check branch name*/

CREATE OR REPLACE PACKAGE branchname_check AS
	FUNCTION check_motijheel(branch IN Student.Std_Branch%TYPE )
	RETURN NUMBER;
	FUNCTION check_banasree(branch IN Student.Std_Branch%TYPE )
	RETURN NUMBER;
END branchname_check;
/


CREATE OR REPLACE PACKAGE BODY branchname_check AS
	FUNCTION check_motijheel(branch IN Student.Std_Branch%TYPE)
	RETURN NUMBER
	IS
    m varchar2(2);
	total_m INT;
	BEGIN
		total_m:=0;
	    select REGEXP_SUBSTR(branch,'M') into m from dual;
		IF m = 'M' THEN total_m := total_m + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'o') into m from dual;
		IF m = 'o' THEN total_m := total_m + 1; END IF;
	    
		select REGEXP_SUBSTR(branch,'t') into m from dual;
		IF m = 't' THEN total_m := total_m + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'i') into m from dual;
		IF m = 'i' THEN total_m := total_m + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'j') into m from dual;
		IF m = 'j' THEN total_m := total_m + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'h') into m from dual;
		IF m = 'h' THEN total_m := total_m + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'e') into m from dual;
		IF m = 'e' THEN total_m := total_m + 1; END IF;
	    
		select REGEXP_SUBSTR(branch,'l') into m from dual;
		IF m = 'l' THEN total_m := total_m + 1; END IF;
		
		IF total_m >= 5 THEN 
		    RETURN 1;
		ELSE RETURN 0;
		END IF;
		
		
	END check_motijheel;
	
	
	FUNCTION check_banasree(branch IN Student.Std_Branch%TYPE)
	RETURN NUMBER
	IS
    m varchar2(2);
	total_b INT;
	BEGIN
		total_b:=0;
	    select REGEXP_SUBSTR(branch,'B') into m from dual;
		IF m = 'B' THEN total_b := total_b + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'a') into m from dual;
		IF m = 'a' THEN total_b := total_b + 1; END IF;
	    
		select REGEXP_SUBSTR(branch,'n') into m from dual;
		IF m = 'n' THEN total_b := total_b + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'a') into m from dual;
		IF m = 'a' THEN total_b := total_b + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'s') into m from dual;
		IF m = 's' THEN total_b := total_b + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'r') into m from dual;
		IF m = 'r' THEN total_b := total_b + 1; END IF;
		
		select REGEXP_SUBSTR(branch,'e') into m from dual;
		IF m = 'e' THEN total_b := total_b + 1; END IF;
	    

		
		IF total_b>=4 THEN 
		    RETURN 1;
		ELSE RETURN 0;
		END IF;
		
		
	END check_banasree;
	
	
	

END branchname_check;
/


/*
DECLARE
	total_m NUMBER;
	total_b NUMBER;
BEGIN
    total_m := branchname_check.check_motijheel('motejil');
	total_b := branchname_check.check_banasree('onosri');
	DBMS_OUTPUT.PUT_LINE(total_m);
	DBMS_OUTPUT.PUT_LINE(total_b);
END;
/

*/
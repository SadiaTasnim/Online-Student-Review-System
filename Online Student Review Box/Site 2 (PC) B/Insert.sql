SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
---------package created for insert in Student and Employee
CREATE OR REPLACE PACKAGE InsertSite2 AS
	PROCEDURE Insert_Student;
	PROCEDURE Insert_Employee;
	PROCEDURE Insert_Feedback;
END InsertSite2;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY InsertSite2 AS
	
    ----procedure for insert in student table
	
	PROCEDURE Insert_Student
	IS
	student_id   Student.StudentID%TYPE ;
	roll         Student.std_ClassRoll%TYPE := &roll;
	name         Student.Std_Name%TYPE := '&Name';
	class_       Student.Std_Class%TYPE := &Class_;
	sec          Student.Std_Section%TYPE := '&Section' ;
	shift        Student.Std_Shift%TYPE := '&Shift';
	branch       Student.Std_Branch%TYPE := '&Branch';
	email        Student.Std_Email%TYPE := '&Email'; 
	row_no INT ;
	
	BEGIN
		IF branch = 'Banasree' THEN
		    SELECT COUNT(*) INTO row_no FROM Student;
		    student_id := 'B' || TO_CHAR(row_no+1);
            INSERT INTO Student VALUES(student_id,roll,name,class_,sec,shift,branch,email);
			
        ELSIF branch = 'Motijheel' THEN
		    SELECT COUNT(*) INTO row_no FROM Student@site1;
		    student_id := 'M' || TO_CHAR(row_no+1);
            INSERT INTO Student@site1 VALUES(student_id,roll,name,class_,sec,shift,branch,email);
			
		ELSE
		    DBMS_OUTPUT.PUT_LINE('Branch Name Incorrect');
        END IF;	
	
	END Insert_Student;
	

	
	----procedure for insert in Employee table
	
	PROCEDURE Insert_Employee
	IS
	employee_id        Employee.EmployeeID%TYPE ;
	emp_name           Employee.Emp_Name%TYPE :='&Name';
	designation        Employee.Emp_Designation%TYPE :='&Designation' ;
	emp_shift          Employee.Emp_Shift%TYPE :='&Shift';
	emp_branch         Employee.Emp_Branch%TYPE :='&Branch';
	emp_email          Employee.Emp_Email%TYPE :='&Email' ;
	row_no INT ;
	BEGIN
		IF emp_branch = 'Banasree' THEN
		    SELECT COUNT(*) INTO row_no FROM Employee;
		    employee_id := 'B' || TO_CHAR(row_no+1);
            INSERT INTO Employee VALUES(employee_id,emp_name,designation,emp_shift,emp_branch,emp_email);
		
        ELSIF emp_branch  = 'Motijheel' THEN
		    SELECT COUNT(*) INTO row_no FROM Employee@site1;
		    employee_id := 'M' || TO_CHAR(row_no+1);
            INSERT INTO Employee@site1 VALUES(employee_id,emp_name,designation,emp_shift,emp_branch,emp_email); 
		ELSE
		    DBMS_OUTPUT.PUT_LINE('Branch Name Incorrect');  
        END IF; 
		
	END Insert_Employee;
	
	
	----procedure for insert Feedback
	
	PROCEDURE Insert_Feedback
	IS
	feedback_id           Feedback_Details.FeedbackID%TYPE ;
	feedback_std_roll     Feedback_Details.std_ClassRoll%TYPE :='&Roll';
	feedback_std_class    Feedback_Details.Std_Class%TYPE :='&Class' ;
	feedback_std_sec      Feedback_Details.Std_Section%TYPE :='&Section';
	feedback_emp_id       Feedback_Details.EmployeeID%TYPE :='&Employee_ID';
	feedback_std_branch   Feedback_Details.Branch%TYPE :='&Branch';
	feedback_date         Feedback_Details.Date_%TYPE ;
	feedback_review       Feedback.Review%TYPE :='&Review';
	row_no INT ;
	BEGIN	
		select sysdate into feedback_date from dual;
		
		IF feedback_std_branch = 'Banasree' THEN
		    SELECT COUNT(*) INTO row_no FROM Feedback_Details;
		    feedback_id := 'B' || TO_CHAR(row_no+1);
			INSERT INTO Feedback_Details VALUES(feedback_id,feedback_std_roll,feedback_std_class,feedback_std_sec,feedback_emp_id,feedback_std_branch,feedback_date);
		    INSERT INTO Feedback VALUES(feedback_id,feedback_review);
           
        ELSIF feedback_std_branch = 'Motijheel' THEN
		    SELECT COUNT(*) INTO row_no FROM Feedback_Details@site1;
		    feedback_id := 'M' || TO_CHAR(row_no+1);
			INSERT INTO Feedback_Details@site1 VALUES(feedback_id,feedback_std_roll,feedback_std_class,feedback_std_sec,feedback_emp_id,feedback_std_branch,feedback_date);
		    INSERT INTO Feedback@site1 VALUES(feedback_id,feedback_review);
            
		ELSE
		    DBMS_OUTPUT.PUT_LINE('Branch Name Incorrect');
        END IF;			
	END Insert_Feedback;


END InsertSite2;
/

-------main

DECLARE
	
BEGIN
	InsertSite2.Insert_Student;
	InsertSite2.Insert_Employee;
	InsertSite2.Insert_Feedback;
END;
/
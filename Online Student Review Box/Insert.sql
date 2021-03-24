SET SERVEROUTPUT ON;
SET VERIFY OFF;
---------package created for insert in Student and Employee
CREATE OR REPLACE PACKAGE InsertCite1 AS
	PROCEDURE Insert_Student;
	PROCEDURE Insert_Employee;
	PROCEDURE Insert_Feedback;
END InsertCite1;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY InsertCite1 AS
	
    ----procedure for insert in student table
	
	PROCEDURE Insert_Student
	IS
	student_id   Student.StudentID%TYPE ;
	roll         Student.std_ClassRoll%TYPE := &roll;
	name         Student.Std_Name%TYPE := '&Name';
	class_       Student.Std_Class%TYPE := &Class_;
	sec          Student.Std_Section%TYPE := '&Section' ;
	shift        Student.Std_Shift%TYPE := '&Shift';
	branch       Student.Std_Branch%TYPE;
	email        Student.Std_Email%TYPE := '&Email'; 
	row_no INT ;
	
	BEGIN
		SELECT COUNT(*) INTO row_no FROM Student;
		student_id := 'M' || TO_CHAR(row_no+1);
		branch := 'Motijheel' ;
	    --DBMS_OUTPUT.PUT_LINE('Student');
        INSERT INTO Student VALUES(student_id,roll,name,class_,sec,shift,branch,email);
	END Insert_Student;
	

	
	----procedure for insert in Employee table
	
	PROCEDURE Insert_Employee
	IS
	employee_id        Employee.EmployeeID%TYPE ;
	emp_name           Employee.Emp_Name%TYPE :='&Name';
	designation        Employee.Emp_Designation%TYPE :='&Designation' ;
	emp_shift          Employee.Emp_Shift%TYPE :='&Shift';
	emp_branch         Employee.Emp_Branch%TYPE ;
	emp_email          Employee.Emp_Email%TYPE :='&Email' ;
	row_no_ INT ;
	BEGIN
	    SELECT COUNT(*) INTO row_no_ FROM Employee;
		employee_id := 'M' || TO_CHAR(row_no_+1);
		emp_branch := 'Motijheel' ;
        INSERT INTO Employee VALUES(employee_id,emp_name,designation,emp_shift,emp_branch,emp_email);
		--DBMS_OUTPUT.PUT_LINE('Employee');
	END Insert_Employee;
	
	
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
	    SELECT COUNT(*) INTO row_no_ FROM Feedback_Details;
		feedback_id := 'M' || TO_CHAR(row_no_+1);
		
		feedback_std_branch := 'Motijheel' ;
		
		select sysdate into feedback_date from dual;
		
        INSERT INTO Feedback_Details VALUES(feedback_id,feedback_std_roll,feedback_std_class,feedback_std_sec,feedback_emp_id,feedback_std_branch,feedback_date);
		INSERT INTO Feedback VALUES(feedback_id,feedback_review);
		DBMS_OUTPUT.PUT_LINE('Feedback');
	END Insert_Feedback;


END InsertCite1;
/

-------main

DECLARE
	
BEGIN
	InsertCite1.Insert_Student;
	InsertCite1.Insert_Employee;
	InsertCite1.Insert_Feedback;
END;
/
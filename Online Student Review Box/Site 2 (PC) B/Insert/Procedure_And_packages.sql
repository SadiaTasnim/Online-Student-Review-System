SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;
---------package created for insert in Student and Employee
CREATE OR REPLACE PACKAGE InsertSite2 AS
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
END InsertSite2;
/

---------Created package body
CREATE OR REPLACE PACKAGE BODY InsertSite2 AS
	
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
		    SELECT COUNT(*) INTO row_no FROM Student@site1;
		    student_id := 'M' || TO_CHAR(row_no+1);
            INSERT INTO Student@site1 VALUES(student_id,roll,name,class_,sec,shift,branch,email);
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
		    SELECT COUNT(*) INTO row_no FROM Employee@site1;
		    employee_id := 'M' || TO_CHAR(row_no+1);
            INSERT INTO Employee@site1 VALUES(employee_id,emp_name,designation,emp_shift,emp_branch,emp_email); 
	
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
		    SELECT COUNT(*) INTO row_no FROM Feedback_Details@site1;
		    feedback_id := 'M' || TO_CHAR(row_no+1);
			INSERT INTO Feedback_Details@site1 VALUES(feedback_id,feedback_std_roll,feedback_std_class,feedback_std_sec,feedback_emp_id,feedback_std_branch,feedback_date);
		    INSERT INTO Feedback@site1 VALUES(feedback_id,feedback_review);
            
        END IF;			
	END Insert_Feedback;


END InsertSite2;
/



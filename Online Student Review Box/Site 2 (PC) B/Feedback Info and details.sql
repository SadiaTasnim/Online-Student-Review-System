SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET linesize 200;
SET pagesize 200;

/*Student Table*/
CREATE OR REPLACE VIEW All_Student AS
SELECT * FROM Student UNION  SELECT * FROM Student@Site1;

/*Employee Table*/
CREATE OR REPLACE VIEW All_Employee AS
SELECT * FROM Employee UNION  SELECT * FROM Employee@Site1;


/*Feedback Table */

CREATE OR REPLACE VIEW All_Feedback_Details AS
SELECT * FROM Feedback_Details UNION  SELECT * FROM Feedback_Details@Site1;

CREATE OR REPLACE VIEW All_Feedback AS
SELECT * FROM Feedback UNION  SELECT * FROM Feedback@Site1;


/* Show all feedback with id and employee id */

CREATE OR REPLACE VIEW Final_Feedback AS
SELECT All_Feedback_Details.FeedbackID, All_Feedback_Details.EmployeeID,All_Feedback_Details.Date_,
       All_Feedback_Details.std_ClassRoll,All_Feedback_Details.Std_Class,
	   All_Feedback_Details.Std_Section,All_Feedback_Details.Branch,All_Feedback.Review
FROM All_Feedback_Details JOIN All_Feedback
ON  All_Feedback_Details.FeedbackID = All_Feedback.FeedbackID;

commit;

clear screen;

SELECT FeedbackID,EmployeeID,Date_,Review FROM Final_Feedback;

/* Enter Employee id or date or review and see employee details and student details with feedback*/

DECLARE
    feedback_id           Feedback_Details.FeedbackID%TYPE ;
	feedback_std_roll     Feedback_Details.std_ClassRoll%TYPE :='&Roll';
	feedback_std_class    Feedback_Details.Std_Class%TYPE :='&Class' ;
	feedback_std_sec      Feedback_Details.Std_Section%TYPE :='&Section';
	feedback_emp_id       Feedback_Details.EmployeeID%TYPE :='&Employee_ID';
	feedback_std_branch   Feedback_Details.Branch%TYPE :='&Branch';
	feedback_date         Feedback_Details.Date_%TYPE :='&Date';
	feedback_review       Feedback.Review%TYPE :='&Review';
BEGIN
	FOR R IN (SELECT * FROM Final_Feedback WHERE std_ClassRoll LIKE '%' ||feedback_std_roll|| '%' AND 
	                                             Std_Class LIKE '%' ||feedback_std_class|| '%' AND
												 Std_Section LIKE '%' ||UPPER(feedback_std_sec)|| '%' AND
	                                             EmployeeID LIKE '%' ||UPPER(feedback_emp_id)|| '%' AND
												 Branch LIKE '%' ||INITCAP ( feedback_std_branch)|| '%' AND
											     Date_ LIKE '%' ||UPPER(feedback_date)|| '%' AND 
												 Review LIKE '%' ||LOWER (feedback_review)|| '%'  )
												 LOOP
	     	DBMS_OUTPUT.PUT_LINE('---------------------');
			DBMS_OUTPUT.PUT_LINE('Feedback ID :  ' || R.FeedbackID);
			DBMS_OUTPUT.PUT_LINE('Employee ID :  ' || R.EmployeeID);
			DBMS_OUTPUT.PUT_LINE('Date        :  ' || R.Date_);
			DBMS_OUTPUT.PUT_LINE('Review      :  ' || R.Review);
    END LOOP;
	
END;
/ 
commit;


DECLARE
	student_id       Student.StudentID%TYPE ;
	std_roll         Student.std_ClassRoll%TYPE;
	std_name         Student.Std_Name%TYPE ;
	std_class        Student.Std_Class%TYPE ;
	std_sec          Student.Std_Section%TYPE  ;
	std_shift        Student.Std_Shift%TYPE ;
	std_branch       Student.Std_Branch%TYPE;
	std_email        Student.Std_Email%TYPE ;
   
    employee_id        Employee.EmployeeID%TYPE ;
	emp_name           Employee.Emp_Name%TYPE;
	designation        Employee.Emp_Designation%TYPE;
	emp_shift          Employee.Emp_Shift%TYPE;
	emp_branch         Employee.Emp_Branch%TYPE ;
	emp_email          Employee.Emp_Email%TYPE;
	
    feedback_id_          Feedback_Details.FeedbackID%TYPE := '&feedback_id' ;
	feedback_std_roll_    Feedback_Details.std_ClassRoll%TYPE ;
	feedback_std_class_   Feedback_Details.Std_Class%TYPE ;
	feedback_std_sec_     Feedback_Details.Std_Section%TYPE ;
	feedback_emp_id_      Feedback_Details.EmployeeID%TYPE;
	feedback_std_branch_  Feedback_Details.Branch%TYPE ;
	feedback_date_        Feedback_Details.Date_%TYPE ;
	feedback_review_      Feedback.Review%TYPE ;
	feedback_student_id   Student.StudentID%TYPE ;
	
BEGIN  
       feedback_id_ := UPPER(feedback_id_);
	   Select std_ClassRoll,std_Class,Std_Section,Branch,EmployeeID,Review,Date_ into
	   feedback_std_roll_,feedback_std_class_ ,feedback_std_sec_,feedback_std_branch_,feedback_emp_id_,feedback_review_,feedback_date_ from
	   Final_Feedback WHERE FeedbackID = feedback_id_ ;
	
	   FOR R IN (SELECT * FROM All_Student WHERE std_ClassRoll = feedback_std_roll_ AND 
	                                             Std_Class = feedback_std_class_ AND
												 Std_Section = feedback_std_sec_ AND
												 Std_Branch = feedback_std_branch_ )
												 LOOP
	   feedback_student_id := R.StudentID;
	   END LOOP;
   
	   Select StudentID,std_ClassRoll,Std_Name,Std_Class,Std_Section,Std_Shift,Std_Branch,Std_Email into 
	          student_id ,std_roll,std_name,std_Class,std_sec,std_shift,std_branch,std_email from
			  All_Student where StudentID = feedback_student_id ;
	        DBMS_OUTPUT.PUT_LINE('----------------------');
			DBMS_OUTPUT.PUT_LINE('Student ID    :  ' ||student_id);
			DBMS_OUTPUT.PUT_LINE('Student Name  :  ' ||std_name);
			DBMS_OUTPUT.PUT_LINE('Class         :  ' ||std_Class);
			DBMS_OUTPUT.PUT_LINE('Sec           :  ' ||std_sec);
			DBMS_OUTPUT.PUT_LINE('Roll          :  ' ||std_roll);
			DBMS_OUTPUT.PUT_LINE('Shift         :  ' ||std_shift);
			DBMS_OUTPUT.PUT_LINE('Branch        :  ' ||std_branch);
			DBMS_OUTPUT.PUT_LINE('Email         :  ' ||std_email);
      
	   
	   Select EmployeeID,Emp_Name,Emp_Designation,Emp_Shift,Emp_Branch,Emp_Email into 
	          employee_id ,emp_name ,designation,emp_shift,emp_branch,emp_email from
			  All_Employee where EmployeeID = feedback_emp_id_ ;
	        DBMS_OUTPUT.PUT_LINE('----------------------');
			DBMS_OUTPUT.PUT_LINE('Employee ID   :  ' ||employee_id);
			DBMS_OUTPUT.PUT_LINE('Name          :  ' ||emp_name);
			DBMS_OUTPUT.PUT_LINE('Designation   :  ' ||designation);
			DBMS_OUTPUT.PUT_LINE('Shift         :  ' ||emp_shift);
			DBMS_OUTPUT.PUT_LINE('Branch        :  ' ||emp_branch);
			DBMS_OUTPUT.PUT_LINE('Email         :  ' ||emp_email);
       
	        DBMS_OUTPUT.PUT_LINE('----------------------');
	        DBMS_OUTPUT.PUT_LINE('Review        :  ' ||feedback_review_);
			DBMS_OUTPUT.PUT_LINE('Date          :  ' ||feedback_date_);
		EXCEPTION
		WHEN NO_DATA_FOUND THEN
		    DBMS_OUTPUT.PUT_LINE(CHR(13)||CHR(13));
		    DBMS_OUTPUT.PUT_LINE('----------------------------------');
			DBMS_OUTPUT.PUT_LINE('Invalid ID');
			DBMS_OUTPUT.PUT_LINE('----------------------------------');

	
END;
/ 
commit;

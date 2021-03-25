
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


/*Feedback Table*/

CREATE OR REPLACE VIEW All_Feedback_Details AS
SELECT * FROM Feedback_Details UNION  SELECT * FROM Feedback_Details@Site1;

CREATE OR REPLACE VIEW All_Feedback AS
SELECT * FROM Feedback UNION  SELECT * FROM Feedback@Site1;

CREATE OR REPLACE VIEW Final_Feedback AS
SELECT All_Feedback_Details.FeedbackID, All_Feedback_Details.EmployeeID, All_Feedback.Review
FROM All_Feedback_Details JOIN All_Feedback
ON  All_Feedback_Details.FeedbackID = All_Feedback.FeedbackID;



SELECT * FROM All_Student;
SELECT * FROM All_Employee;
SELECT * FROM All_Feedback_Details;
SELECT * FROM All_Feedback;
SELECT * FROM Final_Feedback;



commit;
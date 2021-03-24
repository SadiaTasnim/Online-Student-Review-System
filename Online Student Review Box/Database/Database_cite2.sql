clear screen;
SET linesize 200;
SET pagesize 200;
      /*delete existing table*/				 
DROP TABLE Student CASCADE CONSTRAINTS;
DROP TABLE Employee CASCADE CONSTRAINTS;
DROP TABLE Feedback_Details CASCADE CONSTRAINTS;
DROP TABLE Feedback CASCADE CONSTRAINTS;

      /*Create table*/
CREATE TABLE Student
(
    StudentID varchar(10),
	std_ClassRoll int,
    Std_Name varchar(30),
    Std_Class varchar(10),
    Std_Section varchar(5),
	Std_Shift varchar(10),
	Std_Branch varchar(10),
    Std_Email varchar(50),
        PRIMARY KEY (StudentID)
);
CREATE TABLE Employee
(
    EmployeeID varchar(10),
    Emp_Name varchar(30),
    Emp_Designation varchar(50),
	Emp_Shift varchar(10),
	Emp_Branch varchar(10),
    Emp_Email varchar(50),
        PRIMARY KEY (EmployeeID)
);
CREATE TABLE Feedback_Details
(
    FeedbackID varchar(10),
    std_ClassRoll int,
	Std_Class int,
    Std_Section varchar(5),
	EmployeeID varchar(10),
	Branch varchar(10),
    Date_ varchar(20),
        PRIMARY KEY (FeedbackID)
);
CREATE TABLE Feedback
(
    FeedbackID varchar(10),
    Review varchar(150),
        PRIMARY KEY (FeedbackID)
);

/* Value insert in Student Table*/

INSERT INTO Student VALUES('B1',1,'Raisa Ramisa',8,'C','Morning','Banasree','ramisa221@gmail.com');
INSERT INTO Student VALUES('B2',2,'Nowshin Ibnat',8,'C','Morning','Banasree','ibnatnowshin@gmail.com');
INSERT INTO Student VALUES('B3',3,'Talvia Pranti',8,'C','Morning','Banasree','prantirahman@gmail.com');
INSERT INTO Student VALUES('B4',4,'Raylah Marjia',8,'C','Morning','Banasree','marjia@gmail.com');
INSERT INTO Student VALUES('B5',5,'Tanjina Tumpa',8,'C','Morning','Banasree','tumpa_222@gmail.com');
INSERT INTO Student VALUES('B6',6,'Nishat Tasnim',8,'C','Morning','Banasree','tasnima294@gmail.com');
INSERT INTO Student VALUES('B7',7,'Maliha Mim',8,'C','Morning','Banasree','minrahman@gmail.com');
INSERT INTO Student VALUES('B8',8,'Jannatul Tasnim',8,'C','Morning','Banasree','jannatultasnim@gmail.com');
INSERT INTO Student VALUES('B9',9,'Jannatul Mim',8,'C','Morning','Banasree','mim234tasnim@gmail.com');
INSERT INTO Student VALUES('B10',10,'Jannatul Ananna',8,'C','Morning','Banasree','anannan@gmail.com');
INSERT INTO Student VALUES('B11',11,'Khandakar Arif',7,'A','Day','Banasree','arafifkhan@gmail.com');
INSERT INTO Student VALUES('B12',12,'Alif Mim',7,'A','Day','Banasree','Alifmim@gmail.com');
INSERT INTO Student VALUES('B13',13,'Rishadul khan',7,'A','Day','Banasree','Rishadul@gmail.com');
INSERT INTO Student VALUES('B14',14,'Shahriar Moin',7,'A','Day','Banasree','Shahriarm@gmail.com');
INSERT INTO Student VALUES('B15',15,'Ashfaq Ahmed',7,'A','Day','Banasree','Ahmedashfaq@gmail.com');
INSERT INTO Student VALUES('B16',16,'Sabir Rahman',7,'A','Day','Banasree','Sabir22@gmail.com');
INSERT INTO Student VALUES('B17',17,'Samir Ahmed',7,'A','Day','Banasree','Samirrr@gmail.com');
INSERT INTO Student VALUES('B18',18,'Shahriar Khan',7,'A','Day','Banasree','khanshahriar@gmail.com');
INSERT INTO Student VALUES('B19',19,'Bayejid Rahman',7,'A','Day','Banasree','bayejid3809@gmail.com');
INSERT INTO Student VALUES('B20',20,'Mahmudur Rahman',7,'A','Day','Banasree','mahmud@gmail.com');

/* Value insert in Employee Table*/

INSERT INTO Employee VALUES('B1','Mojammel Hasan','Teacher','Morning','Banasree','mojammel34@gmail.com');
INSERT INTO Employee VALUES('B2','Arafat Mojumber','Teacher','Morning','Banasree','arfata_mojum@gmail.com');
INSERT INTO Employee VALUES('B3','Yaseen Arafat','Teacher','Morning','Banasree','yaseenahmed@gmail.com');
INSERT INTO Employee VALUES('B4','Rafat Hasmi','Physical Director','Morning','Banasree','rahathasmi@gmail.com');
INSERT INTO Employee VALUES('B5','Fakhrul Islam','Security Gaurd','Morning','Banasree','fakhrulislam@gmail.com');
INSERT INTO Employee VALUES('B6','Salam Khan','Headmaster','Morning','Motijheel','salamkhan@gmail.com');
INSERT INTO Employee VALUES('B7','Abu Jafor','Headmaster','Morning','Motijheel','abujafor290@gmail.com');
INSERT INTO Employee VALUES('B8','Md. Kamruz zaman','Senior Teacher','Morning','Banasree','kamruzzaman@gmail.com');
INSERT INTO Employee VALUES('B9','Dr. Shahanara Begum','Principle','Morning','Motijheel','shahanara123@gmail.com');
INSERT INTO Employee VALUES('B10','Abul Kalam Azaz','Senior Teacher','Morning','Banasree','abulazaz_000@gmail.com');
INSERT INTO Employee VALUES('B11','Golam Mostafa','Senior Teacher','Day','Motijheel','golammostofa291@gmail.com');
INSERT INTO Employee VALUES('B12','Md Ali Mortuja','Senior Teacher','Day','Motijheel','ali_mortuja_000@gmail.com');
INSERT INTO Employee VALUES('B13','Mohammod Shafiul Alam','Computer Lab Ass.','Day','Banasree','shafiulalam235@gmail.com');
INSERT INTO Employee VALUES('B14','Karim Ahmed','Maintenance Supervisor','Day','Banasree','karimahmed334@gmail.com');
INSERT INTO Employee VALUES('B15','Rifat Ahmed','Photocopy Machine Operator','Day','Banasree','rifatkarim33@gmail.com');
INSERT INTO Employee VALUES('B16','Rafsana Begum','Cleaner','Morning','Banasree','rafsana@gmail.com');
INSERT INTO Employee VALUES('B17','Aurin Rahman','Librarian','Morning','Banasree','aurin342@gmail.com');
INSERT INTO Employee VALUES('B18','Audry Sultana','Canteen Manager','Morning','Banasree','audrysultana@gmail.com');
INSERT INTO Employee VALUES('B19','Abrar Ali','Maintenance Supervisor','Day','Banasree','abrarali@gmail.com');
INSERT INTO Employee VALUES('B20','Jarin Alam','Office Manager','Day','Banasree','jarinalam203@gmail.com');



/* Value insert Feedback_Details Table*/


INSERT INTO Feedback_Details VALUES('B1',13,7,'A','B16','Banasree','28-MAR-21');
INSERT INTO Feedback_Details VALUES('B2',12,7,'A','B16','Banasree','15-JAN-21');
INSERT INTO Feedback_Details VALUES('B3',6,8,'C','B16','Banasree','13-DEC-20');
INSERT INTO Feedback_Details VALUES('B4',6,8,'C','B14','Banasree','27-MAR-21');
INSERT INTO Feedback_Details VALUES('B5',6,8,'C','B16','Banasree','13-FEB-21');
INSERT INTO Feedback_Details VALUES('B6',10,8,'C','B17','Banasree','11-DEC-20');
INSERT INTO Feedback_Details VALUES('B7',8,8,'C','B17','Banasree','11-FEB-21');
INSERT INTO Feedback_Details VALUES('B8',8,8,'C','B18','Banasree','17-DEC-20');
INSERT INTO Feedback_Details VALUES('B9',9,8,'C','B20','Banasree','28-MAR-21');
INSERT INTO Feedback_Details VALUES('B10',1,8,'C','B8','Banasree','21-DEC-20');
INSERT INTO Feedback_Details VALUES('B11',2,8,'C','B19','Banasree','24-MAR-21');
INSERT INTO Feedback_Details VALUES('B12',3,8,'C','B14','Banasree','23-FEB-21');
INSERT INTO Feedback_Details VALUES('B13',1,8,'C','B17','Banasree','23-MAR-21');
INSERT INTO Feedback_Details VALUES('B14',2,8,'C','B17','Banasree','1-FEB-21');
INSERT INTO Feedback_Details VALUES('B15',3,8,'C','B20','Banasree','4-MAR-21');
INSERT INTO Feedback_Details VALUES('B16',14,7,'A','B13','Banasree','23-JAN-21');
INSERT INTO Feedback_Details VALUES('B17',13,7,'A','B17','Banasree','13-MAR-21');
INSERT INTO Feedback_Details VALUES('B18',16,7,'A','B14','Banasree','4-DEC-20');
INSERT INTO Feedback_Details VALUES('B19',20,7,'A','B17','Banasree','4-JAN-21');
INSERT INTO Feedback_Details VALUES('B20',16,7,'A','B18','Banasree','2-MAR-21');


/* Value insert in Feedback Table*/


INSERT INTO Feedback VALUES('B1','Room 203 was not clean today');
INSERT INTO Feedback VALUES('B2','Cupboards of our chemistry lab was not clean.');
INSERT INTO Feedback VALUES('B3','Black board of room 406 needs cleaning');
INSERT INTO Feedback VALUES('B4','Room 203 need some new dusters');
INSERT INTO Feedback VALUES('B5','Lights of the coridor in 3rd floor was not working');
INSERT INTO Feedback VALUES('B6','Class 8 Math Book was not in the library');
INSERT INTO Feedback VALUES('B7','Our library needs an updated booklist');
INSERT INTO Feedback VALUES('B8','I lost 100tk in the canteen today');
INSERT INTO Feedback VALUES('B9','How I can get my JSC certificate from office room ?');
INSERT INTO Feedback VALUES('B10','My number was counted wrong in CT 3');
INSERT INTO Feedback VALUES('B11','Some benches in room 407 were broken');
INSERT INTO Feedback VALUES('B12','Bencher in room 506 need some repairing');
INSERT INTO Feedback VALUES('B13','A red notebook was look in the library');
INSERT INTO Feedback VALUES('B14','Please inform me if any moneybag was found in the library');
INSERT INTO Feedback VALUES('B15','My Bangla book lost near office room');
INSERT INTO Feedback VALUES('B16','A calculator was lost in the computer lab');
INSERT INTO Feedback VALUES('B17','I lost my compas box in the library');
INSERT INTO Feedback VALUES('B18','A fan in room 403 was not working');
INSERT INTO Feedback VALUES('B19','I lost 100tk in the library room today');
INSERT INTO Feedback VALUES('B20','Price of the Curl chips was increased in our canteen');


--select sysdate from dual;
Select * from Student;
Select * from Employee;
Select * from Feedback_Details;
Select * from Feedback;
commit;
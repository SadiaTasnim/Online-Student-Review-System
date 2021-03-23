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

INSERT INTO Student VALUES('M1',1,'Sadia Tasnim',9,'A','Morning','Motijheel','sadiatasnim@gmail.com');
INSERT INTO Student VALUES('M2',2,'Kazi Nowshin',9,'A','Morning','Motijheel','nowshin01@gmail.com');
INSERT INTO Student VALUES('M3',3,'Sharmin Sriti',9,'A','Morning','Motijheel','sharminsriti@gmail.com');
INSERT INTO Student VALUES('M4',4,'Sabrina Mohona',9,'A','Morning','Motijheel','mohona000@gmail.com');
INSERT INTO Student VALUES('M5',5,'Sharika Anjum',9,'A','Morning','Motijheel','sharika_123@gmail.com');
INSERT INTO Student VALUES('M6',6,'Shafika Sultana',9,'B','Morning','Motijheel','anjum023@gmail.com');
INSERT INTO Student VALUES('M7',7,'Shabila Himaloy',9,'B','Morning','Motijheel','himaloykhanom@gmail.com');
INSERT INTO Student VALUES('M8',8,'Rahnuma Prapty',9,'B','Morning','Motijheel','praptykhan@gmail.com');
INSERT INTO Student VALUES('M9',9,'Hemel Ahmed',9,'B','Day','Motijheel','ahmedhim@gmail.com');
INSERT INTO Student VALUES('M10',10,'Sakibul Shafi',9,'B','Day','Motijheel','shafiul111@gmail.com');
INSERT INTO Student VALUES('M11',11,'Mainul Sadi',9,'A','Day','Motijheel','sadimainul@gmail.com');
INSERT INTO Student VALUES('M12',12,'Moinul Rahman',9,'A','Day','Motijheel','moinul2948@gmail.com');
INSERT INTO Student VALUES('M13',13,'Sajbir Rahman',9,'A','Day','Motijheel','sajbirul2929@gmail.com');
INSERT INTO Student VALUES('M14',14,'A K M Ablul Rahman',9,'A','Day','Motijheel','abdulkhan@gmail.com');
INSERT INTO Student VALUES('M15',15,'Shafikul Ahmed',9,'B','Day','Motijheel','shafik28rahman@gmail.com');
INSERT INTO Student VALUES('M16',16,'Shatil Alam',9,'B','Day','Motijheel','shatilia222@gmail.com');
INSERT INTO Student VALUES('M17',17,'Shafin Alam',9,'B','Day','Motijheel','shafin000@gmail.com');
INSERT INTO Student VALUES('M18',18,'Tahia Hridi',9,'A','Morning','Motijheel','tahiahridi@gmail.com');
INSERT INTO Student VALUES('M19',19,'Mahruma Oishee',9,'A','Morning','Motijheel','oisheefatiha@gmail.com');
INSERT INTO Student VALUES('M20',20,'Jannat Promi',9,'A','Morning','Motijheel','jannatpromi@gmail.com');
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

INSERT INTO Employee VALUES('M1','Mahinur Rahman','Security Guard','Morning','Motijheel','mahinurrahman@gmail.com');
INSERT INTO Employee VALUES('M2','Delowar Hossain','Senior Teacher','Morning','Motijheel','delowar122@gmail.com');
INSERT INTO Employee VALUES('M3','Miss S. Sudhashini','Security Guard Head','Morning','Motijheel','sudhsini183@gmail.com');
INSERT INTO Employee VALUES('M4','Mrs. S. Ramya','Cleaner','Morning','Motijheel','ramyaalma@gmail.com');
INSERT INTO Employee VALUES('M5','Md. Shafiul Alam','Teacher','Morning','Motijheel','shafiul@gmail.com');
INSERT INTO Employee VALUES('M6','Rafiqul Islam','Photocopy Machine Operator','Morning','Motijheel','Rafiq1alam@gmail.com');
INSERT INTO Employee VALUES('M7','Sara Ali Khan','Cleaner','Morning','Motijheel','saraali000@gmail.com');
INSERT INTO Employee VALUES('M8','Susanto Kumar','Library Assistance','Morning','Motijheel','susantorafiq@gmail.com');
INSERT INTO Employee VALUES('M9','Shahriar Mamun','Librarian','Morning','Motijheel','shariar123@gmail.com');
INSERT INTO Employee VALUES('M10','Shams Rahman','Canteen Manager','Morning','Motijheel','shamsrahman@gmail.com');
INSERT INTO Employee VALUES('M11','Moin Ali','Office Asst.','Day','Motijheel','moinaliahmed_@gmail.com');
INSERT INTO Employee VALUES('M12','A K Raju','Computer Lab Ass.','Day','Motijheel','rajualam111@gmail.com');
INSERT INTO Employee VALUES('M13','Samiullah Ali','Office Head.','Day','Motijheel','samiul124@gmail.com');
INSERT INTO Employee VALUES('M14','Binte Tisha','Maintenance Supervisor','Morning','Motijheel','tishaislam@gmail.com');
INSERT INTO Employee VALUES('M15','Sabiha Sriti','Physical Director','Morning','Motijheel','sabihasriti@gmail.com');
INSERT INTO Employee VALUES('M16','Sabbir Hamed','Office Manager','Day','Motijheel','sabbiralam@gmail.com');
INSERT INTO Employee VALUES('M17','Rezwan Karim','Security Gaurd','Day','Motijheel','rezwankarin222@gmail.com');
INSERT INTO Employee VALUES('M18','Nizam Kamal','Senior Teacher','Morning','Motijheel','nizamuddin09@gmail.com');
INSERT INTO Employee VALUES('M19','Tamanna Islam','Teacher','Morning','Motijheel','tamannaalam@gmail.com');
INSERT INTO Employee VALUES('M20','Lutfunnahar','Teacher','Morning','Motijheel','lutfun_398nahar@gmail.com');
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



INSERT INTO Feedback_Details VALUES('M1',2,9,'A','M3','Motijheel','2-FEB-21');
INSERT INTO Feedback_Details VALUES('M2',1,9,'A','M8','Motijheel','4-MAR-21');
INSERT INTO Feedback_Details VALUES('M3',7,9,'B','M10','Motijheel','5-FEB-21');
INSERT INTO Feedback_Details VALUES('M4',3,9,'A','M16','Motijheel','14-JAN-21');
INSERT INTO Feedback_Details VALUES('M5',5,9,'A','M17','Motijheel','21-MAR-21');
INSERT INTO Feedback_Details VALUES('M6',1,9,'A','M11','Motijheel','6-FEB-21');
INSERT INTO Feedback_Details VALUES('M7',3,9,'A','M2','Motijheel','12-MAR-21');
INSERT INTO Feedback_Details VALUES('M8',2,9,'A','M12','Motijheel','22-JAN-21');
INSERT INTO Feedback_Details VALUES('M9',5,9,'A','M12','Motijheel','22-FEB-21');
INSERT INTO Feedback_Details VALUES('M10',6,9,'B','M10','Motijheel','22-JAN-21');
INSERT INTO Feedback_Details VALUES('M11',13,9,'A','B11','Motijheel','13-JAN-21');
INSERT INTO Feedback_Details VALUES('M12',12,9,'A','M7','Motijheel','14-MAR-21');
INSERT INTO Feedback_Details VALUES('M13',11,9,'A','B7','Motijheel','14-JAN-21');
INSERT INTO Feedback_Details VALUES('M14',12,9,'A','B6','Motijheel','1-JAN-21');
INSERT INTO Feedback_Details VALUES('M15',11,9,'A','M8','Motijheel','2-MAR-21');
INSERT INTO Feedback_Details VALUES('M16',15,9,'A','M10','Motijheel','4-JAN-21');
INSERT INTO Feedback_Details VALUES('M17',16,9,'B','M14','Motijheel','19-FEB-21');
INSERT INTO Feedback_Details VALUES('M18',17,9,'B','M10','Motijheel','24-FEB-21');
INSERT INTO Feedback_Details VALUES('M19',19,9,'B','M14','Motijheel','23-JAN-21');
INSERT INTO Feedback_Details VALUES('M20',19,9,'B','M14','Motijheel','26-MAR-21');
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


INSERT INTO Feedback VALUES('M1','My Id Card was Lost near the canteen Area');
INSERT INTO Feedback VALUES('M2','The 6th part of the Harry Potter Book was missing in the library.It would be nice if it is added');
INSERT INTO Feedback VALUES('M3','Price of singara was increased last week in our school canteen.I think previous price was enough');
INSERT INTO Feedback VALUES('M4','I paid my tution fee on 8/1/21 through Bank deposite but I am not sure if it was paid.Where can I get the info?');
INSERT INTO Feedback VALUES('M5','I lost My Book in Room no 217 yesterday');
INSERT INTO Feedback VALUES('M6','What is the procedure for admission in class 3?');
INSERT INTO Feedback VALUES('M7','I did not recieve my admit card to the final exam');
INSERT INTO Feedback VALUES('M8','3rd computer in the computer lab is not working');
INSERT INTO Feedback VALUES('M9','I lost my pencil box in the computer lab');
INSERT INTO Feedback VALUES('M10','Quality of chicken Bun in our canteen is decreasing day by day');
INSERT INTO Feedback VALUES('M11','My Name was spelled wrong in my annual report card');
INSERT INTO Feedback VALUES('M12','Washrooms on the 2nd floor was not properly cleaned');
INSERT INTO Feedback VALUES('M13','It would be a great help if we can get a new Drum set from annual sports program');
INSERT INTO Feedback VALUES('M14','I did not get my copy of prottasa magazine these year');
INSERT INTO Feedback VALUES('M15','I lost my bag near the library room 2nd floor');
INSERT INTO Feedback VALUES('M16','Fans in the canteen was not working today');
INSERT INTO Feedback VALUES('M17','Talim box in room 305 is not working');
INSERT INTO Feedback VALUES('M18','I lost my bag in the canteen');
INSERT INTO Feedback VALUES('M19','Some water filter is needed in the fifth floor');
INSERT INTO Feedback VALUES('M20','Talim Box in room 403 is broken');
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


select sysdate from dual;
Select * from Student;
Select * from Employee;
Select * from Feedback_Details;
Select * from Feedback;
commit;
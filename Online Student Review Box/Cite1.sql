clear screen;
SET linesize 300;
SET pagesize 300;
      /*delete existing table*/				 
DROP TABLE Student CASCADE CONSTRAINTS;
DROP TABLE Employee CASCADE CONSTRAINTS;
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
CREATE TABLE Feedback_Info
(
    FeedbackInfoID int,
	StudentID varchar(10),
    std_ClassRoll int,
	Std_Class varchar(10),
    Std_Section varchar(5),
	EmployeeID varchar(10),
	Shift varchar(10),
	Branch varchar(10),
    Date_ varchar(20),
        PRIMARY KEY (FeedbackInfoID)
);
CREATE TABLE Feedback
(
    FeedbackID int,
	FeedbackInfoID int,
    Feedback varchar(100),
        PRIMARY KEY (FeedbackID)
);

/* Value insert in Student Table*/

INSERT INTO Student VALUES('A1',1,'Sadia Tasnim','Nine','A','Morning','Motijheel','sadiatasnim@gmail.com');
INSERT INTO Student VALUES('A2',2,'Kazi Nowshin','Nine','A','Morning','Motijheel','nowshin01@gmail.com');
INSERT INTO Student VALUES('A3',3,'Sharmin Sriti','Nine','A','Morning','Motijheel','sharminsriti@gmail.com');
INSERT INTO Student VALUES('A4',4,'Sabrina Mohona','Nine','A','Morning','Motijheel','mohona000@gmail.com');
INSERT INTO Student VALUES('A5',5,'Sharika Anjum','Nine','A','Morning','Motijheel','sharika_123@gmail.com');
INSERT INTO Student VALUES('A6',6,'Shafika Sultana','Ten','B','Morning','Motijheel','anjum023@gmail.com');
INSERT INTO Student VALUES('A7',7,'Shabila Himaloy','Ten','B','Morning','Motijheel','himaloykhanom@gmail.com');
INSERT INTO Student VALUES('A8',8,'Rahnuma Prapty','Ten','B','Morning','Motijheel','praptykhan@gmail.com');
INSERT INTO Student VALUES('A9',9,'Hemel Ahmed','Ten','B','Day','Motijheel','ahmedhim@gmail.com');
INSERT INTO Student VALUES('A10',10,'Sakibul Shafi','Ten','B','Day','Motijheel','shafiul111@gmail.com');
INSERT INTO Student VALUES('A11',11,'Mainul Sadi','Ten','A','Day','Motijheel','sadimainul@gmail.com');
INSERT INTO Student VALUES('A12',12,'Moinul Rahman','Ten','A','Day','Motijheel','moinul2948@gmail.com');
INSERT INTO Student VALUES('A13',13,'Sajbir Rahman','Ten','A','Day','Motijheel','sajbirul2929@gmail.com');
INSERT INTO Student VALUES('A14',14,'A K M Ablul Rahman','Ten','A','Day','Motijheel','abdulkhan@gmail.com');
INSERT INTO Student VALUES('A15',15,'Shafikul Ahmed','Ten','B','Day','Motijheel','shafik28rahman@gmail.com');
INSERT INTO Student VALUES('A16',16,'Shatil Alam','Ten','B','Day','Motijheel','shatilia222@gmail.com');
INSERT INTO Student VALUES('A17',17,'Shafin Alam','Ten','B','Day','Motijheel','shafin000@gmail.com');
INSERT INTO Student VALUES('A18',18,'Tahia Hridi','Nine','A','Morning','Motijheel','tahiahridi@gmail.com');
INSERT INTO Student VALUES('A19',19,'Mahruma Oishee','Nine','A','Morning','Motijheel','oisheefatiha@gmail.com');
INSERT INTO Student VALUES('A20',20,'Jannat Promi','Nine','A','Morning','Motijheel','jannatpromi@gmail.com');
INSERT INTO Student VALUES('B1',1,'Raisa Ramisa','Eight','C','Morning','Banasree','ramisa221@gmail.com');
INSERT INTO Student VALUES('B2',2,'Nowshin Ibnat','Eight','C','Morning','Banasree','ibnatnowshin@gmail.com');
INSERT INTO Student VALUES('B3',3,'Talvia Pranti','Eight','C','Morning','Banasree','prantirahman@gmail.com');
INSERT INTO Student VALUES('B4',4,'Raylah Marjia','Eight','C','Morning','Banasree','marjia@gmail.com');
INSERT INTO Student VALUES('B5',5,'Tanjina Tumpa','Eight','C','Morning','Banasree','tumpa_222@gmail.com');
INSERT INTO Student VALUES('B6',6,'Nishat Tasnim','Eight','C','Morning','Banasree','tasnima294@gmail.com');
INSERT INTO Student VALUES('B7',7,'Maliha Mim','Eight','C','Morning','Banasree','minrahman@gmail.com');
INSERT INTO Student VALUES('B8',8,'Jannatul Tasnim','Eight','C','Morning','Banasree','jannatultasnim@gmail.com');
INSERT INTO Student VALUES('B9',9,'Jannatul Mim','Eight','C','Morning','Banasree','mim234tasnim@gmail.com');
INSERT INTO Student VALUES('B10',10,'Jannatul Ananna','Eight','C','Morning','Banasree','anannan@gmail.com');
INSERT INTO Student VALUES('B11',11,'Khandakar Arif','Seven','A','Day','Banasree','arafifkhan@gmail.com');
INSERT INTO Student VALUES('B12',12,'Alif Mim','Seven','A','Day','Banasree','Alifmim@gmail.com');
INSERT INTO Student VALUES('B13',13,'Rishadul khan','Seven','A','Day','Banasree','Rishadul@gmail.com');
INSERT INTO Student VALUES('B14',14,'Shahriar Moin','Seven','A','Day','Banasree','Shahriarm@gmail.com');
INSERT INTO Student VALUES('B15',15,'Ashfaq Ahmed','Seven','A','Day','Banasree','Ahmedashfaq@gmail.com');
INSERT INTO Student VALUES('B16',16,'Sabir Rahman','Seven','A','Day','Banasree','Sabir22@gmail.com');
INSERT INTO Student VALUES('B17',17,'Samir Ahmed','Seven','A','Day','Banasree','Samirrr@gmail.com');
INSERT INTO Student VALUES('B18',18,'Shahriar Khan','Seven','A','Day','Banasree','khanshahriar@gmail.com');
INSERT INTO Student VALUES('B19',19,'Bayejid Rahman','Seven','A','Day','Banasree','bayejid3809@gmail.com');
INSERT INTO Student VALUES('B20',20,'Mahmudur Rahman','Seven','A','Day','Banasree','mahmud@gmail.com');







INSERT INTO Employee VALUES('C1','Mahinur Rahman','Security Guard','Morning','Motijheel','mahinurrahman@gmail.com');
INSERT INTO Employee VALUES('C2','Delowar Hossain','Senior Teacher','Morning','Motijheel','delowar122@gmail.com');
INSERT INTO Employee VALUES('C3','Miss S. Sudhashini','Security Guard Head','Morning','Motijheel','sudhsini183@gmail.com');
INSERT INTO Employee VALUES('C4','Mrs. S. Ramya','Cleaner','Morning','Motijheel','ramyaalma@gmail.com');
INSERT INTO Employee VALUES('C5','Md. Shafiul Alam','Teacher','Morning','Motijheel','shafiul@gmail.com');
INSERT INTO Employee VALUES('C6','Rafiqul Islam','Teacher','Morning','Motijheel','Rafiq1alam@gmail.com');
INSERT INTO Employee VALUES('C7','Sara Ali Khan','Cleaner','Morning','Motijheel','saraali000@gmail.com');
INSERT INTO Employee VALUES('C8','Susanto Kumar','Library Assistance','Morning','Motijheel','susantorafiq@gmail.com');
INSERT INTO Employee VALUES('C9','Shahriar Mamun','Librarian','Morning','Motijheel','shariar123@gmail.com');
INSERT INTO Employee VALUES('C10','Shams Rahman','Canteen Manager','Morning','Motijheel','shamsrahman@gmail.com');
INSERT INTO Employee VALUES('C11','Moin Ali','Office Asst.','Day','Motijheel','moinaliahmed_@gmail.com');
INSERT INTO Employee VALUES('C12','A K Raju','Office Asst.','Day','Motijheel','rajualam111@gmail.com');
INSERT INTO Employee VALUES('C13','Samiullah Ali','Office Head.','Day','Motijheel','samiul124@gmail.com');
INSERT INTO Employee VALUES('C14','Binte Tisha','Maintenance Supervisor','Morning','Motijheel','tishaislam@gmail.com');
INSERT INTO Employee VALUES('C15','Sabiha Sriti','Physical Director','Morning','Motijheel','sabihasriti@gmail.com');
INSERT INTO Employee VALUES('C16','Sabbir Hamed','Office Manager','Day','Motijheel','sabbiralam@gmail.com');
INSERT INTO Employee VALUES('C17','Rezwan Karim','Security Gaurd','Day','Motijheel','rezwankarin222@gmail.com');
INSERT INTO Employee VALUES('C18','Nizam Kamal','Senior Teacher','Morning','Motijheel','nizamuddin09@gmail.com');
INSERT INTO Employee VALUES('C19','Tamanna Islam','Teacher','Morning','Motijheel','tamannaalam@gmail.com');
INSERT INTO Employee VALUES('C20','Lutfunnahar','Teacher','Morning','Motijheel','lutfun_398nahar@gmail.com');
INSERT INTO Employee VALUES('D1','Mojammel Hasan','Teacher','Morning','Banasree','mojammel34@gmail.com');
INSERT INTO Employee VALUES('D2','Arafat Mojumber','Teacher','Morning','Banasree','arfata_mojum@gmail.com');
INSERT INTO Employee VALUES('D3','Yaseen Arafat','Teacher','Morning','Banasree','yaseenahmed@gmail.com');
INSERT INTO Employee VALUES('D4','Rafat Hasmi','Physical Director','Morning','Banasree','rahathasmi@gmail.com');
INSERT INTO Employee VALUES('D5','Fakhrul Islam','Security Gaurd','Morning','Banasree','fakhrulislam@gmail.com');
INSERT INTO Employee VALUES('D6','Salam Khan','Headmaster','Morning','Motijheel','salamkhan@gmail.com');
INSERT INTO Employee VALUES('D7','Abu Jafor','Headmaster','Morning','Motijheel','abujafor290@gmail.com');
INSERT INTO Employee VALUES('D8','Md. Kamruz zaman','Senior Teacher','Morning','Banasree','kamruzzaman@gmail.com');
INSERT INTO Employee VALUES('D9','Dr. Shahanara Begum','Principle','Morning','Motijheel','shahanara123@gmail.com');
INSERT INTO Employee VALUES('D10','Abul Kalam Azaz','Senior Teacher','Morning','Banasree','abulazaz_000@gmail.com');
INSERT INTO Employee VALUES('D11','Golam Mostafa','Senior Teacher','Day','Motijheel','golammostofa291@gmail.com');
INSERT INTO Employee VALUES('D12','Md Ali Mortuja','Senior Teacher','Day','Motijheel','ali_mortuja_000@gmail.com');
INSERT INTO Employee VALUES('D13','Mohammod Shafiul Alam','Teacher','Day','Banasree','shafiulalam235@gmail.com');
INSERT INTO Employee VALUES('D14','Karim Ahmed','Maintenance Supervisor','Day','Banasree','karimahmed334@gmail.com');
INSERT INTO Employee VALUES('D15','Rifat Ahmed','Office Asst.','Day','Banasree','rifatkarim33@gmail.com');
INSERT INTO Employee VALUES('D16','Rafsana Begum','Cleaner','Morning','Banasree','rafsana@gmail.com');
INSERT INTO Employee VALUES('D17','Aurin Rahman','Librarian','Morning','Banasree','aurin342@gmail.com');
INSERT INTO Employee VALUES('D18','Audry Sultana','Canteen Manager','Morning','Banasree','audrysultana@gmail.com');
INSERT INTO Employee VALUES('D19','Abrar Ali','Maintenance Supervisor','Day','Banasree','abrarali@gmail.com');
INSERT INTO Employee VALUES('D20','Jarin Alam','Office Manager','Day','Banasree','jarinalam203@gmail.com');

commit;
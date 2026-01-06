--Created database
create database EROLLEMENT_MANAFEMENT_SYSTEM;
use EROLLEMENT_MANAFEMENT_SYSTEM

select * from ENROLLMENT
CREATE TABLE STUDENT (
    StudentID VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Gender CHAR(1),
    Mobile VARCHAR(15)
);

CREATE TABLE COURSE (
    CourseCode VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100),
    CreditHour INT
);

CREATE TABLE INSTRUCTOR (
    InstructorID VARCHAR(20) PRIMARY KEY not null,
    Name VARCHAR(100),
    Gender CHAR(1),
    Age INT,
    DateOfHire DATE,
    Qualification VARCHAR(50),
    Phone VARCHAR(15),
    TotalHoursTaught INT
);

CREATE TABLE ENROLLMENT (
    StudentID VARCHAR(20),
    CourseCode VARCHAR(10),
    Mark INT,
    Grade VARCHAR(2),
    RegistrationDate DATE,
    PRIMARY KEY (StudentID, CourseCode),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (CourseCode) REFERENCES COURSE(CourseCode)
);

CREATE TABLE TEACHING (
    InstructorID VARCHAR(20),
    CourseCode VARCHAR(10),
    PRIMARY KEY (InstructorID, CourseCode),
    FOREIGN KEY (InstructorID) REFERENCES INSTRUCTOR(InstructorID),
    FOREIGN KEY (CourseCode) REFERENCES COURSE(CourseCode)
);




INSERT INTO STUDENT VALUES ('S001', 'Alice Smith', '2000-01-15', 'F', '0911123456');
INSERT INTO STUDENT VALUES ('S002', 'Bob Johnson', '1999-05-20', 'M', '0912345678');
INSERT INTO STUDENT VALUES ('S003', 'Charlie Brown', '2001-11-30', 'M', '0913456789');
INSERT INTO STUDENT VALUES ('S004', 'Diana Prince', '2000-07-04', 'F', '0914567890');
INSERT INTO STUDENT VALUES ('S005', 'Ethan Hunt', '1998-03-22', 'M', '0915678901');

-- Insert into COURSE
INSERT INTO COURSE VALUES ('CS101', 'Intro to CS', 3);
INSERT INTO COURSE VALUES ('DB101', 'Database Fund', 4);
INSERT INTO COURSE VALUES ('MATH101', 'Calculus I', 3);
INSERT INTO COURSE VALUES ('ENG101', 'English Comp', 3);
INSERT INTO COURSE VALUES ('PHY101', 'Physics I', 4);

-- Insert into INSTRUCTOR
INSERT INTO INSTRUCTOR VALUES ('I001', 'Dr. White', 'M', 45, '2005-09-01', 'PhD', '0921123456', 150);
INSERT INTO INSTRUCTOR VALUES ('I002', 'Ms. Black', 'F', 38, '2010-01-15', 'Masters', '0922345678', 120);
INSERT INTO INSTRUCTOR VALUES ('I003', 'Mr. Green', 'M', 55, '1995-06-20', 'PhD', '0923456789', 200);
INSERT INTO INSTRUCTOR VALUES ('I004', 'Dr. Blue', 'F', 42, '2008-03-10', 'PhD', '0924567890', 180);
INSERT INTO INSTRUCTOR VALUES ('I005', 'Ms. Red', 'F', 30, '2015-11-01', 'Masters', '0925678901', 90);

-- Insert into ENROLLMENT
INSERT INTO ENROLLMENT VALUES ('S001', 'DB101', 85, 'A', '2025-01-10');
INSERT INTO ENROLLMENT VALUES ('S002', 'CS101', 78, 'B', '2025-01-11');
INSERT INTO ENROLLMENT VALUES ('S003', 'MATH101', 92, 'A', '2025-01-12');
INSERT INTO ENROLLMENT VALUES ('S004', 'ENG101', 88, 'A', '2025-01-13');
INSERT INTO ENROLLMENT VALUES ('S005', 'PHY101', 75, 'B', '2025-01-14');

-- Insert into TEACHING_ASSIGNMENT
INSERT INTO TEACHING VALUES ('I001', 'DB101');
INSERT INTO TEACHING VALUES ('I002', 'CS101');
INSERT INTO TEACHING VALUES ('I003', 'MATH101');
INSERT INTO TEACHING VALUES ('I004', 'ENG101');
INSERT INTO TEACHING VALUES ('I005', 'PHY101');


ALTER TABLE STUDENT ADD Email VARCHAR(100);
ALTER TABLE STUDENT ADD Address VARCHAR(255);
 select * from student
-- Remove 
ALTER TABLE STUDENT DROP COLUMN Address;
 
 -- this quation K modif at leats two recodes from each table
UPDATE STUDENT SET Email = 'alice@example.com' WHERE StudentID = 'S001';
UPDATE STUDENT SET Mobile = '0999999999' WHERE StudentID = 'S002';

-- Modify COURSE
UPDATE COURSE SET CreditHour = 5 WHERE CourseCode = 'DB101';
UPDATE COURSE SET CourseName = 'Introduction to Computer Science' WHERE CourseCode = 'CS101';

-- Modify INSTRUCTOR
UPDATE INSTRUCTOR SET TotalHoursTaught = 160 WHERE InstructorID = 'I001';
UPDATE INSTRUCTOR SET Qualification = 'PhD (CS)' WHERE InstructorID = 'I002';

-- Modify ENROLLMENT
UPDATE ENROLLMENT SET Mark = 30 WHERE StudentID = 'S001' 
UPDATE ENROLLMENT SET Grade = 'B+' WHERE StudentID = 'S002' AND CourseCode = 'CS101';



SELECT 
    S.Name AS StudentName,
	
    C.CourseName, 
    E.Mark, 
	E.Grade,
    I.Name AS InstructorName
	
FROM STUDENT S
JOIN ENROLLMENT E ON S.StudentID = E.StudentID
JOIN COURSE C ON E.CourseCode = C.CourseCode
JOIN TEACHING T ON C.CourseCode = T.CourseCode
JOIN INSTRUCTOR I ON T.InstructorID = I.InstructorID;

select * from TEACHING
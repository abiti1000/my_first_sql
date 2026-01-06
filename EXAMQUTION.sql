create database ONLINE_EXAM_SYSTEM;
USE ONLINE_EXAM_SYSTEM
CREATE TABLE STUDENT (
    stud_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL, -- Ensures no two students use the same email
    password VARCHAR(255) NOT NULL
);


-- 2. Exam Table
CREATE TABLE EXAM (
    exam_id INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Duritonmin INT CHECK (Duritonmin > 0), -- Duration must be a positive number
    Totalmark INT CHECK (Totalmark > 0),  -- Max marks must be positive
    AvailableDate DATE
);

-- 3. Question Table
CREATE TABLE QUESTION (
    question_id INT PRIMARY KEY,
    Content TEXT NOT NULL,
    QuestionTyp VARCHAR(20) CHECK (QuestionTyp IN ('MCQ', 'True/False', 'Short Answer')), 
    Mark INT CHECK (Mark >= 0)
);

-- 4. ExamQuestion (Linking Exam and Question)
CREATE TABLE EXAMQUESTION (
    exam_id INT,
    question_id INT,
    TimeInSecs INT CHECK (TimeInSecs >= 0),
    PRIMARY KEY (exam_id, question_id), -- Composite PK: A question appears once per exam
    FOREIGN KEY (exam_id) REFERENCES EXAM(exam_id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES QUESTION(question_id)
);

-- 5. StudentExam (The Attempt)
CREATE TABLE STUDENTEXAM (
    studexam_id INT PRIMARY KEY,
    stud_id INT,
    exam_id INT,
    ObtainedMark INT DEFAULT 0,
    TimeTakenSecs INT CHECK (TimeTakenSecs >= 0),
    FOREIGN KEY (stud_id) REFERENCES STUDENT(stud_id),
    FOREIGN KEY (exam_id) REFERENCES EXAM(exam_id)
);

-- 6. StudentAnswers (Individual responses)
CREATE TABLE STUDENT_ANSWERS (
    ans_id INT PRIMARY KEY,
    studexam_id INT,
    question_id INT,
    AnswerContent TEXT,
    isCorrect BIt,
    FOREIGN KEY (studexam_id) REFERENCES STUDENTEXAM(studexam_id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES QUESTION(question_id)
);

 


INSERT INTO STUDENT (stud_id, name, email, password) 
VALUES (4, 'Mammed', 'alice4@example.com', 'hashed_pass_123');
 select * from student
-- Insert an Exam
INSERT INTO EXAM (exam_id, Title, Duritonmin, Totalmark, AvailableDate) 
VALUES (102, 'Database Basics', 60, 100, '2024-12-01');
select * from exam
-- Insert a Question
INSERT INTO QUESTION (question_id, Content, QuestionTyp, Mark) 
VALUES (502, 'What does SQL stand for?', 'MCQ', 80);

select * from QUESTION
-- Link Question to Exam
INSERT INTO EXAMQUESTION (exam_id, question_id, TimeInSecs) 
VALUES (102, 502, 31);

select * from EXAMQUESTION

-- Record an Exam Attempt (Student 1 takes Exam 101)
INSERT INTO STUDENTEXAM (studexam_id, stud_id, exam_id, ObtainedMark, TimeTakenSecs) 
VALUES (9004, 4, 102, 90, 45);

select * from  STUDENTEXAM 
select * from EXAMQUESTION

select * from EXAM

select 
S.name AS Student_Name,
    E.Title AS Exam_Title,
    SE.ObtainedMark,
    E.Totalmark AS Max_Possible,
	SE.TimeTakenSecs,
    -- Calculating percentage and rounding to 2 decimal places
    ROUND((CAST(SE.ObtainedMark AS FLOAT) / E.Totalmark) * 100, 2) AS Percentage_Score,
    -- Adding a simple Letter Grade logic
    CASE 
        WHEN (CAST(SE.ObtainedMark AS FLOAT) / E.Totalmark) * 100 >= 90 THEN 'A+'
        WHEN (CAST(SE.ObtainedMark AS FLOAT) / E.Totalmark) * 100 >= 80 THEN 'B'
        WHEN (CAST(SE.ObtainedMark AS FLOAT) / E.Totalmark) * 100 >= 70 THEN 'C'
        WHEN (CAST(SE.ObtainedMark AS FLOAT) / E.Totalmark) * 100 >= 60 THEN 'D'
        ELSE 'F'
    END AS Grade
FROM STUDENT S
JOIN STUDENTEXAM SE ON S.stud_id = SE.stud_id
JOIN EXAM E ON SE.exam_id = E.exam_id

ORDER BY Percentage_Score DESC;

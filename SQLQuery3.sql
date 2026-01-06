create database UNIVESITY_LIBRARY_MANAGEMENT_SYSTEM;
USE UNIVESITY_LIBRARY_MANAGEMENT_SYSTEM

create table student(
student_number VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Book (
    ISBN VARCHAR(20) PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL
);

CREATE TABLE Borrow (
    student_number VARCHAR(20),
    ISBN VARCHAR(20),
    date_borrowed DATE NOT NULL,
    return_date DATE,
    PRIMARY KEY (student_number, ISBN, date_borrowed),
    FOREIGN KEY (student_number) REFERENCES Student(student_number),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);
insert into student values
('S001', 'Alice Smith'),
('S002', 'Bob Johnson'),
('S003', 'Charlie Brown'),
('S004', 'Diana Prince'),
('S005', 'Ethan Hunt');

INSERT INTO Book (ISBN, book_name) VALUES
('978-0134846015', 'Database System Concepts'),
('978-0262033848', 'Introduction to Algorithms'),
('978-1492052203', 'Head First Design Patterns'),
('978-0132350884', 'Clean Code'),
('978-0134494166', 'Operating System Concepts');

insert into Borrow values
('S001', '978-0134846015', '2025-10-01', '2025-10-15'),
('S001', '978-0262033848', '2025-10-05', NULL),
('S002', '978-1492052203', '2025-10-10', '2025-10-20'),
('S003', '978-0132350884', '2025-10-12', NULL),
('S004', '978-0134494166', '2025-10-14', NULL);


select count(*) As total_books_borrowed from Borrow;
select count(*) As total_books_out  from Borrow where return_date is null

select S.name as student_name , S.student_number, B.book_name, BT. date_borrowed
FROM Student S
JOIN Borrow BT ON S.student_number = BT.student_number
JOIN Book B ON BT.ISBN = B.ISBN;

SELECT S.name AS student_name, S.student_number, B.book_name, BT.date_borrowed
FROM Student S
JOIN Borrow BT ON S.student_number = BT.student_number
JOIN Book B ON BT.ISBN = B.ISBN
WHERE BT.return_date IS NULL
ORDER BY BT.date_borrowed;
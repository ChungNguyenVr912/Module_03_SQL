CREATE DATABASE quanlydiemthi;
USE quanlydiemthi;
CREATE TABLE students (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    dayofbirth DATE,
    class VARCHAR(45),
    gender VARCHAR(20)
);
CREATE TABLE teachers (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    phone VARCHAR(11)
);
CREATE TABLE subject (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    subjectname VARCHAR(50),
    teacherID INT,
    FOREIGN KEY (teacherID)
        REFERENCES teachers (ID)
);
CREATE TABLE scores (
    studentID INT PRIMARY KEY,
    subjectID INT,
    FOREIGN KEY (studentID)
        REFERENCES students (ID),
    FOREIGN KEY (subjectID)
        REFERENCES subject (ID),
    dayexam DATETIME
);
ALTER TABLE subject
ADD COLUMN teacherID INT,
ADD FOREIGN KEY (teacherID) REFERENCES teachers(ID);
ALTER TABLE subject DROP FOREIGN KEY subject_ibfk_1,
DROP COLUMN teacherID;
    SELECT * FROM students;
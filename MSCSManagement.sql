CREATE TABLE Student (
    StudentID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DOB DATE,
    ClassYear YEAR NOT NULL,
    MathMajor BOOLEAN NOT NULL,
    CSMajor BOOLEAN NOT NULL, 
    SDSMajor BOOLEAN NOT NULL
);

CREATE TABLE Faculty (
    FacultyID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Prefix VARCHAR(3),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
   );

CREATE TABLE Courses (
    CourseID VARCHAR(10)  PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL UNIQUE,
    Capacity INT NOT NULL,
    NumberOfSection INT NOT NULL,
    OLECoreOffered BOOLEAN
  );

CREATE TABLE CourseRegistration (
    ClassYear YEAR NOT NULL,
    Semester VARCHAR(1) NOT NULL CHECK (Semester IN ('F', 'S', 'W')),
    CourseID VARCHAR(10),
    SectionID VARCHAR(1),
    LecturerID INT UNSIGNED,
    FilledSpots INT UNSIGNED,
    OverriddenRequestNumber INT UNSIGNED,
    UNIQUE (CourseID, SectionID),  
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (LecturerID) REFERENCES Faculty(FacultyID),
    PRIMARY KEY (ClassYear, Semester, CourseID, SectionID)
);


CREATE TABLE Grades (
    StudentID INT UNSIGNED,
    CourseID VARCHAR(10),
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID), 
    UNIQUE(StudentID, CourseID)
);

CREATE TABLE DegreePath (
    StudentID INT UNSIGNED,
    MajorCode VARCHAR(3) CHECK (MajorCode IN ('M', 'CS', 'SDS')),
    NumCoursesTaken INT UNSIGNED DEFAULT 0,
    NumCourseRequired INT UNSIGNED,
    FinishMajor BOOLEAN DEFAULT false,
    MajorGPA DOUBLE(8, 2),
    FOREIGN KEY (MajorCode) REFERENCES Majors(MajorCode),
    UNIQUE (StudentID, MajorCode)
);

CREATE TABLE Majors (
    MajorCode VARCHAR(3) PRIMARY KEY,
    MajorName VARCHAR(50) NOT NULL,
    NumCourseRequired INT UNSIGNED NOT NULL,
    NumberOfStudents INT UNSIGNED DEFAULT 0, 
    Director INT UNSIGNED,
  FOREIGN KEY (Director) REFERENCES Faculty(FacultyID)
);


--Populating data

-- Faculty Data
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Ryota', 'Matsuura');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Olaf', 'Hall-Holt');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Melissa', 'Lynn');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Paul', 'Roback');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Jaime', 'Davila');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Matthew', 'Wright');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('', 'Kim', 'Mandery');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Will', 'Leeson');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Jane', 'Willows');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Matt', 'Prinkles');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr', 'Alice', 'Smith');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Bob', 'Johnson');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Ian', 'Taylor');
INSERT INTO Faculty (Prefix, FirstName, LastName)  VALUES ('Dr.', 'Jack', 'Anderson');



-- Major Data
INSERT INTO Majors VALUES ('M', 'Math', 12, 0, 6);
INSERT INTO Majors VALUES ('CS', 'Computer Science', 11, 0, 1);
INSERT INTO Majors VALUES ('SDS', 'Statistics and Data Science', 10, 0, 4);
-- 

-- Student Data
INSERT INTO Student (FirstName, LastName, DOB, ClassYear, MathMajor, CSMajor, SDSMajor)  VALUES ('Fayellete', 'Tran', '2003-11-15', 2026, 1, 1, 1);
INSERT INTO Student (FirstName, LastName,  DOB, ClassYear, MathMajor, CSMajor, SDSMajor)  VALUES ('Khae', 'Trinh', '2001-03-01', 2023, 0, 0, 1);
INSERT INTO Student (FirstName, LastName, DOB, ClassYear, MathMajor, CSMajor, SDSMajor)  VALUES ('Quinn', 'Jane', '2003-06-01', 2030, 1, 0, 0);
INSERT INTO Student (FirstName, LastName, DOB, ClassYear, MathMajor, CSMajor, SDSMajor)  VALUES ('Anna', 'Ally', '2004-03-18', 2027, 1, 0, 1);
INSERT INTO Student (FirstName, LastName, DOB, ClassYear, MathMajor, CSMajor, SDSMajor)  VALUES ('Mindy', 'Cian', '2002-06-01', 2024, 1, 1, 1);
--

-- Course Data
INSERT INTO Courses VALUES ('M120', 'Calculus I', 30, 6, false);
INSERT INTO Courses VALUES ('M126', 'Calculus II', 25, 6, false);
INSERT INTO Courses VALUES ('M128', 'Honors Calculus II', 25, 6, false);
INSERT INTO Courses VALUES ('M220', 'Elementary Linear Algebra', 20, 2, false);
INSERT INTO Courses VALUES ('M226', 'Multivariable Calculus', 25, 1, false);
INSERT INTO Courses VALUES ('M232', 'Differential Equations I', 20, 2, false);
INSERT INTO Courses VALUES ('M234', 'Discrete Math', 24, 1, false);
INSERT INTO Courses VALUES ('M242', 'Modern Computational Math', 24, 2, false);
INSERT INTO Courses VALUES ('M244', 'Real Analysis', 18, 2, false);
INSERT INTO Courses VALUES ('M252', 'Abstract Algebra', 24, 2, false);
INSERT INTO Courses VALUES ('M262', 'Probability Theory', 18, 2, false);
INSERT INTO Courses VALUES ('M320', 'Advanced Linear Algebra', 20, 1, false);
INSERT INTO Courses VALUES ('M332', 'Differential Equations II', 20, 1, false);

INSERT INTO Courses VALUES ('CS121', 'Introduction to Computer Science', 30, 3, true);
INSERT INTO Courses VALUES ('CS221', 'Data Structures in C++', 30, 2, false);
INSERT INTO Courses VALUES ('CS241', 'Hardware Design', 25, 2, false);
INSERT INTO Courses VALUES ('CS251', 'Software Design', 25, 2, false);
INSERT INTO Courses VALUES ('CS263', 'Ethics for Software Design', 20, 2, false);
INSERT INTO Courses VALUES ('CS276', 'Programming Language', 25, 1, false);
INSERT INTO Courses VALUES ('CS353', 'Algorithm Analysis', 25, 2, false);
INSERT INTO Courses VALUES ('CS379', 'Introduction to Artificial Intelligence', 30, 1, false);

INSERT INTO Courses VALUES ('SDS164', 'Introduction to Data Science', 30, 2, false);
INSERT INTO Courses VALUES ('SDS172', 'Introduction to Statistics ', 30, 5, true);
INSERT INTO Courses VALUES ('SDS250', 'Principle of Data Visualization', 30, 1, false);
INSERT INTO Courses VALUES ('SDS264', 'Advanced Data Science', 30, 1, false);
INSERT INTO Courses VALUES ('SDS272', 'Statistical Modelling', 30, 2, false);
INSERT INTO Courses VALUES ('SDS322', 'Statistical Theory', 30, 1, false);
INSERT INTO Courses VALUES ('SDS341', 'Algorithms for Decision Making', 30, 1, false);

-- Course Registration Data

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M120', 'A', 9, 25, 10);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M120', 'B', 10, 20, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M120', 'C', 9, 15, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M120', 'D', 10, 24, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M120', 'E', 9, 20, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M120', 'F', 9, 26, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M126', 'A', 10, 25, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M126', 'B', 9, 25, 2);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M126', 'C', 10, 25, 2);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M126', 'D', 9, 20, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M126', 'E', 10, 21, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M126', 'F', 9, 15, 0);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M128', '', 6, 25, 0);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M220', 'A', 14, 15, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M220', 'B', 14, 20, 10);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M226', '', 9, 20, 0);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M232', 'A', 10, 20, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M232', 'B', 10, 20, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M234', '', 1, 25, 15);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M242', 'A', 6, 23, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M242', 'B', 6, 24, 1);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M244', 'A', 14, 18, 10);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M244', 'B', 14, 20, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M252', 'A', 1, 24, 2);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M252', 'B', 1, 24, 3);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M262', 'A', 14, 16, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M262', 'B', 9, 15, 0);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M320', '', 14, 18, 0);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'M332', '', 10, 17, 0);


INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS121', 'A', 2, 30, 5);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS121', 'B', 2, 29, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS121', 'C', 7, 30, 10);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS221', 'A', 11, 30, 6);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS221', 'B', 11, 30, 10);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS241', '', 3, 25, 10);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS251', 'A', 2, 25, 6);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS251', 'B', 8, 25, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS263', '', 3, 20, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS276', '', 8, 25, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS353', 'A', 2, 25, 5);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS353', 'B', 3, 25, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'CS379', '', 11, 32, 10);


INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS164', 'A', 4, 30, 10);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS164', 'B', 4, 30, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS172', 'A', 13, 30, 10);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS172', 'B', 12, 30, 8);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS172', 'C', 13, 30, 5);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS172', 'D', 12, 25, 0);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS172', 'E', 13, 29, 0);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS250', '', 12, 32, 15);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS264', '', 4, 30, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS272', 'A', 4, 30, 10);
INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS272', 'B', 4, 30, 5);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS322', '', 4, 25, 0);

INSERT INTO CourseRegistration (ClassYear, Semester, CourseID, SectionID, LecturerID, FilledSpots, OverriddenRequestNumber) VALUES (2024, 'F', 'SDS341', '', 5, 30, 10);

-- Everytime we add a new student into the Student table, we adjust the Majors table

DELIMITER //

CREATE TRIGGER MajorCountAdd
AFTER INSERT ON Student
FOR EACH ROW 
BEGIN
    -- Update Math Major Count
    IF NEW.MathMajor = 1 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents + 1
        WHERE MajorCode = 'M';
        
    END IF;

    -- Update CS Major Count
    IF NEW.CSMajor = 1 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents + 1
        WHERE MajorCode = 'CS';
    END IF;

    -- Update SDS Major Count
    IF NEW.SDSMajor = 1 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents + 1
        WHERE MajorCode = 'SDS';
    END IF;
END;
//

DELIMITER ;

-- Everytime we delete a new student into the Student table, we adjust the Majors table

DELIMITER //

CREATE TRIGGER MajorCountDelete 
AFTER DELETE ON Student
FOR EACH ROW 
BEGIN
    -- Update Math Major Count
    IF OLD.MathMajor = 1 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents - 1
        WHERE MajorCode = 'M';
    END IF;

    -- Update CS Major Count
    IF OLD.CSMajor = 1 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents - 1
        WHERE MajorCode = 'CS';
    END IF;

    -- Update SDS Major Count
    IF OLD.SDSMajor = 1 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents - 1
        WHERE MajorCode = 'SDS';
    END IF;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER MajorCountUpdate
AFTER UPDATE ON Student
FOR EACH ROW 
BEGIN
    -- Update Math Major Count
    IF NEW.MathMajor = 1 AND OLD.MathMajor = 0 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents + 1
        WHERE MajorCode = 'M';
    ELSEIF NEW.MathMajor = 0 AND OLD.MathMajor = 1 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents - 1
        WHERE MajorCode = 'M';
    END IF;

    -- Update CS Major Count
    IF NEW.CSMajor = 1 AND OLD.CSMajor = 0 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents + 1
        WHERE MajorCode = 'CS';
    ELSEIF NEW.CSMajor = 0 AND OLD.CSMajor = 1 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents - 1
        WHERE MajorCode = 'CS';
    END IF;

    -- Update SDS Major Count
    IF NEW.SDSMajor = 1 AND OLD.SDSMajor = 0 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents + 1
        WHERE MajorCode = 'SDS';
    ELSEIF NEW.SDSMajor = 0 AND OLD.SDSMajor = 1 THEN
        UPDATE Majors
        SET NumberOfStudents = NumberOfStudents - 1
        WHERE MajorCode = 'SDS';
    END IF;

END;
//

DELIMITER ;

-- Everytime we declare a major for a student when we add new student to the database

DELIMITER //

CREATE TRIGGER DegreePathAdd
AFTER Insert ON Student
FOR EACH ROW 
BEGIN
    -- Update Math Major Count
    IF NEW.MathMajor = 1 THEN
        INSERT INTO DegreePath
        VALUES (NEW.StudentID, 'M', 0, 6, false, 0.0);
    END IF;

    -- Update CS Major Count
    IF NEW.CSMajor = 1 THEN
        INSERT INTO DegreePath
        VALUES (NEW.StudentID, 'CS', 0, 7, false, 0.0);
    END IF;

    -- Update SDS Major Count
    IF NEW.SDSMajor = 1 THEN
       INSERT INTO DegreePath
        VALUES (NEW.StudentID, 'SDS', 0, 8, false, 0.0);
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER DegreePathDelete
AFTER DELETE ON Student
FOR EACH ROW 
BEGIN
    DELETE FROM DegreePath WHERE StudentID = OLD.StudentID;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER DegreePathUpdate
AFTER UPDATE ON Student
FOR EACH ROW 
BEGIN
     -- Update Math Major Count
    IF NEW.MathMajor = 1 AND OLD.MathMajor = 0 THEN
        INSERT INTO DegreePath
        VALUES (NEW.StudentID, 'M', 0, 6, false, 0.0);
    ELSEIF NEW.MathMajor = 0 AND OLD.MathMajor = 1 THEN
        DELETE FROM DegreePath WHERE StudentID = OLD.StudentID AND MajorCode = 'M';
    END IF;

    -- Update CS Major Count
    IF NEW.CSMajor = 1 AND OLD.CSMajor = 0 THEN
        INSERT INTO DegreePath
        VALUES (NEW.StudentID, 'CS', 0, 7, false, 0.0);
    ELSEIF NEW.CSMajor = 0 AND OLD.CSMajor = 1 THEN
        DELETE FROM DegreePath WHERE StudentID = OLD.StudentID AND MajorCode = 'CS';
    END IF;

    -- Update SDS Major Count
    IF NEW.SDSMajor = 1 AND OLD.SDSMajor = 0 THEN
       INSERT INTO DegreePath
        VALUES (NEW.StudentID, 'SCS', 0, 8, false, 0.0);
    ELSEIF NEW.SDSMajor = 0 AND OLD.SDSMajor = 1 THEN
        DELETE FROM DegreePath WHERE StudentID = OLD.StudentID AND MajorCode = 'SDS';
    END IF;
END;
//

DELIMITER ;

DELIMITER //
CREATE TRIGGER GradeAdd
AFTER INSERT ON Grades
FOR EACH ROW 
BEGIN
    DECLARE GradeNumeric DECIMAL(3,2);

    -- Convert letter grade to numeric value
    SET GradeNumeric = 
        CASE NEW.Grade
            WHEN 'A+'  THEN 4.0
            WHEN 'A'  THEN 4.0
            WHEN 'A-' THEN 3.7
            WHEN 'B+' THEN 3.3
            WHEN 'B'  THEN 3.0
            WHEN 'B-' THEN 2.7
            WHEN 'C+' THEN 2.3
            WHEN 'C'  THEN 2.0
            WHEN 'C-' THEN 1.7
            WHEN 'D+' THEN 1.3
            WHEN 'D'  THEN 1.0
            WHEN 'F'  THEN 0.0
            ELSE NULL -- Handle unexpected cases
        END;

    -- Update Math Major DegreePath
    IF NEW.CourseID LIKE 'M%' OR NEW.CourseID IN ('SDS322', 'SDS264', 'SDS272') THEN
        UPDATE DegreePath
        SET MajorGPA = (NumCoursesTaken * MajorGPA + GradeNumeric) / (NumCoursesTaken + 1), NumCoursesTaken = NumCoursesTaken + 1
        WHERE StudentID = NEW.StudentID AND MajorCode = 'M';
    END IF;

    -- Update CS Major DegreePath
    IF NEW.CourseID LIKE 'CS%' OR NEW.CourseID IN ('M220', 'M234', 'SDS341') THEN
        UPDATE DegreePath
        SET MajorGPA = (NumCoursesTaken * MajorGPA + GradeNumeric) / (NumCoursesTaken + 1), NumCoursesTaken = NumCoursesTaken + 1
        WHERE StudentID = NEW.StudentID AND MajorCode = 'CS';
    END IF;

    -- Update SDS Major DegreePath
    IF NEW.CourseID LIKE 'SDS%'  OR NEW.CourseID IN ('M262') THEN
        UPDATE DegreePath
        SET MajorGPA = (NumCoursesTaken * MajorGPA + GradeNumeric) / (NumCoursesTaken + 1), NumCoursesTaken = NumCoursesTaken + 1
        WHERE StudentID = NEW.StudentID AND MajorCode = 'SDS';
    END IF;
END;
//

DELIMITER ;

DELIMITER //
CREATE TRIGGER GradeDelete
AFTER DELETE ON Grades
FOR EACH ROW 
BEGIN
    DECLARE GradeNumeric DECIMAL(3,2);

    -- Convert letter grade to numeric value
    SET GradeNumeric = 
        CASE OLD.Grade
            WHEN 'A+'  THEN 4.0
            WHEN 'A'  THEN 4.0
            WHEN 'A-' THEN 3.7
            WHEN 'B+' THEN 3.3
            WHEN 'B'  THEN 3.0
            WHEN 'B-' THEN 2.7
            WHEN 'C+' THEN 2.3
            WHEN 'C'  THEN 2.0
            WHEN 'C-' THEN 1.7
            WHEN 'D+' THEN 1.3
            WHEN 'D'  THEN 1.0
            WHEN 'F'  THEN 0.0
            ELSE NULL -- Handle unexpected cases
        END;
    -- Update Math Major DegreePath
    IF OLD.CourseID LIKE 'M%' OR OLD.CourseID IN ('SDS322', 'SDS264', 'SDS272') THEN
        UPDATE DegreePath
        SET MajorGPA = (NumCoursesTaken * MajorGPA -GradeNumeric) / (NumCoursesTaken - 1), NumCoursesTaken = NumCoursesTaken - 1
        WHERE StudentID = OLD.StudentID AND MajorCode = 'M';
    END IF;

    -- Update CS Major DegreePath
    IF OLD.CourseID LIKE 'CS%' OR OLD.CourseID IN ('M220', 'M234', 'SDS341') THEN
        UPDATE DegreePath
        SET MajorGPA = (NumCoursesTaken * MajorGPA -GradeNumeric) / (NumCoursesTaken - 1), NumCoursesTaken = NumCoursesTaken - 1
        WHERE StudentID = OLD.StudentID AND MajorCode = 'CS';
    END IF;

    -- Update SDS Major DegreePath
    IF OLD.CourseID LIKE 'SDS%' OR OLD.CourseID IN ('M262') THEN
        UPDATE DegreePath
        SET MajorGPA = (NumCoursesTaken * MajorGPA -GradeNumeric) / (NumCoursesTaken - 1), NumCoursesTaken = NumCoursesTaken - 1
        WHERE StudentID = OLD.StudentID AND MajorCode = 'SDS';
    END IF;
END;
DELIMITER ;

DELIMITER //
CREATE TRIGGER MajorCompleted AFTER UPDATE ON DegreePath
 FOR EACH ROW BEGIN
    IF (NEW.NumCoursesTaken = NEW.NumCourseRequired AND MajorGPA >= 2.5) THEN 
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'The major is completed!';
    ELSEIF (NEW.NumCoursesTaken = NEW.NumCourseRequired AND MajorGPA < 2.5) THEN
    	  SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'The major is completed but the GPA is not satisfied!';
    END IF;
END
//

DELIMITER ;


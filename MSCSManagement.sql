-- CREATE TABLES
CREATE TABLE Student (
    student_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    class_year YEAR NOT NULL,
    math_major BOOLEAN NOT NULL,
    cs_major BOOLEAN NOT NULL, 
    sds_major BOOLEAN NOT NULL
);

CREATE TABLE Faculty (
    faculty_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    pre_fix VARCHAR(3),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
   );

CREATE TABLE Course (
    course_id VARCHAR(10)  PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    capacity INT NOT NULL,
    number_of_sections INT NOT NULL,
    OLE_core_offered BOOLEAN
  );

CREATE TABLE CourseRegistration (
    class_year YEAR NOT NULL,
    semester VARCHAR(1) NOT NULL CHECK (semester IN ('F', 'S', 'W')),
    course_id VARCHAR(10),
    section VARCHAR(1),
    lecturer_id INT UNSIGNED,
    filled_spot INT UNSIGNED,
    num_of_overriden_requests INT UNSIGNED,
    UNIQUE (class_year, semester, course_id, section),  
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (lecturer_id) REFERENCES Faculty(faculty_id)
);l


CREATE TABLE Grade (
    student_id INT UNSIGNED,
    course_id VARCHAR(10),
    letter_grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id), 
    FOREIGN KEY (letter_grade) REFERENCES LetterGrade(letter), 
    UNIQUE(student_id, course_id)
);

CREATE TABLE Major (
    major_code VARCHAR(3) PRIMARY KEY,
    major_name VARCHAR(50) NOT NULL,
    num_courses_required INT UNSIGNED NOT NULL,
    num_of_students_major INT UNSIGNED DEFAULT 0, 
    major_director INT UNSIGNED,
   FOREIGN KEY (major_director) REFERENCES Faculty(faculty_id)
);

CREATE TABLE DegreePath (
    student_id INT UNSIGNED,
    major_code VARCHAR(3) CHECK (major_code IN ('M', 'CS', 'SDS')),
    num_courses_taken INT UNSIGNED DEFAULT 0,
    finish_major BOOLEAN DEFAULT false,
    major_gpa DOUBLE(3, 2),
    FOREIGN KEY (major_code) REFERENCES Major(major_code),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    UNIQUE (student_id, major_code)
);

CREATE TABLE LetterGrade (
    letter VARCHAR(2) PRIMARY KEY,
    numeric_grade DOUBLE(3, 2)
);


--Populating data

-- Faculty Data
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Ryota', 'Matsuura');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Olaf', 'Hall-Holt');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Melissa', 'Lynn');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Paul', 'Roback');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Jaime', 'Davila');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Matthew', 'Wright');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('', 'Kim', 'Mandery');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Will', 'Leeson');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Jane', 'Willows');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Matt', 'Prinkles');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr', 'Alice', 'Smith');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Bob', 'Johnson');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Ian', 'Taylor');
INSERT INTO Faculty (pre_fix, first_name, last_name)  VALUES ('Dr.', 'Jack', 'Anderson');



-- Major Data
INSERT INTO Major VALUES ('M', 'Math', 8, 0, 6);
INSERT INTO Major VALUES ('CS', 'Computer Science', 7, 0, 1);
INSERT INTO Major VALUES ('SDS', 'Statistics and Data Science', 6, 0, 4);
-- 

-- Student Data
INSERT INTO Student (first_name, last_name, date_of_birth, class_year, math_major, cs_major, sds_major)  VALUES ('Fayellete', 'Tran', '2003-11-15', 2026, 1, 1, 1);
INSERT INTO Student (first_name, last_name,  date_of_birth, class_year, math_major, cs_major, sds_major)  VALUES ('Khae', 'Trinh', '2001-03-01', 2023, 0, 0, 1);
INSERT INTO Student (first_name, last_name, date_of_birth, class_year, math_major, cs_major, sds_major)  VALUES ('Quinn', 'Jane', '2003-06-01', 2030, 1, 0, 0);
INSERT INTO Student (first_name, last_name, date_of_birth, class_year, math_major, cs_major, sds_major)  VALUES ('Anna', 'Ally', '2004-03-18', 2027, 1, 0, 1);
INSERT INTO Student (first_name, last_name, date_of_birth, class_year, math_major, cs_major, sds_major)  VALUES ('Mindy', 'Cian', '2006-06-01', 2028, 0, 1, 1);
--

-- Course Data
INSERT INTO Course VALUES ('M120', 'Calculus I', 30, 6, false);
INSERT INTO Course VALUES ('M126', 'Calculus II', 25, 6, false);
INSERT INTO Course VALUES ('M128', 'Honors Calculus II', 25, 6, false);
INSERT INTO Course VALUES ('M220', 'Elementary Linear Algebra', 20, 2, false);
INSERT INTO Course VALUES ('M226', 'Multivariable Calculus', 25, 1, false);
INSERT INTO Course VALUES ('M232', 'Differential Equations I', 20, 2, false);
INSERT INTO Course VALUES ('M234', 'Discrete Math', 24, 1, false);
INSERT INTO Course VALUES ('M242', 'Modern Computational Math', 24, 2, false);
INSERT INTO Course VALUES ('M244', 'Real Analysis', 18, 2, false);
INSERT INTO Course VALUES ('M252', 'Abstract Algebra', 24, 2, false);
INSERT INTO Course VALUES ('M262', 'Probability Theory', 18, 2, false);
INSERT INTO Course VALUES ('M320', 'Advanced Linear Algebra', 20, 1, false);
INSERT INTO Course VALUES ('M332', 'Differential Equations II', 20, 1, false);

INSERT INTO Course VALUES ('CS121', 'Introduction to Computer Science', 30, 3, true);
INSERT INTO Course VALUES ('CS221', 'Data Structures in C++', 30, 2, false);
INSERT INTO Course VALUES ('CS241', 'Hardware Design', 25, 2, false);
INSERT INTO Course VALUES ('CS251', 'Software Design', 25, 2, false);
INSERT INTO Course VALUES ('CS263', 'Ethics for Software Design', 20, 2, false);
INSERT INTO Course VALUES ('CS276', 'Programming Language', 25, 1, false);
INSERT INTO Course VALUES ('CS353', 'Algorithm Analysis', 25, 2, false);
INSERT INTO Course VALUES ('CS379', 'Introduction to Artificial Intelligence', 30, 1, false);

INSERT INTO Course VALUES ('SDS164', 'Introduction to Data Science', 30, 2, true);
INSERT INTO Course VALUES ('SDS172', 'Introduction to Statistics ', 30, 5, true);
INSERT INTO Course VALUES ('SDS250', 'Principle of Data Visualization', 30, 1, false);
INSERT INTO Course VALUES ('SDS264', 'Advanced Data Science', 30, 1, false);
INSERT INTO Course VALUES ('SDS272', 'Statistical Modelling', 30, 2, false);
INSERT INTO Course VALUES ('SDS322', 'Statistical Theory', 30, 1, false);
INSERT INTO Course VALUES ('SDS341', 'Algorithms for Decision Making', 30, 1, false);

-- Course Registration Data

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M120', 'A', 9, 25, 10);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M120', 'B', 10, 20, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M120', 'C', 9, 15, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M120', 'D', 10, 24, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M120', 'E', 9, 20, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M120', 'F', 9, 26, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M126', 'A', 10, 25, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M126', 'B', 9, 25, 2);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M126', 'C', 10, 25, 2);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M126', 'D', 9, 20, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M126', 'E', 10, 21, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M126', 'F', 9, 15, 0);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M128', '', 6, 25, 0);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M220', 'A', 14, 15, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M220', 'B', 14, 20, 10);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M226', '', 9, 20, 0);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M232', 'A', 10, 20, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M232', 'B', 10, 20, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M234', '', 1, 25, 15);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M242', 'A', 6, 23, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M242', 'B', 6, 24, 1);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M244', 'A', 14, 18, 10);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M244', 'B', 14, 20, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M252', 'A', 1, 24, 2);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M252', 'B', 1, 24, 3);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M262', 'A', 14, 16, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M262', 'B', 9, 15, 0);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M320', '', 14, 18, 0);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'M332', '', 10, 17, 0);


INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS121', 'A', 2, 30, 5);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS121', 'B', 2, 29, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS121', 'C', 7, 30, 10);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS221', 'A', 11, 30, 6);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS221', 'B', 11, 30, 10);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS241', '', 3, 25, 10);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS251', 'A', 2, 25, 6);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS251', 'B', 8, 25, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS263', '', 3, 20, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS276', '', 8, 25, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS353', 'A', 2, 25, 5);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS353', 'B', 3, 25, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'CS379', '', 11, 32, 10);


INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS164', 'A', 4, 30, 10);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS164', 'B', 4, 30, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS172', 'A', 13, 30, 10);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS172', 'B', 12, 30, 8);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS172', 'C', 13, 30, 5);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS172', 'D', 12, 25, 0);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS172', 'E', 13, 29, 0);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS250', '', 12, 32, 15);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS264', '', 4, 30, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS272', 'A', 4, 30, 10);
INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS272', 'B', 4, 30, 5);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS322', '', 4, 25, 0);

INSERT INTO CourseRegistration (class_year, semester, course_id, section, lecturer_id, filled_spot, num_of_overriden_requests) VALUES (2024, 'F', 'SDS341', '', 5, 30, 10);

-- Grade Add
INSERT INTO Grade VALUES(1, 'CS221', 'A+'), (1, 'CS251', 'A'), (1, 'CS353', 'A+'), (1, 'CS241', 'A'), (1, 'M120', 'A+'), (1, 'M128', 'A'), (1, 'M220', 'A'), (1, 'M234', 'A'), (1, 'M252', 'A'), (1, 'M262', 'A+'), (1, 'M242', 'A'), (1, 'SDS164', 'A+'), (1, 'SDS172', 'A+'), (1, 'SDS264', 'A'), (1, 'SDS341', 'A');

INSERT INTO Grade VALUES(2, 'SDS164', 'A'), (2, 'SDS172', 'A-'), (2, 'SDS250', 'B+'), (2, 'SDS264', 'A'), (2, 'SDS272', 'A-'), (2, 'SDS322', 'A'), (2, 'SDS341', 'A'), (2, 'M126', 'A+'), (2, 'M220', 'A'), (2, 'M262', 'A');

INSERT INTO Grade VALUES(3, 'CS121', 'A-'), (3, 'CS221', 'A-'), (3, 'CS251', 'A-'), (3, 'CS353', 'A'), (3, 'CS241', 'A+'), (3, 'SDS341', 'A'), (3, 'M120', 'A+'), (3, 'M126', 'A-'), (3, 'M220', 'A'), (3, 'M234', 'A');

INSERT INTO Grade VALUES(4, 'CS121', 'A'), (4, 'CS221', 'B'), (4, 'CS251', 'B+'), (4, 'CS241', 'A-'), (4, 'M120', 'A-'), (4, 'M126', 'B+'), (4, 'M220', 'A-'), (4, 'M234', 'B'), (4, 'SDS164', 'A'), (4, 'SDS172', 'A-');

INSERT INTO Grade VALUES(5, 'CS121', 'A-'), (5, 'CS221', 'A+'), (5, 'M126', 'A'), (5, 'M220', 'A+'), (5, 'SDS172', 'A');

-- Letter Grade

INSERT INTO LetterGrade VALUES ('A+', 4.0), ('A', 4.0), ('A-', 3.7), ('B+', 3.3), ('B', 3.0), ('B-', 2.7), ('C+', 2.3), ('C', 2.0), ('C-', 1.7), ('D+', 1.3), ('D', 1.0), ('F', 0.0);
-- Everytime we add a new student into the Student table, we adjust the Major table

DELIMITER //

CREATE TRIGGER MajorCountAdd
AFTER INSERT ON Student
FOR EACH ROW 
BEGIN
    -- Update Math Major Count
    IF NEW.math_major = 1 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major + 1
        WHERE major_code = 'M';
        
    END IF;

    -- Update CS Major Count
    IF NEW.cs_major = 1 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major + 1
        WHERE major_code = 'CS';
    END IF;

    -- Update SDS Major Count
    IF NEW.sds_major = 1 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major + 1
        WHERE major_code = 'SDS';
    END IF;
END;
//

DELIMITER ;

-- Everytime we delete a new student into the Student table, we adjust the Major table

DELIMITER //

CREATE TRIGGER MajorCountDelete 
AFTER DELETE ON Student
FOR EACH ROW 
BEGIN
    -- Update Math Major Count
    IF OLD.math_major = 1 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major - 1
        WHERE major_code = 'M';
    END IF;

    -- Update CS Major Count
    IF OLD.cs_major = 1 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major - 1
        WHERE major_code = 'CS';
    END IF;

    -- Update SDS Major Count
    IF OLD.sds_major = 1 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major - 1
        WHERE major_code = 'SDS';
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
    IF NEW.math_major = 1 AND OLD.math_major = 0 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major + 1
        WHERE major_code = 'M';
    ELSEIF NEW.math_major = 0 AND OLD.math_major = 1 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major - 1
        WHERE major_code = 'M';
    END IF;

    -- Update CS Major Count
    IF NEW.cs_major = 1 AND OLD.cs_major = 0 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major + 1
        WHERE major_code = 'CS';
    ELSEIF NEW.cs_major = 0 AND OLD.cs_major = 1 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major - 1
        WHERE major_code = 'CS';
    END IF;

    -- Update SDS Major Count
    IF NEW.sds_major = 1 AND OLD.sds_major = 0 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major + 1
        WHERE major_code = 'SDS';
    ELSEIF NEW.sds_major = 0 AND OLD.sds_major = 1 THEN
        UPDATE Major
        SET num_of_students_major = num_of_students_major - 1
        WHERE major_code = 'SDS';
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
    IF NEW.math_major = 1 THEN
        INSERT INTO DegreePath
        VALUES (NEW.student_id, 'M', 0, false, 0.0);
    END IF;

    -- Update CS Major Count
    IF NEW.cs_major = 1 THEN
        INSERT INTO DegreePath
        VALUES (NEW.student_id, 'CS', 0, false, 0.0);
    END IF;

    -- Update SDS Major Count
    IF NEW.sds_major = 1 THEN
       INSERT INTO DegreePath
        VALUES (NEW.student_id, 'SDS', 0, false, 0.0);
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER DegreePathDelete
AFTER DELETE ON Student
FOR EACH ROW 
BEGIN
    DELETE FROM DegreePath WHERE student_id = OLD.student_id;
END;
//

DELIMITER //

CREATE TRIGGER DegreePathUpdate
AFTER UPDATE ON Student
FOR EACH ROW
BEGIN
    -- Declare all variables at the beginning (MySQL requires this)
    DECLARE MathCourseTaken INT DEFAULT 0;
    DECLARE CSCourseTaken INT DEFAULT 0;
    DECLARE SDSCourseTaken INT DEFAULT 0;

    DECLARE MathGPA DECIMAL(4,2) DEFAULT 0.0;
    DECLARE CSGPA DECIMAL(4,2) DEFAULT 0.0;
    DECLARE SDSGPA DECIMAL(4,2) DEFAULT 0.0;

    DECLARE MathReq INT DEFAULT 0;
    DECLARE CSReq INT DEFAULT 0;
    DECLARE SDSReq INT DEFAULT 0;

    -- 📌 MATH MAJOR LOGIC
    IF NEW.math_major = 1 AND OLD.math_major = 0 THEN
        SELECT COUNT(*) INTO MathCourseTaken 
        FROM Grade  
        WHERE student_id = NEW.student_id AND (course_id LIKE 'M%' OR course_id IN ('SDS322', 'SDS264', 'SDS272', 'CS353'));

        IF MathCourseTaken = 0 THEN
            INSERT INTO DegreePath VALUES (NEW.student_id, 'M', 0, FALSE, 0.0);
        ELSE
            SELECT (SUM(LetterGrade.numeric_grade) / COUNT(*)) INTO MathGPA 
            FROM Grade JOIN LetterGrade ON Grade.letter_grade = LetterGrade.letter
            WHERE student_id = NEW.student_id AND (course_id LIKE 'M%' OR course_id IN ('SDS322', 'SDS264', 'SDS272', 'CS353'));

            SELECT num_courses_required INTO MathReq FROM Major WHERE major_code = 'M';

            INSERT INTO DegreePath
            VALUES (NEW.student_id, 'M', MathCourseTaken, (MathCourseTaken >= MathReq), MathGPA);
        END IF;
        
    ELSEIF NEW.math_major = 0 AND OLD.math_major = 1 THEN
        DELETE FROM DegreePath WHERE student_id = OLD.student_id AND major_code = 'M';
    END IF;

    -- 📌 CS MAJOR LOGIC
    IF NEW.cs_major = 1 AND OLD.cs_major = 0 THEN
        SELECT COUNT(*) INTO CSCourseTaken 
        FROM Grade  
        WHERE student_id = NEW.student_id AND (course_id LIKE 'CS%' OR course_id IN ('M220', 'M234', 'SDS341'));

        IF CSCourseTaken = 0 THEN
            INSERT INTO DegreePath VALUES (NEW.student_id, 'CS', 0, FALSE, 0.0);
        ELSE
            SELECT (SUM(LetterGrade.numeric_grade) / COUNT(*)) INTO CSGPA 
            FROM Grade JOIN LetterGrade ON Grade.letter_grade = LetterGrade.letter
            WHERE student_id = NEW.student_id AND (course_id LIKE 'CS%' OR course_id IN ('M220', 'M234', 'SDS341'));

            SELECT num_courses_required INTO CSReq FROM Major WHERE major_code = 'CS';

            INSERT INTO DegreePath
            VALUES (NEW.student_id, 'CS', CSCourseTaken, (CSCourseTaken >= CSReq), CSGPA);
        END IF;

    ELSEIF NEW.cs_major = 0 AND OLD.cs_major = 1 THEN
        DELETE FROM DegreePath WHERE student_id = OLD.student_id AND major_code = 'CS';
    END IF;

    -- 📌 SDS MAJOR LOGIC
    IF NEW.sds_major = 1 AND OLD.sds_major = 0 THEN
        SELECT COUNT(*) INTO SDSCourseTaken 
        FROM Grade  
        WHERE student_id = NEW.student_id AND (course_id LIKE 'SDS%' OR course_id IN ('M262'));

        IF SDSCourseTaken = 0 THEN
            INSERT INTO DegreePath VALUES (NEW.student_id, 'SDS', 0, FALSE, 0.0);
        ELSE
            SELECT (SUM(LetterGrade.numeric_value) / COUNT(*)) INTO SDSGPA 
            FROM Grade JOIN LetterGrade ON Grade.letter_grade = LetterGrade.letter
            WHERE student_id = NEW.student_id AND (course_id LIKE 'SDS%' OR course_id IN ('M262'));

            SELECT num_courses_required INTO SDSReq FROM Major WHERE major_code = 'SDS';

            INSERT INTO DegreePath
            VALUES (NEW.student_id, 'SDS', SDSCourseTaken, (SDSCourseTaken >= SDSReq), SDSGPA);
        END IF;

    ELSEIF NEW.sds_major = 0 AND OLD.sds_major = 1 THEN
        DELETE FROM DegreePath WHERE student_id = OLD.student_id AND major_code = 'SDS';
    END IF;

END;
//


DELIMITER //
CREATE TRIGGER GradeAdd
AFTER INSERT ON Grade
FOR EACH ROW 
BEGIN
    DECLARE GradeNumeric DECIMAL(3,2);

    -- Convert letter grade to numeric value
    SELECT numeric_grade INTO GradeNumeric FROM LetterGrade WHERE letter = NEW.letter_grade;

    -- Update Math Major DegreePath
    IF NEW.course_id LIKE 'M%' OR NEW.course_id IN ('SDS322', 'SDS264', 'SDS272', 'CS353') THEN
        UPDATE DegreePath
        SET major_gpa = (num_courses_taken * major_gpa + GradeNumeric) / (num_courses_taken + 1), num_courses_taken = num_courses_taken + 1
        WHERE student_id = NEW.student_id AND major_code = 'M';
    END IF;

    -- Update CS Major DegreePath
    IF NEW.course_id LIKE 'CS%' OR NEW.course_id IN ('M220', 'M234', 'SDS341') THEN
        UPDATE DegreePath
        SET major_gpa = (num_courses_taken * major_gpa + GradeNumeric) / (num_courses_taken + 1), num_courses_taken = num_courses_taken + 1
        WHERE student_id = NEW.student_id AND major_code = 'CS';
    END IF;

    -- Update SDS Major DegreePath
    IF NEW.course_id LIKE 'SDS%'  OR NEW.course_id IN ('M262') THEN
        UPDATE DegreePath
        SET major_gpa = (num_courses_taken * major_gpa + GradeNumeric) / (num_courses_taken + 1), num_courses_taken = num_courses_taken + 1
        WHERE student_id = NEW.student_id AND major_code = 'SDS';
    END IF;
END;
//

DELIMITER ;

DELIMITER //
CREATE TRIGGER GradeDelete
AFTER DELETE ON Grade
FOR EACH ROW 
BEGIN
    DECLARE GradeNumeric DECIMAL(3,2);

    -- Convert letter grade to numeric value
        SELECT numeric_grade INTO GradeNumeric FROM LetterGrade WHERE letter = OLD.letter_grade;


    -- Update Math Major DegreePath
    IF OLD.course_id LIKE 'M%' OR OLD.course_id IN ('SDS322', 'SDS264', 'SDS272') THEN
        UPDATE DegreePath
        SET major_gpa = CASE 
            WHEN num_courses_taken = 1 THEN 0.0
            ELSE (num_courses_taken * major_gpa - GradeNumeric) / (num_courses_taken - 1)
        END,
        num_courses_taken = num_courses_taken - 1
        WHERE student_id = OLD.student_id AND major_code = 'M';
    END IF;

    -- Update CS Major DegreePath
    IF OLD.course_id LIKE 'CS%' OR OLD.course_id IN ('M220', 'M234', 'SDS341') THEN
        UPDATE DegreePath
        SET major_gpa = CASE 
            WHEN num_courses_taken = 1 THEN 0.0
            ELSE (num_courses_taken * major_gpa - GradeNumeric) / (num_courses_taken - 1)
        END,
        num_courses_taken = num_courses_taken - 1
        WHERE student_id = OLD.student_id AND major_code = 'CS';
    END IF;

    -- Update SDS Major DegreePath
    IF OLD.course_id LIKE 'SDS%' OR OLD.course_id IN ('M262') THEN
        UPDATE DegreePath
        SET major_gpa = CASE 
            WHEN num_courses_taken = 1 THEN 0 
            ELSE (num_courses_taken * major_gpa - GradeNumeric) / (num_courses_taken - 1)
        END,
        num_courses_taken = num_courses_taken - 1
        WHERE student_id = OLD.student_id AND major_code = 'SDS';
    END IF;

END //

DELIMITER //

CREATE TRIGGER GradeUpdate
AFTER UPDATE ON Grade
FOR EACH ROW
BEGIN
    DECLARE OldGradeNumeric DECIMAL(4,2);
    DECLARE NewGradeNumeric DECIMAL(4,2);

    -- Get numeric values for old and new grades
    SELECT numeric_value INTO OldGradeNumeric FROM LetterGrade WHERE letter = OLD.letter_grade;
    SELECT numeric_value INTO NewGradeNumeric FROM LetterGrade WHERE letter = NEW.letter_grade;

    -- 📘 Math Major
    IF OLD.course_id LIKE 'M%' OR OLD.course_id IN ('SDS322', 'SDS264', 'SDS272') THEN
        UPDATE DegreePath
        SET major_gpa = (num_courses_taken * major_gpa - OldGradeNumeric + NewGradeNumeric) / num_courses_taken
        WHERE student_id = NEW.student_id AND major_code = 'M';
    END IF;

    -- 💻 CS Major
    IF OLD.course_id LIKE 'CS%' OR OLD.course_id IN ('M220', 'M234', 'SDS341') THEN
        UPDATE DegreePath
        SET major_gpa = (num_courses_taken * major_gpa - OldGradeNumeric + NewGradeNumeric) / num_courses_taken
        WHERE student_id = NEW.student_id AND major_code = 'CS';
    END IF;

    -- 📊 SDS Major
    IF OLD.course_id LIKE 'SDS%' OR OLD.course_id IN ('M262') THEN
        UPDATE DegreePath
        SET major_gpa = (num_courses_taken * major_gpa - OldGradeNumeric + NewGradeNumeric) / num_courses_taken
        WHERE student_id = NEW.student_id AND major_code = 'SDS';
    END IF;

END;
//




DELIMITER //
CREATE TRIGGER MajorCompleted AFTER UPDATE ON DegreePath
 FOR EACH ROW BEGIN
    DECLARE NumCoursesRequired INT;
    SELECT num_courses_required INTO NumCoursesRequired 
    FROM Major 
    WHERE major_code = NEW.major_code;
    IF (NEW.num_courses_taken = NumCoursesRequired AND NEW.major_gpa >= 2.5) THEN 
        SET NEW.finish_major = true;
    ELSE
        SET NEW.finish_major = false;
    END IF;
END
//

DELIMITER ;

-- Create View




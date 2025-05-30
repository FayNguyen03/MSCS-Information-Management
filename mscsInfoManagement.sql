-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb:3306
-- Generation Time: Apr 09, 2025 at 01:03 AM
-- Server version: 10.6.20-MariaDB-log
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `knguyent_2425_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `course_id` varchar(10) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL,
  `number_of_sections` int(11) NOT NULL,
  `OLE_core_offered` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`course_id`, `course_name`, `capacity`, `number_of_sections`, `OLE_core_offered`) VALUES
('CS121', 'Introduction to Computer Science', 30, 3, 1),
('CS221', 'Data Structures in C++', 30, 2, 0),
('CS241', 'Hardware Design', 25, 2, 0),
('CS251', 'Software Design', 25, 2, 0),
('CS263', 'Ethics for Software Design', 20, 2, 0),
('CS276', 'Programming Language', 25, 1, 0),
('CS353', 'Algorithm Analysis', 25, 2, 0),
('CS379', 'Introduction to Artificial Intelligence', 30, 1, 0),
('M120', 'Calculus I', 30, 6, 0),
('M126', 'Calculus II', 25, 6, 0),
('M128', 'Honors Calculus II', 25, 6, 0),
('M220', 'Elementary Linear Algebra', 20, 2, 0),
('M226', 'Multivariable Calculus', 25, 1, 0),
('M232', 'Differential Equations I', 20, 2, 0),
('M234', 'Discrete Math', 24, 1, 0),
('M242', 'Modern Computational Math', 24, 2, 0),
('M244', 'Real Analysis', 18, 2, 0),
('M252', 'Abstract Algebra', 24, 2, 0),
('M262', 'Probability Theory', 18, 2, 0),
('M320', 'Advanced Linear Algebra', 20, 1, 0),
('M332', 'Differential Equations II', 20, 1, 0),
('SDS164', 'Introduction to Data Science', 30, 2, 1),
('SDS172', 'Introduction to Statistics ', 30, 5, 1),
('SDS250', 'Principle of Data Visualization', 30, 1, 0),
('SDS264', 'Advanced Data Science', 30, 1, 0),
('SDS272', 'Statistical Modelling', 30, 2, 0),
('SDS322', 'Statistical Theory', 30, 1, 0),
('SDS341', 'Algorithms for Decision Making', 30, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CourseCountedToMajor`
--

CREATE TABLE `CourseCountedToMajor` (
  `major_code` varchar(3) NOT NULL,
  `course_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CourseCountedToMajor`
--

INSERT INTO `CourseCountedToMajor` (`major_code`, `course_id`) VALUES
('CS', 'CS121'),
('CS', 'CS221'),
('CS', 'CS241'),
('CS', 'CS251'),
('CS', 'CS263'),
('CS', 'CS276'),
('CS', 'CS353'),
('CS', 'CS379'),
('CS', 'M220'),
('CS', 'M234'),
('CS', 'SDS341'),
('M', 'CS353'),
('M', 'M120'),
('M', 'M126'),
('M', 'M128'),
('M', 'M220'),
('M', 'M226'),
('M', 'M232'),
('M', 'M234'),
('M', 'M242'),
('M', 'M244'),
('M', 'M252'),
('M', 'M262'),
('M', 'M320'),
('M', 'M332'),
('M', 'SDS264'),
('M', 'SDS272'),
('M', 'SDS322'),
('M', 'SDS341'),
('SDS', 'M220'),
('SDS', 'SDS164'),
('SDS', 'SDS172'),
('SDS', 'SDS250'),
('SDS', 'SDS264'),
('SDS', 'SDS272'),
('SDS', 'SDS322'),
('SDS', 'SDS341');

-- --------------------------------------------------------

--
-- Table structure for table `CourseRegistration`
--

CREATE TABLE `CourseRegistration` (
  `class_year` year(4) NOT NULL,
  `semester` varchar(1) NOT NULL CHECK (`semester` in ('F','S','W')),
  `course_id` varchar(10) DEFAULT NULL,
  `section` varchar(1) DEFAULT NULL,
  `lecturer_id` int(10) UNSIGNED DEFAULT NULL,
  `filled_spot` int(10) UNSIGNED DEFAULT NULL,
  `num_of_overriden_requests` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CourseRegistration`
--

INSERT INTO `CourseRegistration` (`class_year`, `semester`, `course_id`, `section`, `lecturer_id`, `filled_spot`, `num_of_overriden_requests`) VALUES
('2024', 'F', 'M120', 'A', 9, 25, 10),
('2024', 'F', 'M120', 'B', 10, 20, 0),
('2024', 'F', 'M120', 'C', 9, 15, 0),
('2024', 'F', 'M120', 'D', 10, 24, 0),
('2024', 'F', 'M120', 'E', 9, 20, 0),
('2024', 'F', 'M120', 'F', 9, 26, 5),
('2024', 'F', 'M126', 'A', 10, 25, 0),
('2024', 'F', 'M126', 'B', 9, 25, 2),
('2024', 'F', 'M126', 'C', 10, 25, 2),
('2024', 'F', 'M126', 'D', 9, 20, 0),
('2024', 'F', 'M126', 'E', 10, 21, 0),
('2024', 'F', 'M126', 'F', 9, 15, 0),
('2024', 'F', 'M128', '', 6, 25, 0),
('2024', 'F', 'M220', 'A', 14, 15, 0),
('2024', 'F', 'M220', 'B', 14, 20, 10),
('2024', 'F', 'M226', '', 9, 20, 0),
('2024', 'F', 'M232', 'A', 10, 20, 0),
('2024', 'F', 'M232', 'B', 10, 20, 5),
('2024', 'F', 'M234', '', 1, 25, 15),
('2024', 'F', 'M242', 'A', 6, 23, 0),
('2024', 'F', 'M242', 'B', 6, 24, 1),
('2024', 'F', 'M244', 'A', 14, 18, 10),
('2024', 'F', 'M244', 'B', 14, 20, 5),
('2024', 'F', 'M252', 'A', 1, 24, 2),
('2024', 'F', 'M252', 'B', 1, 24, 3),
('2024', 'F', 'M262', 'A', 14, 16, 0),
('2024', 'F', 'M262', 'B', 9, 15, 0),
('2024', 'F', 'M320', '', 14, 18, 0),
('2024', 'F', 'M332', '', 10, 17, 0),
('2024', 'F', 'CS121', 'A', 2, 30, 5),
('2024', 'F', 'CS121', 'B', 2, 29, 0),
('2024', 'F', 'CS121', 'C', 7, 30, 10),
('2024', 'F', 'CS221', 'A', 11, 30, 6),
('2024', 'F', 'CS221', 'B', 11, 30, 10),
('2024', 'F', 'CS241', '', 3, 25, 10),
('2024', 'F', 'CS251', 'A', 2, 25, 6),
('2024', 'F', 'CS251', 'B', 8, 25, 5),
('2024', 'F', 'CS263', '', 3, 20, 5),
('2024', 'F', 'CS276', '', 8, 25, 5),
('2024', 'F', 'CS353', 'A', 2, 25, 5),
('2024', 'F', 'CS353', 'B', 3, 25, 5),
('2024', 'F', 'CS379', '', 11, 32, 10),
('2024', 'F', 'SDS164', 'A', 4, 30, 10),
('2024', 'F', 'SDS164', 'B', 4, 30, 5),
('2024', 'F', 'SDS172', 'A', 13, 30, 10),
('2024', 'F', 'SDS172', 'B', 12, 30, 8),
('2024', 'F', 'SDS172', 'C', 13, 30, 5),
('2024', 'F', 'SDS172', 'D', 12, 25, 0),
('2024', 'F', 'SDS172', 'E', 13, 29, 0),
('2024', 'F', 'SDS250', '', 12, 32, 15),
('2024', 'F', 'SDS264', '', 4, 30, 5),
('2024', 'F', 'SDS272', 'A', 4, 30, 10),
('2024', 'F', 'SDS272', 'B', 4, 30, 5),
('2024', 'F', 'SDS322', '', 4, 25, 0),
('2024', 'F', 'SDS341', '', 5, 30, 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dean_list`
-- (See below for the actual view)
--
CREATE TABLE `dean_list` (
`first_name` varchar(50)
,`last_name` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `DegreePath`
--

CREATE TABLE `DegreePath` (
  `student_id` int(10) UNSIGNED DEFAULT NULL,
  `major_code` varchar(3) DEFAULT NULL CHECK (`major_code` in ('M','CS','SDS')),
  `num_courses_taken` int(10) UNSIGNED DEFAULT 0,
  `finish_major` tinyint(1) DEFAULT 0,
  `major_gpa` double(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DegreePath`
--

INSERT INTO `DegreePath` (`student_id`, `major_code`, `num_courses_taken`, `finish_major`, `major_gpa`) VALUES
(1, 'M', 9, 1, 4.00),
(1, 'CS', 7, 1, 4.00),
(1, 'SDS', 5, 0, 4.00),
(2, 'SDS', 8, 1, 3.83),
(3, 'M', 6, 0, 3.95),
(4, 'SDS', 3, 0, 3.80),
(5, 'CS', 3, 0, 3.90),
(5, 'SDS', 2, 0, 4.00),
(4, 'CS', 6, 0, 3.45);

--
-- Triggers `DegreePath`
--
DELIMITER $$
CREATE TRIGGER `MajorCompleted` BEFORE UPDATE ON `DegreePath` FOR EACH ROW BEGIN
    DECLARE NumCoursesRequired INT;
    SELECT num_courses_required INTO NumCoursesRequired 
    FROM Major 
    WHERE major_code = OLD.major_code;
    IF (NEW.num_courses_taken >= NumCoursesRequired AND NEW.major_gpa >= 2.5) THEN 
        SET NEW.finish_major = true;
    ELSE
        SET NEW.finish_major = false;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `directors`
-- (See below for the actual view)
--
CREATE TABLE `directors` (
`faculty_id` int(10) unsigned
,`first_name` varchar(50)
,`last_name` varchar(50)
,`major` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `Faculty`
--

CREATE TABLE `Faculty` (
  `faculty_id` int(10) UNSIGNED NOT NULL,
  `pre_fix` varchar(3) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Faculty`
--

INSERT INTO `Faculty` (`faculty_id`, `pre_fix`, `first_name`, `last_name`) VALUES
(1, 'Dr.', 'Ryota', 'Matsuura'),
(2, 'Dr.', 'Olaf', 'Hall-Holt'),
(3, 'Dr.', 'Melissa', 'Lynn'),
(4, 'Dr.', 'Paul', 'Roback'),
(5, 'Dr.', 'Jaime', 'Davila'),
(6, 'Dr.', 'Matthew', 'Wright'),
(7, '', 'Kim', 'Mandery'),
(8, 'Dr.', 'Will', 'Leeson'),
(9, 'Dr.', 'Jane', 'Willows'),
(10, 'Dr.', 'Matt', 'Prinkles'),
(11, 'Dr', 'Alice', 'Smith'),
(12, 'Dr.', 'Bob', 'Johnson'),
(13, 'Dr.', 'Ian', 'Taylor'),
(14, 'Dr.', 'Jack', 'Anderson');

-- --------------------------------------------------------

--
-- Stand-in structure for view `faculty_classes`
-- (See below for the actual view)
--
CREATE TABLE `faculty_classes` (
`faculty_id` int(10) unsigned
,`first_name` varchar(50)
,`last_name` varchar(50)
,`number_classes_teach` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `Grade`
--

CREATE TABLE `Grade` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `course_id` varchar(10) NOT NULL,
  `letter_grade` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Grade`
--

INSERT INTO `Grade` (`student_id`, `course_id`, `letter_grade`) VALUES
(1, 'CS121', 'A'),
(1, 'CS241', 'A'),
(1, 'CS251', 'A'),
(1, 'M128', 'A'),
(1, 'M220', 'A'),
(1, 'M234', 'A'),
(1, 'M242', 'A'),
(1, 'SDS264', 'A'),
(1, 'SDS341', 'A'),
(2, 'M220', 'A'),
(2, 'M262', 'A'),
(2, 'SDS164', 'A'),
(2, 'SDS264', 'A'),
(2, 'SDS322', 'A'),
(2, 'SDS341', 'A'),
(3, 'CS353', 'A'),
(3, 'M220', 'A'),
(3, 'M234', 'A'),
(3, 'SDS341', 'A'),
(4, 'CS121', 'A'),
(4, 'SDS164', 'A'),
(5, 'M126', 'A'),
(5, 'SDS172', 'A'),
(1, 'CS221', 'A+'),
(1, 'CS353', 'A+'),
(1, 'M120', 'A+'),
(1, 'M262', 'A+'),
(1, 'SDS164', 'A+'),
(1, 'SDS172', 'A+'),
(2, 'M126', 'A+'),
(3, 'CS241', 'A+'),
(3, 'M120', 'A+'),
(5, 'CS221', 'A+'),
(5, 'M220', 'A+'),
(2, 'SDS172', 'A-'),
(2, 'SDS272', 'A-'),
(3, 'CS121', 'A-'),
(3, 'CS221', 'A-'),
(3, 'CS251', 'A-'),
(3, 'M126', 'A-'),
(4, 'CS241', 'A-'),
(4, 'M120', 'A-'),
(4, 'M220', 'A-'),
(4, 'SDS172', 'A-'),
(5, 'CS121', 'A-'),
(4, 'CS221', 'B'),
(4, 'M234', 'B'),
(2, 'SDS250', 'B+'),
(4, 'CS251', 'B+'),
(4, 'M126', 'B+');

--
-- Triggers `Grade`
--
DELIMITER $$
CREATE TRIGGER `GradeAdd` AFTER INSERT ON `Grade` FOR EACH ROW BEGIN
    DECLARE GradeNumeric DECIMAL(3,2);

    -- Convert letter grade to numeric
    SELECT numeric_grade INTO GradeNumeric
    FROM LetterGrade
    WHERE letter = NEW.letter_grade;

    -- Update all DegreePath rows where the course is counted toward a major
    UPDATE DegreePath DP
    JOIN CourseCountedToMajor CCM ON CCM.major_code = DP.major_code
    SET DP.major_gpa = (DP.num_courses_taken * DP.major_gpa + GradeNumeric) / (DP.num_courses_taken + 1),
        DP.num_courses_taken = DP.num_courses_taken + 1
    WHERE DP.student_id = NEW.student_id
      AND CCM.course_id = NEW.course_id;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `GradeDelete` AFTER DELETE ON `Grade` FOR EACH ROW BEGIN
    DECLARE GradeNumeric DECIMAL(3,2);

    -- Convert letter grade to numeric
    SELECT numeric_grade INTO GradeNumeric 
    FROM LetterGrade 
    WHERE letter = OLD.letter_grade;

    -- Update DegreePath for all majors where the deleted course counts
    UPDATE DegreePath DP
    JOIN CourseCountedToMajor CCM ON DP.major_code = CCM.major_code
    SET 
        major_gpa = CASE 
            WHEN DP.num_courses_taken = 1 THEN 0.0
            ELSE (DP.num_courses_taken * DP.major_gpa - GradeNumeric) / (DP.num_courses_taken - 1)
        END,
        num_courses_taken = DP.num_courses_taken - 1
    WHERE DP.student_id = OLD.student_id
      AND CCM.course_id = OLD.course_id;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `GradeUpdate` AFTER UPDATE ON `Grade` FOR EACH ROW BEGIN
    DECLARE OldGradeNumeric DECIMAL(3,2);
    DECLARE NewGradeNumeric DECIMAL(3,2);

    -- Convert both old and new letter grades
    SELECT numeric_grade INTO OldGradeNumeric 
    FROM LetterGrade 
    WHERE letter = OLD.letter_grade;

    SELECT numeric_grade INTO NewGradeNumeric 
    FROM LetterGrade 
    WHERE letter = NEW.letter_grade;

    -- Update GPA for majors that count this course
    UPDATE DegreePath DP
    JOIN CourseCountedToMajor CCM ON DP.major_code = CCM.major_code
    SET major_gpa = 
        (DP.num_courses_taken * DP.major_gpa - OldGradeNumeric + NewGradeNumeric) 
        / DP.num_courses_taken
    WHERE DP.student_id = NEW.student_id
      AND CCM.course_id = OLD.course_id;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `graduate_ready`
-- (See below for the actual view)
--
CREATE TABLE `graduate_ready` (
`first_name` varchar(50)
,`last_name` varchar(50)
,`class_year` year(4)
,`honor` varchar(15)
);

-- --------------------------------------------------------

--
-- Table structure for table `LetterGrade`
--

CREATE TABLE `LetterGrade` (
  `letter` varchar(2) NOT NULL,
  `numeric_grade` double(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `LetterGrade`
--

INSERT INTO `LetterGrade` (`letter`, `numeric_grade`) VALUES
('A', 4.00),
('A+', 4.00),
('A-', 3.70),
('B', 3.00),
('B+', 3.30),
('B-', 2.70),
('C', 2.00),
('C+', 2.30),
('C-', 1.70),
('D', 1.00),
('D+', 1.30),
('F', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `Major`
--

CREATE TABLE `Major` (
  `major_code` varchar(3) NOT NULL,
  `major_name` varchar(50) NOT NULL,
  `num_courses_required` int(10) UNSIGNED NOT NULL,
  `num_of_students_major` int(10) UNSIGNED DEFAULT 0,
  `major_director` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Major`
--

INSERT INTO `Major` (`major_code`, `major_name`, `num_courses_required`, `num_of_students_major`, `major_director`) VALUES
('CS', 'Computer Science', 7, 3, 1),
('M', 'Math', 8, 2, 6),
('SDS', 'Statistics and Data Science', 6, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `class_year` year(4) NOT NULL,
  `math_major` tinyint(1) NOT NULL,
  `cs_major` tinyint(1) NOT NULL,
  `sds_major` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `class_year`, `math_major`, `cs_major`, `sds_major`) VALUES
(1, 'Fayellete', 'Tran', '2003-11-15', '2026', 1, 1, 1),
(2, 'Khae', 'Trinh', '2001-03-01', '2023', 0, 0, 1),
(3, 'Quinn', 'Jane', '2003-06-01', '2030', 1, 0, 0),
(4, 'Anna', 'Ally', '2004-03-18', '2027', 0, 1, 1),
(5, 'Mindy', 'Cian', '2006-06-01', '2028', 0, 1, 1);

--
-- Triggers `Student`
--
DELIMITER $$
CREATE TRIGGER `DegreePathAdd` AFTER INSERT ON `Student` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DegreePathDelete` AFTER DELETE ON `Student` FOR EACH ROW BEGIN
    DELETE FROM DegreePath WHERE student_id = OLD.student_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DegreePathUpdate` AFTER UPDATE ON `Student` FOR EACH ROW BEGIN
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

    -- MATH MAJOR LOGIC
    -- MATH major
    IF NEW.math_major = 1 AND OLD.math_major = 0 THEN
        SELECT COUNT(*) INTO MathCourseTaken
        FROM Grade G
        JOIN CourseCountedToMajor CCM ON G.course_id = CCM.course_id
        WHERE G.student_id = NEW.student_id AND CCM.major_code = 'M';

        IF MathCourseTaken = 0 THEN
            INSERT INTO DegreePath VALUES (NEW.student_id, 'M', 0, FALSE, 0.0);
        ELSE
            SELECT SUM(LG.numeric_grade)/COUNT(*) INTO MathGPA
            FROM Grade G
            JOIN CourseCountedToMajor CCM ON G.course_id = CCM.course_id
            JOIN LetterGrade LG ON G.letter_grade = LG.letter
            WHERE G.student_id = NEW.student_id AND CCM.major_code = 'M';

            SELECT num_courses_required INTO MathReq FROM Major WHERE major_code = 'M';

            INSERT INTO DegreePath
            VALUES (NEW.student_id, 'M', MathCourseTaken, (MathCourseTaken >= MathReq), MathGPA);
        END IF;

        
    ELSEIF NEW.math_major = 0 AND OLD.math_major = 1 THEN
        DELETE FROM DegreePath WHERE student_id = OLD.student_id AND major_code = 'M';
    END IF;

    -- CS MAJOR LOGIC
    IF NEW.cs_major = 1 AND OLD.cs_major = 0 THEN
        SELECT COUNT(*) INTO CSCourseTaken
        FROM Grade G
        JOIN CourseCountedToMajor CCM ON G.course_id = CCM.course_id
        WHERE G.student_id = NEW.student_id AND CCM.major_code = 'CS';

        IF CSCourseTaken = 0 THEN
            INSERT INTO DegreePath VALUES (NEW.student_id, 'CS', 0, FALSE, 0.0);
        ELSE
            SELECT SUM(LG.numeric_grade)/COUNT(*) INTO CSGPA
            FROM Grade G
            JOIN CourseCountedToMajor CCM ON G.course_id = CCM.course_id
            JOIN LetterGrade LG ON G.letter_grade = LG.letter
            WHERE G.student_id = NEW.student_id AND CCM.major_code = 'CS';

            SELECT num_courses_required INTO CSReq FROM Major WHERE major_code = 'CS';

            INSERT INTO DegreePath
            VALUES (NEW.student_id, 'CS', CSCourseTaken, (CSCourseTaken >= CSReq), CSGPA);
        END IF;

    ELSEIF NEW.cs_major = 0 AND OLD.cs_major = 1 THEN
        DELETE FROM DegreePath WHERE student_id = OLD.student_id AND major_code = 'CS';
    END IF;

    -- SDS MAJOR LOGIC
    IF NEW.sds_major = 1 AND OLD.sds_major = 0 THEN
        SELECT COUNT(*) INTO SDSCourseTaken
        FROM Grade G
        JOIN CourseCountedToMajor CCM ON G.course_id = CCM.course_id
        WHERE G.student_id = NEW.student_id AND CCM.major_code = 'SDS';

        IF SDSCourseTaken = 0 THEN
            INSERT INTO DegreePath VALUES (NEW.student_id, 'SDS', 0, FALSE, 0.0);
        ELSE
            SELECT SUM(LG.numeric_grade)/COUNT(*) INTO SDSGPA
            FROM Grade G
            JOIN CourseCountedToMajor CCM ON G.course_id = CCM.course_id
            JOIN LetterGrade LG ON G.letter_grade = LG.letter
            WHERE G.student_id = NEW.student_id AND CCM.major_code = 'SDS';

            SELECT num_courses_required INTO SDSReq FROM Major WHERE major_code = 'SDS';

            INSERT INTO DegreePath
            VALUES (NEW.student_id, 'SDS', SDSCourseTaken, (SDSCourseTaken >= SDSReq), SDSGPA);
        END IF;

    ELSEIF NEW.sds_major = 0 AND OLD.sds_major = 1 THEN
        DELETE FROM DegreePath WHERE student_id = OLD.student_id AND major_code = 'SDS';
    END IF;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `MajorCountAdd` AFTER INSERT ON `Student` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `MajorCountDelete` AFTER DELETE ON `Student` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `MajorCountUpdate` AFTER UPDATE ON `Student` FOR EACH ROW BEGIN
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

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `dean_list`
--
DROP TABLE IF EXISTS `dean_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`knguyent`@`172.%` SQL SECURITY DEFINER VIEW `dean_list`  AS SELECT DISTINCT `s`.`first_name` AS `first_name`, `s`.`last_name` AS `last_name` FROM (`Student` `s` join `DegreePath` `d` on(`s`.`student_id` = `d`.`student_id`)) WHERE `d`.`major_gpa` >= 3.75 ;

-- --------------------------------------------------------

--
-- Structure for view `directors`
--
DROP TABLE IF EXISTS `directors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`knguyent`@`172.%` SQL SECURITY DEFINER VIEW `directors`  AS SELECT `f`.`faculty_id` AS `faculty_id`, `f`.`first_name` AS `first_name`, `f`.`last_name` AS `last_name`, `m`.`major_name` AS `major` FROM (`Major` `m` join `Faculty` `f` on(`m`.`major_director` = `f`.`faculty_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `faculty_classes`
--
DROP TABLE IF EXISTS `faculty_classes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`knguyent`@`172.%` SQL SECURITY DEFINER VIEW `faculty_classes`  AS SELECT `f`.`faculty_id` AS `faculty_id`, `f`.`first_name` AS `first_name`, `f`.`last_name` AS `last_name`, count(0) AS `number_classes_teach` FROM (`Faculty` `f` join `CourseRegistration` `c` on(`f`.`faculty_id` = `c`.`lecturer_id`)) GROUP BY `f`.`faculty_id` ;

-- --------------------------------------------------------

--
-- Structure for view `graduate_ready`
--
DROP TABLE IF EXISTS `graduate_ready`;

CREATE ALGORITHM=UNDEFINED DEFINER=`knguyent`@`172.%` SQL SECURITY DEFINER VIEW `graduate_ready`  AS WITH helper AS (SELECT `s`.`student_id` AS `student_id`, CASE WHEN avg(`d`.`major_gpa`) >= 3.9 THEN 'Summa Cum Laude' WHEN avg(`d`.`major_gpa`) >= 3.75 THEN 'Magna Cum Laude' WHEN avg(`d`.`major_gpa`) >= 3.6 THEN 'Cum Laude' ELSE NULL END AS `honor`, CASE WHEN sum(case when `d`.`finish_major` = 1 then 1 else 0 end) = `s`.`math_major` + `s`.`cs_major` + `s`.`sds_major` THEN 1 ELSE 0 END AS `graduate_ready` FROM (`Student` `s` join `DegreePath` `d` on(`s`.`student_id` = `d`.`student_id`)) GROUP BY `s`.`student_id`) SELECT `s`.`first_name` AS `first_name`, `s`.`last_name` AS `last_name`, `s`.`class_year` AS `class_year`, `h`.`honor` AS `honor` FROM (`Student` `s` join `helper` `h` on(`s`.`student_id` = `h`.`student_id`)) WHERE `h`.`graduate_ready` = 11  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_name` (`course_name`);

--
-- Indexes for table `CourseCountedToMajor`
--
ALTER TABLE `CourseCountedToMajor`
  ADD PRIMARY KEY (`major_code`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `CourseRegistration`
--
ALTER TABLE `CourseRegistration`
  ADD UNIQUE KEY `class_year` (`class_year`,`semester`,`course_id`,`section`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `lecturer_id` (`lecturer_id`);

--
-- Indexes for table `DegreePath`
--
ALTER TABLE `DegreePath`
  ADD UNIQUE KEY `student_id` (`student_id`,`major_code`),
  ADD KEY `major_code` (`major_code`);

--
-- Indexes for table `Faculty`
--
ALTER TABLE `Faculty`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `Grade`
--
ALTER TABLE `Grade`
  ADD PRIMARY KEY (`student_id`,`course_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `letter_grade` (`letter_grade`);

--
-- Indexes for table `LetterGrade`
--
ALTER TABLE `LetterGrade`
  ADD PRIMARY KEY (`letter`);

--
-- Indexes for table `Major`
--
ALTER TABLE `Major`
  ADD PRIMARY KEY (`major_code`),
  ADD KEY `major_director` (`major_director`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Faculty`
--
ALTER TABLE `Faculty`
  MODIFY `faculty_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `student_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `CourseCountedToMajor`
--
ALTER TABLE `CourseCountedToMajor`
  ADD CONSTRAINT `CourseCountedToMajor_ibfk_1` FOREIGN KEY (`major_code`) REFERENCES `Major` (`major_code`),
  ADD CONSTRAINT `CourseCountedToMajor_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`);

--
-- Constraints for table `CourseRegistration`
--
ALTER TABLE `CourseRegistration`
  ADD CONSTRAINT `CourseRegistration_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`),
  ADD CONSTRAINT `CourseRegistration_ibfk_2` FOREIGN KEY (`lecturer_id`) REFERENCES `Faculty` (`faculty_id`);

--
-- Constraints for table `DegreePath`
--
ALTER TABLE `DegreePath`
  ADD CONSTRAINT `DegreePath_ibfk_1` FOREIGN KEY (`major_code`) REFERENCES `Major` (`major_code`),
  ADD CONSTRAINT `DegreePath_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`);

--
-- Constraints for table `Grade`
--
ALTER TABLE `Grade`
  ADD CONSTRAINT `Grade_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Student` (`student_id`),
  ADD CONSTRAINT `Grade_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `Course` (`course_id`),
  ADD CONSTRAINT `Grade_ibfk_3` FOREIGN KEY (`letter_grade`) REFERENCES `LetterGrade` (`letter`);

--
-- Constraints for table `Major`
--
ALTER TABLE `Major`
  ADD CONSTRAINT `Major_ibfk_1` FOREIGN KEY (`major_director`) REFERENCES `Faculty` (`faculty_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

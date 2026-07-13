
CREATE DATABASE student_performance_;
USE student_performance_;

/*==========================================================
	RENAME TABLE
(after importing the CSV)
==========================================================*/

ALTER TABLE studentsperformance
RENAME TO students;

/*==========================================================
	VIEW DATA
==========================================================*/

SELECT * FROM students;

SELECT COUNT(*) AS total_students
FROM students;

/*==========================================================
	RENAME COLUMNS
==========================================================*/

ALTER TABLE students
CHANGE `test preparation course` course_completion VARCHAR(20);

ALTER TABLE students
CHANGE `parental level of education` parent_education VARCHAR(50);

ALTER TABLE students
CHANGE `lunch` meal_type VARCHAR(30);

ALTER TABLE students
CHANGE `race/ethnicity` race VARCHAR(10);

Show Columns from students;

/*==========================================================
	DATA CLEANING - RENAME ROW NAMES
==========================================================*/

SET SQL_SAFE_UPDATES = 0;

UPDATE students
SET meal_type = 'Free'
WHERE meal_type = 'free/reduced';

UPDATE students
SET meal_type = 'Standard'
WHERE meal_type = 'standard';

UPDATE students
SET parent_education = 'High School (Incomplete)'
WHERE parent_education = 'some high school';

UPDATE students
SET parent_education = 'College (Incomplete)'
WHERE parent_education = 'some college';

UPDATE students
SET parent_education = 'Associate Degree'
WHERE parent_education = "associate's degree";

UPDATE students
SET parent_education = "Bachelor's Degree"
WHERE parent_education = "bachelor's degree";

UPDATE students
SET parent_education = "Master's Degree"
WHERE parent_education = "master's degree";

UPDATE students
SET parent_education = "High School Graduate"
WHERE parent_education = "high school";

SET SQL_SAFE_UPDATES = 1;

/*==========================================================
	BASIC SELECT
==========================================================*/

SELECT * FROM students;

SELECT gender
FROM students;

SELECT DISTINCT gender
FROM students;

SELECT DISTINCT race
FROM students;

SELECT DISTINCT parent_education
FROM students;

/*==========================================================
	COUNT()
==========================================================*/

SELECT gender, COUNT(*) AS total_students
FROM students
GROUP BY gender;

SELECT meal_type, COUNT(*) AS total_students
FROM students
GROUP BY meal_type;

SELECT course_completion, COUNT(*) AS total_students
FROM students
GROUP BY course_completion;

SELECT parent_education, COUNT(*) AS total_students
FROM students
GROUP BY parent_education;

SELECT race, COUNT(*) AS total_students
FROM students
GROUP BY race
ORDER BY race;

/*==========================================================
	AVERAGE SCORES
==========================================================*/

SELECT gender,
AVG(`math score`) AS avg_math
FROM students
GROUP BY gender;

SELECT gender,
AVG(`reading score`) AS avg_reading
FROM students
GROUP BY gender;

SELECT gender,
AVG(`writing score`) AS avg_writing
FROM students
GROUP BY gender;

/*==========================================================
	MAXIMUM SCORES
==========================================================*/

SELECT MAX(`math score`) AS highest_math
FROM students;

SELECT MAX(`reading score`) AS highest_reading
FROM students;

SELECT MAX(`writing score`) AS highest_writing
FROM students;

/*==========================================================
	MINIMUM SCORES
==========================================================*/

SELECT MIN(`math score`) AS lowest_math
FROM students;

SELECT MIN(`reading score`) AS lowest_reading
FROM students;

SELECT MIN(`writing score`) AS lowest_writing
FROM students;

/*==========================================================
	PERFECT SCORES (TOP STUDENTS)
==========================================================*/

SELECT gender, COUNT(*) AS perfect_math
FROM students
WHERE `math score` = 100
GROUP BY gender;

SELECT gender, COUNT(*) AS perfect_reading
FROM students
WHERE `reading score` = 100
GROUP BY gender;

SELECT gender, COUNT(*) AS perfect_writing
FROM students
WHERE `writing score` = 100
GROUP BY gender;

/*==========================================================
	FAILED STUDENTS (<35)
==========================================================*/

SELECT gender, COUNT(*) AS failed_math
FROM students
WHERE `math score` < 35
GROUP BY gender;

SELECT gender, COUNT(*) AS failed_reading
FROM students
WHERE `reading score` < 35
GROUP BY gender;

SELECT gender, COUNT(*) AS failed_writing
FROM students
WHERE `writing score` < 35
GROUP BY gender;

/*==========================================================
	WHERE 	CLAUSE
==========================================================*/

SELECT *
FROM students
WHERE gender='female';

SELECT *
FROM students
WHERE gender='male';

SELECT *
FROM students
WHERE `math score`>=90;

/*==========================================================
	BETWEEN		OPERATOR
==========================================================*/

SELECT *
FROM students
WHERE `math score`
BETWEEN 80 AND 100;

/*==========================================================
	IN		OPERATOR
==========================================================*/

SELECT *
FROM students
WHERE race IN ('group A','group B');

/*==========================================================
	LIKE	OPERATOR
==========================================================*/

SELECT *
FROM students
WHERE parent_education
LIKE '%Degree%';

/*==========================================================
	AND 	OPERATOR
==========================================================*/

SELECT *
FROM students
WHERE `math score`>=80
AND `reading score`>=80;

/*==========================================================
	OR		OPERATOR
==========================================================*/

SELECT *
FROM students
WHERE `math score`>=95
OR `writing score`>=95;

/*==========================================================
	NOT 	OPERATOR
==========================================================*/

SELECT *
FROM students
WHERE NOT gender='female';

/*==========================================================
	ORDER BY CLAUSE
==========================================================*/

SELECT *
FROM students
ORDER BY `math score` DESC;

SELECT *
FROM students
ORDER BY `reading score` DESC;

SELECT *
FROM students
ORDER BY `writing score` DESC;

/*==========================================================
	GROUP BY CLAUSE
==========================================================*/

SELECT race,
COUNT(*) AS total_students
FROM students
GROUP BY race;

SELECT parent_education,
COUNT(*) AS total_students
FROM students
GROUP BY parent_education;

/*==========================================================
	HAVING CLAUSE
==========================================================*/

SELECT race,
AVG(`math score`) AS avg_math
FROM students
GROUP BY race
HAVING AVG(`math score`)>65;

SELECT gender,
COUNT(*) AS total_students
FROM students
GROUP BY gender
HAVING COUNT(*)>450;

/*==========================================================
	INSERT
==========================================================*/

INSERT INTO students
(gender,race,parent_education,meal_type,course_completion,
`math score`,`reading score`,`writing score`)
VALUES
('female','group A','Bachelor''s Degree',
'Standard','completed',95,96,97);

/*==========================================================
	TO VERIFY INSERT
==========================================================*/

SELECT *
FROM students
ORDER BY `math score` DESC;

/*==========================================================
	DELETE
==========================================================*/

DELETE FROM students
WHERE gender='female'
AND race='group A'
AND `math score`=95
AND `reading score`=96
AND `writing score`=97;

/*==========================================================
	TO VERIFY DELETE
==========================================================*/

SELECT COUNT(*)
FROM students;

/*==========================================================
	SUMMARY
==========================================================*/

SELECT
COUNT(*) AS Total_Students,
AVG(`math score`) AS Average_Math,
AVG(`reading score`) AS Average_Reading,
AVG(`writing score`) AS Average_Writing
FROM students;

/*==========================================================
                THE END 
==========================================================*/
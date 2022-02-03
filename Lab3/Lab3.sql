--1a
SELECT course_id FROM course WHERE credits > 3;
--1b
SELECT room_number FROM classroom WHERE building = 'Watson' OR building = 'Packard';
--1c
SELECT course_id FROM course WHERE dept_name = 'Comp. Sci.';
--1d
SELECT course_id FROM section WHERE semester = 'Fall';
--1e
SELECT id FROM student WHERE tot_cred > 45 AND tot_cred < 90;
--1f
SELECT id FROM student WHERE name LIKE '%a' OR name LIKE '%e' OR name LIKE '%i'
                          OR name LIKE '%o' OR name LIKE '%u' OR name LIKE '%y';
--1g
SELECT course_id FROM prereq WHERE prereq_id = 'CS-101';

--2a
SELECT dept_name, count(dept_name) AS Depar_name, avg(salary) AS AVGSalary FROM instructor
GROUP BY dept_name HAVING count(dept_name) >= 1 ORDER BY AVGSalary;
--2b-
--2c-
--2d-
--2e
SELECT name FROM instructor WHERE dept_name='Music' OR dept_name='Biology' OR dept_name='Philosophy';
--2f
SELECT DISTINCT id FROM teaches WHERE year = 2018 AND id NOT IN (SELECT DISTINCT id FROM teaches WHERE year = 2017);

--3а
SELECT DISTINCT student.name FROM student, takes
WHERE student.dept_name = 'Comp. Sci.' AND takes.grade LIKE 'A%' AND student.id = takes.id ORDER BY name;
--3b
SELECT id FROM instructor
WHERE id IN (SELECT i_id FROM advisor WHERE s_id IN (SELECT id FROM takes WHERE grade NOT IN ('A-','A','B','B+')));
--3c
SELECT dept_name FROM department WHERE dept_name NOT IN(SELECT dept_name FROM student
WHERE id IN(SELECT id FROM takes WHERE grade ='C' OR grade='F'));
--3d
SELECT name FROM instructor
WHERE id IN(SELECT id FROM teaches WHERE course_id NOT IN(SELECT course_id FROM takes WHERE grade='A'));
--3e
SELECT DISTINCT course_id FROM section
WHERE time_slot_id IN(SELECT time_slot_id FROM time_slot WHERE end_hr < 13);
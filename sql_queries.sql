-- ### Select all rows from the `classes` table.

select * from classes;

 id |   name   | credits
----+----------+---------
  1 | CS 101   |       4
  2 | HIST 107 |       3
  3 | SPAN 210 |       3
  4 | PHYS 218 |       4
  5 | ART 118  |       2

-- ### Select the `name` and `credits` from the `classes` table where the number of credits is greater than 3.
select 
classes.name, 
classes.credits 
from classes
 where credits > 3;

name   | credits
----------+---------
 CS 101   |       4
 PHYS 218 |       4
(2 rows)

-- ### All rows from the `classes` table where credits is an even number.

select * from classes where credits % 2 = 0;

 id |   name   | credits
----+----------+---------
  1 | CS 101   |       4
  4 | PHYS 218 |       4
  5 | ART 118  |       2
(3 rows)

-- ### All of Tianna's enrollments that she hasn't yet received a grade for.
select classes.name, enrollments.class_id, enrollments.grade, students.first_name, students.last_name
from enrollments 
join students on enrollments.student_id = students.id
join classes on enrollments.class_id = classes.id
where grade is null AND students.first_name = 'Tianna';

 id | student_id | class_id | grade  | id | first_name | last_name | birthdate  | address_id
----+------------+----------+--------+----+------------+-----------+------------+------------
  2 |          1 |        3 | <NULL> |  1 | Tianna     | Lowe      | 1985-02-17 |          1
(1 row)
-- ### All of Tianna's enrollments that she hasn't yet received a grade for, selected by her first name, not her `student.id`
select classes.name, students.first_name, students.last_name, enrollments.class_id, enrollments.grade from students
    join enrollments on students.id = enrollments.student_id
    join classes on enrollments.class_id = classes.id
    where enrollments.grade is null AND students.first_name = 'Tianna';

name   | first_name | last_name | class_id | grade
----------+------------+-----------+----------+--------
 SPAN 210 | Tianna     | Lowe      |        3 | <NULL>


-- ### All of Tianna's enrollments that she hasn't yet received a grade for, selected by her first name, not her `student.id`, with the class name included in the result set.
select classes.name, students.first_name, students.last_name, enrollments.class_id, enrollments.grade from students
    join enrollments on students.id = enrollments.student_id
    join classes on enrollments.class_id = classes.id
    where enrollments.grade is null AND students.first_name = 'Tianna';

name   | first_name | last_name | class_id | grade
----------+------------+-----------+----------+--------
 SPAN 210 | Tianna     | Lowe      |        3 | <NULL>

-- ### All students born before 1986 who have a 't' in their first or last name.
    select students.first_name, students.last_name from students
    where
        students.first_name ilike %t% OR
        students.last_name ilike %t%
      
-- ### The average age of all the students.

-- ### Addresses that have a space in their city name.

-- ### Students & their addresses that live in a city with more than one word in the city name.

-- ### The average number of credits for classes offered at the school.

-- ### The first and last name of all students who have received an 'A'.

-- ### Each student's first name and the total credits they've enrolled in

-- ### The total number of credits each student has received a grade for.

-- ### All enrollments, including the class name.

-- ### Students born between 1982-1985 (inclusive).

-- ### Insert a new enrollment recording that Andre Rohan took PHYS 218 and got an A.
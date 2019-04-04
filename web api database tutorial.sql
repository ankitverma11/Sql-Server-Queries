CREATE TABLE students(
   sid  int  not null, 
   name text not null,
 primary key(sid)
);

CREATE TABLE teachers(
   tid  int  not null,
   name text not null, 
 primary key(tid)
);

CREATE TABLE subjects(
   subid int  not null,
   name  text not null,
 primary key(subid)
);


CREATE TABLE grades(
  studentID int not null references students(sid),
  teacherID int not null references teachers(tid),
  subjectID int not null references subjects(subid),
  grade varchar(3),
 primary key(studentID, teacherID, subjectID)
);


--
-- SQL as DML: Data Manipulation Language -- Add test data to the tables.
--
INSERT INTO students (sid, name) VALUES(1, 'Simon');
INSERT INTO students (sid, name) VALUES(2, 'Alvin');
INSERT INTO students (sid, name) VALUES(3, 'Theo');
INSERT INTO students (sid, name) VALUES(4, 'Brittany');
INSERT INTO students (sid, name) VALUES(5, 'Jenette');
INSERT INTO students (sid, name) VALUES(6, 'Elenor');
INSERT INTO students (sid, name) VALUES(7, 'Stu');

select *
from Students;

INSERT INTO teachers (tid, name) VALUES (1, 'Washington');
INSERT INTO teachers (tid, name) VALUES (2, 'Adams');
INSERT INTO teachers (tid, name) VALUES (3, 'Jefferson');
INSERT INTO teachers (tid, name) VALUES (4, 'Lincoln');

select *
from teachers;

INSERT INTO subjects (subid, name) VALUES (1, 'History');
INSERT INTO subjects (subid, name) VALUES (2, 'Biology');
INSERT INTO subjects (subid, name) VALUES (3, 'SF');

select *
from grades;

INSERT INTO grades (studentID, teacherID, subjectID, grade) VALUES (1, 2, 1, 'A');
INSERT INTO grades (studentID, teacherID, subjectID, grade) VALUES (1, 2, 2, 'B');
INSERT INTO grades (studentID, teacherID, subjectID, grade) VALUES (7, 4, 3, 'C+');
INSERT INTO grades (studentID, teacherID, subjectID, grade) VALUES (7, 3, 2, 'F');
INSERT INTO grades (studentID, teacherID, subjectID, grade) VALUES (6, 2, 1, 'B+');
INSERT INTO grades (studentID, teacherID, subjectID, grade) VALUES (2, 4, 3, 'C');
INSERT INTO grades (studentID, teacherID, subjectID, grade) VALUES (3, 4, 3, 'B');
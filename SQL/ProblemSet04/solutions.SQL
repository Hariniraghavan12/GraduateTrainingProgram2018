create database problemset04;
use problemset04;

create table Highschooler(ID int,name varchar(40),grade int);
create table Friend(ID1 int,ID2 int);
create table Likes(ID1 int,ID2 int);

insert into Highschooler values(1510,'Jordan',9);
insert into Highschooler values(1689,'Gabriel',9);
insert into Highschooler values(1381,'Tiffany',9);
insert into Highschooler values(1709,'Cassandra',9);
insert into Highschooler values(1101,'Haley',10);
insert into Highschooler values(1782,'Andrew',10);
insert into Highschooler values(1468,'Kris',10);
insert into Highschooler values(1641,'Brittany',10);
insert into Highschooler values(1247,'Alexis',11);
insert into Highschooler values(1316,'Austin',11);
insert into Highschooler values(1911,'Gabriel',11);
insert into Highschooler values(1501,'Jessica',11);
insert into Highschooler values(1304,'Jordan',12);
insert into Highschooler values(1025,'John',12);
insert into Highschooler values(1934,'Kyle',12);
insert into Highschooler values(1661,'Logan',12);


insert into Friend values(1510,1689);
insert into Friend values(1689,1709);
insert into Friend values(1381,1247);
insert into Friend values(1709,1247);
insert into Friend values(1689,1782);
insert into Friend values(1782,1468);
insert into Friend values(1782,1316);
insert into Friend values(1782,1304);
insert into Friend values(1468,1101);
insert into Friend values(1468,1641);
insert into Friend values(1101,1641);
insert into Friend values(1247,1911);
insert into Friend values(1247,1501);
insert into Friend values(1911,1501);
insert into Friend values(1501,1934);
insert into Friend values(1316,1934);
insert into Friend values(1934,1304);
insert into Friend values(1304,1661);
insert into Friend values(1661,1025);
insert into Friend values(1381,1510);
insert into Friend values(1689,1510);
insert into Friend values(1709,1689);
insert into Friend values(1247,1381);
insert into Friend values(1247,1709);
insert into Friend values(1782,1689);
insert into Friend values(1468,1782);
insert into Friend values(1316,1782);
insert into Friend values(1304,1782);
insert into Friend values(1101,1468);
insert into Friend values(1641,1468);
insert into Friend values(1641,1101);
insert into Friend values(1911,1247);
insert into Friend values(1501,1247);
insert into Friend values(1501,1911);
insert into Friend values(1934,1501);
insert into Friend values(1934,1316);
insert into Friend values(1304,1934);
insert into Friend values(1661,1304);
insert into Friend values(1025,1661);


insert into Likes values(1689,1709);
insert into Likes values(1709,1689);
insert into Likes values(1782,1709);
insert into Likes values(1911,1247);
insert into Likes values(1247,1468);
insert into Likes values(1641,1468);
insert into Likes values(1316,1304);
insert into Likes values(1501,1934);
insert into Likes values(1934,1501);
insert into Likes values(1025,1101);


select * from Highschooler;
+------+-----------+-------+
| ID   | name      | grade |
+------+-----------+-------+
| 1510 | Jordan    |     9 |
| 1689 | Gabriel   |     9 |
| 1381 | Tiffany   |     9 |
| 1709 | Cassandra |     9 |
| 1101 | Haley     |    10 |
| 1782 | Andrew    |    10 |
| 1468 | Kris      |    10 |
| 1641 | Brittany  |    10 |
| 1247 | Alexis    |    11 |
| 1316 | Austin    |    11 |
| 1911 | Gabriel   |    11 |
| 1501 | Jessica   |    11 |
| 1304 | Jordan    |    12 |
| 1025 | John      |    12 |
| 1934 | Kyle      |    12 |
| 1661 | Logan     |    12 |
+------+-----------+-------+

 select * from Friend;
+------+------+
| ID1  | ID2  |
+------+------+
| 1510 | 1381 |
| 1510 | 1689 |
| 1689 | 1709 |
| 1381 | 1247 |
| 1709 | 1247 |
| 1689 | 1782 |
| 1782 | 1468 |
| 1782 | 1316 |
| 1782 | 1304 |
| 1468 | 1101 |
| 1468 | 1641 |
| 1101 | 1641 |
| 1247 | 1911 |
| 1247 | 1501 |
| 1911 | 1501 |
| 1501 | 1934 |
| 1316 | 1934 |
| 1934 | 1304 |
| 1304 | 1661 |
| 1661 | 1025 |
| 1381 | 1510 |
| 1689 | 1510 |
| 1709 | 1689 |
| 1247 | 1381 |
| 1247 | 1709 |
| 1782 | 1689 |
| 1468 | 1782 |
| 1316 | 1782 |
| 1304 | 1782 |
| 1101 | 1468 |
| 1641 | 1468 |
| 1641 | 1101 |
| 1911 | 1247 |
| 1501 | 1247 |
| 1501 | 1911 |
| 1934 | 1501 |
| 1934 | 1316 |
| 1304 | 1934 |
| 1661 | 1304 |
| 1025 | 1661 |
+------+------+

select * from Likes;
+------+------+
| ID1  | ID2  |
+------+------+
| 1689 | 1709 |
| 1709 | 1689 |
| 1782 | 1709 |
| 1911 | 1247 |
| 1247 | 1468 |
| 1641 | 1468 |
| 1316 | 1304 |
| 1501 | 1934 |
| 1934 | 1501 |
| 1025 | 1101 |
+------+------+


1.Find the names of all students who are friends with someone named Gabriel.
select h.name from Highschooler h join Friend f on h.ID = f.ID1 where f.ID2 in(select ID from Highschooler where name = 'Gabriel');
+-----------+
| name      |
+-----------+
| Jordan    |
| Cassandra |
| Andrew    |
| Alexis    |
| Jessica   |
+-----------+

2.For every student who likes someone 2 or more grades younger than themselves, 
return that student's name and grade, and the name and grade of the student they like. 

select h.name,l.id1,h.grade,h2.name,l.id2,h2.grade,h.grade-h2.grade from Likes l join Highschooler h on l.ID1= h.ID join  Highschooler h2 on l.ID2=h2.id;
+-----------+------+-------+-----------+------+-------+------------------+
| name      | id1  | grade | name      | id2  | grade | h.grade-h2.grade |
+-----------+------+-------+-----------+------+-------+------------------+
| Cassandra | 1709 |     9 | Gabriel   | 1689 |     9 |                0 |
| Gabriel   | 1689 |     9 | Cassandra | 1709 |     9 |                0 |
| Andrew    | 1782 |    10 | Cassandra | 1709 |     9 |                1 |
| John      | 1025 |    12 | Haley     | 1101 |    10 |                2 |
| Brittany  | 1641 |    10 | Kris      | 1468 |    10 |                0 |
| Alexis    | 1247 |    11 | Kris      | 1468 |    10 |                1 |
| Gabriel   | 1911 |    11 | Alexis    | 1247 |    11 |                0 |
| Kyle      | 1934 |    12 | Jessica   | 1501 |    11 |                1 |
| Austin    | 1316 |    11 | Jordan    | 1304 |    12 |               -1 |
| Jessica   | 1501 |    11 | Kyle      | 1934 |    12 |               -1 |
+-----------+------+-------+-----------+------+-------+------------------+
10 rows in set (0.03 sec)

select a.name1,a.grade1,a.name2,a.grade2 from(select h.name as name1,l.id1,h.grade as grade1,h2.name as name2,l.id2,h2.grade as grade2,(h.grade-h2.grade) as diff from Likes l join Highschooler h on l.ID1= h.ID join  Highschooler h2 on l.ID2=h2.id) as a where a.diff>=2;
+-------+--------+-------+--------+
| name1 | grade1 | name2 | grade2 |
+-------+--------+-------+--------+
| John  |     12 | Haley |     10 |
+-------+--------+-------+--------+

3.For every pair of students who both like each other, return the name and grade of both students.
Include each pair only once, with the two names in alphabetical order

select distinct h.name,h.grade,h2.name,h2.grade from Likes l join Highschooler h on l.ID1 = h.ID join Highschooler h2 on l.ID2= h2.ID order by h.name;
+-----------+-------+-----------+-------+
| name      | grade | name      | grade |
+-----------+-------+-----------+-------+
| Alexis    |    11 | Kris      |    10 |
| Andrew    |    10 | Cassandra |     9 |
| Austin    |    11 | Jordan    |    12 |
| Brittany  |    10 | Kris      |    10 |
| Cassandra |     9 | Gabriel   |     9 |
| Gabriel   |     9 | Cassandra |     9 |
| Gabriel   |    11 | Alexis    |    11 |
| Jessica   |    11 | Kyle      |    12 |
| John      |    12 | Haley     |    10 |
| Kyle      |    12 | Jessica   |    11 |
+-----------+-------+-----------+-------+

4.Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades.
Sort by grade, then by name within each grade

select h.ID,h.name,h.grade from highschooler h where ID not in(select ID1 from likes union select ID2 from likes) order by h.grade,h.name;
+------+---------+-------+
| ID   | name    | grade |
+------+---------+-------+
| 1510 | Jordan  |     9 |
| 1381 | Tiffany |     9 |
| 1661 | Logan   |    12 |
+------+---------+-------+

5.For every situation where student A likes student B, but we have no information about whom B likes 
(that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades. 

select l.ID1,h.name,h.grade,l.ID2,h1.name,h1.grade from likes l join highschooler h on h.ID = l.ID1 join highschooler h1 on h1.ID = l.ID2 where l.ID2 not in(select ID1 from likes);
+------+----------+-------+------+--------+-------+
| ID1  | name     | grade | ID2  | name   | grade |
+------+----------+-------+------+--------+-------+
| 1025 | John     |    12 | 1101 | Haley  |    10 |
| 1641 | Brittany |    10 | 1468 | Kris   |    10 |
| 1247 | Alexis   |    11 | 1468 | Kris   |    10 |
| 1316 | Austin   |    11 | 1304 | Jordan |    12 |
+------+----------+-------+------+--------+-------+

6.Find names and grades of students who only have friends in the same grade. 
Return the result sorted by grade, then by name within each grade. 

select h.ID,h.name,h.grade,h1.ID,h1.name,h1.grade from friend f join highschooler h on f.ID1=h.ID join highschooler h1 on f.ID2 = h1.ID where h.grade=h1.grade order by h.grade,h.name;
+------+-----------+-------+------+-----------+-------+
| ID   | name      | grade | ID   | name      | grade |
+------+-----------+-------+------+-----------+-------+
| 1709 | Cassandra |     9 | 1689 | Gabriel   |     9 |
| 1689 | Gabriel   |     9 | 1709 | Cassandra |     9 |
| 1689 | Gabriel   |     9 | 1510 | Jordan    |     9 |
| 1510 | Jordan    |     9 | 1381 | Tiffany   |     9 |
| 1510 | Jordan    |     9 | 1689 | Gabriel   |     9 |
| 1381 | Tiffany   |     9 | 1510 | Jordan    |     9 |
| 1782 | Andrew    |    10 | 1468 | Kris      |    10 |
| 1641 | Brittany  |    10 | 1468 | Kris      |    10 |
| 1641 | Brittany  |    10 | 1101 | Haley     |    10 |
| 1101 | Haley     |    10 | 1641 | Brittany  |    10 |
| 1101 | Haley     |    10 | 1468 | Kris      |    10 |
| 1468 | Kris      |    10 | 1101 | Haley     |    10 |
| 1468 | Kris      |    10 | 1641 | Brittany  |    10 |
| 1468 | Kris      |    10 | 1782 | Andrew    |    10 |
| 1247 | Alexis    |    11 | 1911 | Gabriel   |    11 |
| 1247 | Alexis    |    11 | 1501 | Jessica   |    11 |
| 1911 | Gabriel   |    11 | 1501 | Jessica   |    11 |
| 1911 | Gabriel   |    11 | 1247 | Alexis    |    11 |
| 1501 | Jessica   |    11 | 1247 | Alexis    |    11 |
| 1501 | Jessica   |    11 | 1911 | Gabriel   |    11 |
| 1025 | John      |    12 | 1661 | Logan     |    12 |
| 1304 | Jordan    |    12 | 1661 | Logan     |    12 |
| 1304 | Jordan    |    12 | 1934 | Kyle      |    12 |
| 1934 | Kyle      |    12 | 1304 | Jordan    |    12 |
| 1661 | Logan     |    12 | 1025 | John      |    12 |
| 1661 | Logan     |    12 | 1304 | Jordan    |    12 |
+------+-----------+-------+------+-----------+-------+

7.For each student A who likes a student B where the two are not friends, find if they have a friend C in common 
(who can introduce them!). For all such trios, return the name and grade of A, B, and C. 

8.Find the difference between the number of students in the school and the number of different first names. 
select (select count(*) from highschooler) - (select count(a.c) from (select count(*) as c from highschooler group by name) as a) as countt;
+--------+
| countt |
+--------+
|      2 |
+--------+

9.Find the name and grade of all students who are liked by more than one other student.



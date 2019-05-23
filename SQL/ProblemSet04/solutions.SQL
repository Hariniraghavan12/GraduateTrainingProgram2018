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



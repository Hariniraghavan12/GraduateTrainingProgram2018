create database problemset03;
use problemset03;

create table Movie(mID int primary key, title varchar(70), year int, director varchar(40));
create table Reviewer(rID int primary key , name varchar(40));
create table Rating(rID int references Reviewer(rID), mID int references Movie(mID), stars int, ratingDate date);

insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');
                                                         
select * from movie;
+-----+-------------------------+------+------------------+
| mID | title                   | year | director         |
+-----+-------------------------+------+------------------+
| 101 | Gone with the Wind      | 1939 | Victor Fleming   |
| 102 | Star Wars               | 1977 | George Lucas     |
| 103 | The Sound of Music      | 1965 | Robert Wise      |
| 104 | E.T.                    | 1982 | Steven Spielberg |
| 105 | Titanic                 | 1997 | James Cameron    |
| 106 | Snow White              | 1937 | NULL             |
| 107 | Avatar                  | 2009 | James Cameron    |
| 108 | Raiders of the Lost Ark | 1981 | Steven Spielberg |
+-----+-------------------------+------+------------------+
 
select * from reviewer;
                                                         
+-----+------------------+
| rID | name             |
+-----+------------------+
| 201 | Sarah Martinez   |
| 202 | Daniel Lewis     |
| 203 | Brittany Harris  |
| 204 | Mike Anderson    |
| 205 | Chris Jackson    |
| 206 | Elizabeth Thomas |
| 207 | James Cameron    |
| 208 | Ashley White     |
+-----+------------------+

 select * from rating;
                                                         
 +------+------+-------+------------+
| rID  | mID  | stars | ratingDate |
+------+------+-------+------------+
|  201 |  101 |     2 | 2011-01-22 |
|  201 |  101 |     4 | 2011-01-27 |
|  202 |  106 |     4 | NULL       |
|  203 |  103 |     2 | 2011-01-20 |
|  203 |  108 |     4 | 2011-01-12 |
|  203 |  108 |     2 | 2011-01-30 |
|  204 |  101 |     3 | 2011-01-09 |
|  205 |  103 |     3 | 2011-01-27 |
|  205 |  104 |     2 | 2011-01-22 |
|  205 |  108 |     4 | NULL       |
|  206 |  107 |     3 | 2011-01-15 |
|  206 |  106 |     5 | 2011-01-19 |
|  207 |  107 |     5 | 2011-01-20 |
|  208 |  104 |     3 | 2011-01-02 |
+------+------+-------+------------+
                                                       

1.Find the titles of all movies directed by Steven Spielberg. (1 point possible)

                                                        
select mID,title from movie where director = 'Steven Spielberg';
+-----+-------------------------+
| mID | title                   |
+-----+-------------------------+
| 104 | E.T.                    |
| 108 | Raiders of the Lost Ark |
+-----+-------------------------+   
                                                         
2.Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. (1 point possible)

select m.mID,m.title,ra.stars from movie m join rating ra on m.mID = ra.mID where ra.stars>=4 order by ra.stars;
+-----+-------------------------+-------+
| mID | title                   | stars |
+-----+-------------------------+-------+
| 101 | Gone with the Wind      |     4 |
| 106 | Snow White              |     4 |
| 108 | Raiders of the Lost Ark |     4 |
| 108 | Raiders of the Lost Ark |     4 |
| 106 | Snow White              |     5 |
| 107 | Avatar                  |     5 |
+-----+-------------------------+-------+

                                                         
 3.Find the titles of all movies that have no ratings. (1 point possible)
                                                         
  select m.mID,m.title from movie m left join rating ra on m.mID = ra.mID where ra.stars is NULL;
+-----+-----------+
| mID | title     |
+-----+-----------+
| 102 | Star Wars |
| 105 | Titanic   |
+-----+-----------+
                                                         
 4.Some reviewers didn't provide a date with their rating. 
 Find the names of all reviewers who have ratings with a NULL value for the date. (1 point possible)     
                                                         
 select re.rID,re.name from reviewer re join rating ra on re.rID  = ra.rID where ra.ratingDate is NULL;
+-----+---------------+
| rID | name          |
+-----+---------------+
| 202 | Daniel Lewis  |
| 205 | Chris Jackson |
+-----+---------------+
                                                         
 5.Write a query to return the ratings data in a more readable format: 
 reviewer name, movie title, stars, and ratingDate. Also, sort the data, 
 first by reviewer name, then by movie title, and lastly by number of stars. (1 point possible)
                                                         
 select re.name,m.title,ra.stars,ra.ratingDate from rating ra join movie m on ra.mID = m.mID join reviewer re on ra.rID = re.rID order by re.name,m.title,ra.stars;
+------------------+-------------------------+-------+------------+
| name             | title                   | stars | ratingDate |
+------------------+-------------------------+-------+------------+
| Ashley White     | E.T.                    |     3 | 2011-01-02 |
| Brittany Harris  | Raiders of the Lost Ark |     2 | 2011-01-30 |
| Brittany Harris  | Raiders of the Lost Ark |     4 | 2011-01-12 |
| Brittany Harris  | The Sound of Music      |     2 | 2011-01-20 |
| Chris Jackson    | E.T.                    |     2 | 2011-01-22 |
| Chris Jackson    | Raiders of the Lost Ark |     4 | NULL       |
| Chris Jackson    | The Sound of Music      |     3 | 2011-01-27 |
| Daniel Lewis     | Snow White              |     4 | NULL       |
| Elizabeth Thomas | Avatar                  |     3 | 2011-01-15 |
| Elizabeth Thomas | Snow White              |     5 | 2011-01-19 |
| James Cameron    | Avatar                  |     5 | 2011-01-20 |
| Mike Anderson    | Gone with the Wind      |     3 | 2011-01-09 |
| Sarah Martinez   | Gone with the Wind      |     2 | 2011-01-22 |
| Sarah Martinez   | Gone with the Wind      |     4 | 2011-01-27 |
+------------------+-------------------------+-------+------------+
                                                         
 6.For all cases where the same reviewer rated the same movie twice and gave it a 
 higher rating the second time, return the reviewer's name and the title of the movie. (1 point possible)

 select re.name, m.title from reviewer re join (select rID,mID from rating group by rID,mID having count(rID)>1) as a on a.rID = re.rID join movie m on a.mID= m.mID ;
+-----------------+-------------------------+
| name            | title                   |
+-----------------+-------------------------+
| Sarah Martinez  | Gone with the Wind      |
| Brittany Harris | Raiders of the Lost Ark |
+-----------------+-------------------------+
                                                         
7.For each movie that has at least one rating, find the highest number of stars that movie received. 
 Return the movie title and number of stars. Sort by movie title. (1 point possible)   
                                                         
select ra.mID,m.title,max(ra.stars) as stars from rating ra join movie m on ra.mID = m.mID group by ra.mID order by m.title;
+------+-------------------------+-------+
| mID  | title                   | stars |
+------+-------------------------+-------+
|  107 | Avatar                  |     5 |
|  104 | E.T.                    |     3 |
|  101 | Gone with the Wind      |     4 |
|  108 | Raiders of the Lost Ark |     4 |
|  106 | Snow White              |     5 |
|  103 | The Sound of Music      |     3 |
+------+-------------------------+-------+
                                                                                           
8.For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest 
  ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title. (1 point possible)   
                                                         
  select ra.mID,m.title,max(ra.stars)-min(ra.stars) as rating_spread from rating ra join movie m on ra.mID = m.mID group by ra.mID order by rating_spread desc,m.title;
+------+-------------------------+---------------+
| mID  | title                   | rating_spread |
+------+-------------------------+---------------+
|  107 | Avatar                  |             2 |
|  101 | Gone with the Wind      |             2 |
|  108 | Raiders of the Lost Ark |             2 |
|  104 | E.T.                    |             1 |
|  106 | Snow White              |             1 |
|  103 | The Sound of Music      |             1 |
+------+-------------------------+---------------+                                                       
                                                         
 9.Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980.
  (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies 
  after. Don't just calculate the overall average rating before and after 1980.) (1 point possible)  
   
  select 
   (select avg(a.av1) from 
      (select ra.mID,m.year,avg(ra.stars) as av1 from rating ra join movie m on ra.mID = m.mID group by ra.mID )as a where a.year<1980)
   - 
   (select avg(b.av2) from 
      (select ra.mID,m.year,avg(ra.stars) as av2 from rating ra join movie m on ra.mID = m.mID group by ra.mID) as b where b.year>1980);
   
    0.05556667
   
10.Find the names of all reviewers who rated Gone with the Wind. (1 point possible)
   
  select re.name,m.title,ra.stars from rating ra join reviewer re on ra.rID = re.rID join movie m on ra.mID = m.mID where m.title='Gone with the Wind';
+----------------+--------------------+-------+
| name           | title              | stars |
+----------------+--------------------+-------+
| Sarah Martinez | Gone with the Wind |     2 |
| Sarah Martinez | Gone with the Wind |     4 |
| Mike Anderson  | Gone with the Wind |     3 |
+----------------+--------------------+-------+
   
11.For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars. (1 point possible)
     
   select re.name,m.title,ra.stars from rating ra join reviewer re on ra.rID = re.rID join movie m on ra.mID = m.mID where re.name = m.director;
+---------------+--------+-------+
| name          | title  | stars |
+---------------+--------+-------+
| James Cameron | Avatar |     5 |
+---------------+--------+-------+ 

12.Return all reviewer names and movie names together in a single list, alphabetized.
 (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".) (1 point possible)
   
 select m.title,re.name from rating ra join reviewer re on ra.rID = re.rID join movie m on ra.mID = m.mID order by re.name,m.title;
+-------------------------+------------------+
| title                   | name             |
+-------------------------+------------------+
| E.T.                    | Ashley White     |
| Raiders of the Lost Ark | Brittany Harris  |
| Raiders of the Lost Ark | Brittany Harris  |
| The Sound of Music      | Brittany Harris  |
| E.T.                    | Chris Jackson    |
| Raiders of the Lost Ark | Chris Jackson    |
| The Sound of Music      | Chris Jackson    |
| Snow White              | Daniel Lewis     |
| Avatar                  | Elizabeth Thomas |
| Snow White              | Elizabeth Thomas |
| Avatar                  | James Cameron    |
| Gone with the Wind      | Mike Anderson    |
| Gone with the Wind      | Sarah Martinez   |
| Gone with the Wind      | Sarah Martinez   |
+-------------------------+------------------+
   
13.Find the titles of all movies not reviewed by Chris Jackson. 
   
  select m.title from movie m where m.mID not in (select ra.mID from rating ra join reviewer re on ra.rID = re.rID where re.name = 'chris jackson');
+--------------------+
| title              |
+--------------------+
| Gone with the Wind |
| Star Wars          |
| Titanic            |
| Snow White         |
| Avatar             |
+--------------------+
   
14.For all pairs of reviewers such that both reviewers gave a rating to the same movie, return the names of both reviewers. 
  Eliminate duplicates, don't pair reviewers with themselves, and include each pair only once.
  For each pair, return the names in the pair in alphabetical order. (1 point possible)
   
  select distinct m.title, re.name, ra.mID from rating ra join reviewer re on ra.rID = re.rID join movie m on ra.mID = m.mID where ra.rID in(select rID from rating group by rID,mID) order by m.mID;
+-------------------------+------------------+------+
| title                   | name             | mID  |
+-------------------------+------------------+------+
| Gone with the Wind      | Mike Anderson    |  101 |
| Gone with the Wind      | Sarah Martinez   |  101 |
| The Sound of Music      | Brittany Harris  |  103 |
| The Sound of Music      | Chris Jackson    |  103 |
| E.T.                    | Ashley White     |  104 |
| E.T.                    | Chris Jackson    |  104 |
| Snow White              | Daniel Lewis     |  106 |
| Snow White              | Elizabeth Thomas |  106 |
| Avatar                  | James Cameron    |  107 |
| Avatar                  | Elizabeth Thomas |  107 |
| Raiders of the Lost Ark | Brittany Harris  |  108 |
| Raiders of the Lost Ark | Chris Jackson    |  108 |
+-------------------------+------------------+------+

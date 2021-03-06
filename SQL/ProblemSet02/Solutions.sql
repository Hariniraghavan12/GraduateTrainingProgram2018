Create table Location (locationid number primary key, name varchar2(30), sunlight number, water number); 
Create table Gardener (gardenerid number primary key, name varchar2(30), age number); 
Create table Plant (plantid number primary key, name varchar2(30), sunlight number, water number, weight number); 
Create table planted (plantFK number, gardenerFK number, locationFK number, date1 date, seeds number, foreign key(plantFK) references plant(plantid), foreign key(gardenerFK) references gardener(gardenerid), foreign key(locationFK) references location(locationid)); 
Create table picked (plantFK number, gardenerFK number, locationFK number, date1 date, amount number, weight number, foreign key(plantFK) references plant(plantid), foreign key(gardenerFK) references gardener(gardenerid), foreign key(locationFK) references location(locationid)); 


Insert into location values(0, 'East', .28, .80); 
Insert into location values(1, 'North', .17, .84); 
Insert into location values(2, 'West', .38, .48); 
Insert into location values(3, 'South', .45, .66); 


Insert into gardener values(0, 'Mother', 36); 
Insert into gardener values(1, 'Father', 38); 
Insert into gardener values(2, 'Tim', 15); 
Insert into gardener values(3, 'Erin', 12);


Insert into plant values(0, 'Carrot', .26, .82, .08);
Insert into plant values(1, 'Beet', .44, .80, .04);
Insert into plant values(2, 'Corn', .44, .76, .26);
Insert into plant values(3, 'Tomato', .42, .80, .16);
Insert into plant values(4, 'Radish', .28, .84, .02);
Insert into plant values(5, 'Lettuce', .29, .85, .03);


Insert into planted values(0, 0, 0 , '18-APR-2012', 28);
Insert into planted values(0, 1, 1 , '14-APR-2012', 14);
Insert into planted values(1, 0, 2 , '18-APR-2012', 36);
Insert into planted values(2, 1, 3 , '14-APR-2012', 20);
Insert into planted values(2, 2, 2 , '19-APR-2012', 12);
Insert into planted values(3, 3, 3 , '25-APR-2012', 38);
Insert into planted values(4, 2, 0 , '30-APR-2012', 30);
Insert into planted values(5, 2, 0 , '15-APR-2012', 30);


Insert into picked values(0, 2, 0 , '18-AUG-2012', 28, 2.32);
Insert into picked values(0, 3, 1 , '16-AUG-2012', 12, 1.02);
Insert into picked values(2, 1, 3 , '22-AUG-2012', 52, 12.96);
Insert into picked values(2, 2, 2 , '28-AUG-2012', 18, 4.58);
Insert into picked values(3, 3, 3 , '22-AUG-2012', 15, 3.84);
Insert into picked values(4, 2, 0 , '16-JUL-2012', 23, 0.52);


select * from location;
locationid|name|sunlight|water
0|East|0.28|0.8
1|North|0.17|0.84
2|West|0.38|0.48
3|South|0.45|0.66


select * from gardener;
gardenerid|name|age
0|Mother|36
1|Father|38
2|Tim|15
3|Erin|12


select * from plant;
plantid|name|sunlight|water|weight
0|Carrot|0.26|0.82|0.08
1|Beet|0.44|0.8|0.04
2|Corn|0.44|0.76|0.26
3|Tomato|0.42|0.8|0.16
4|Radish|0.28|0.84|0.02
5|Lettuce|0.29|0.85|0.03


select * from planted;
plantFK|gardenerFK|locationFK|date1|seeds
0|0|0|18-APR-2012|28
0|1|1|14-APR-2012|14
1|0|2|18-APR-2012|36
2|1|3|14-APR-2012|20
2|2|2|19-APR-2012|12
3|3|3|25-APR-2012|38
4|2|0|30-APR-2012|30
5|2|0|15-APR-2012|30


select * from picked;
plantFK|gardenerFK|locationFK|date1|amount|weight
0|2|0|18-AUG-2012|28|2.32
0|3|1|16-AUG-2012|12|1.02
2|1|3|22-AUG-2012|52|12.96
2|2|2|28-AUG-2012|18|4.58
3|3|3|22-AUG-2012|15|3.84
4|2|0|16-JUL-2012|23|0.52


1.Write a valid SQL statement that calculates the total weight of all corn cobs that were picked from the garden
select p.name,sum(pi.weight) AS TOTAL from plant p join picked pi on p.plantid=pi.plantFK where p.name='Corn';

name|TOTAL
Corn|17.54


2.For some reason Erin has changed his location for picking the tomato to North. Write the corresponding query.
update picked set locationFK=(select locationid from location where name='North') where gardenerFK=(select gardenerid from gardener where name='Erin') and plantFK=(select plantid from plant where name='Tomato');

select * from picked;

plantFK|gardenerFK|locationFK|date1|amount|weight
0|2|0|18-AUG-2012|28|2.32
0|3|1|16-AUG-2012|12|1.02
2|1|3|22-AUG-2012|52|12.96
2|2|2|28-AUG-2012|18|4.58
3|3|1|22-AUG-2012|15|3.84
4|2|0|16-JUL-2012|23|0.52


3.Insert a new column 'Exper' of type Number (30) to the 'gardener' table which stores Experience of the of person. 
How will you modify this to varchar2(30).

alter table gardener add column Exper Number(30);
select * from gardener;
 
gardenerid|name|age|Exper
0|Mother|36|
1|Father|38|
2|Tim|15|
3|Erin|12|
 
alter table gardener modify column Exper Varchar2(30);


4.Write a query to find the plant name which required seeds less than 20 which plant on 14-APR
select p.plantid, p.name from plant p join planted pl on p.plantid=pl.plantFK where pl.date1='14-APR-2012' and pl.seeds<20;

plantid|name
0|Carrot


5.List the amount of sunlight and water to all plants with names that start with letter 'c' or letter 'r'.
select plantid,name,sunlight,water from plant where name like 'c%' or name like 'r%';

plantid|name|sunlight|water
0|Carrot|0.26|0.82
2|Corn|0.44|0.76
4|Radish|0.28|0.84


6.Write a valid SQL statement that displays the plant name and the total amount of seed required for each plant that were plant in the garden. The output should be in descending order of plant name.
select p.name,sum(pl.seeds) as Total_seeds from plant p join planted pl on p.plantid=pl.plantFK group by pl.plantFK order by p.name desc;

name|Total_seeds
Tomato|38
Radish|30
Lettuce|30
Corn|32
Carrot|42
Beet|36


7.Write a valid SQL statement that calculates the average number of items produced per seed planted for each plant type:( (Average Number of Items = Total Amount Picked / Total Seeds Planted.)
select pl.name,sum(pi.amount)/sum(p.seeds) as avg_items from picked pi join planted p on pi.plantFK=p.plantFK join plant pl on pl.plantid=pi.plantFK group by pl.plantid;

name|avg_items
Carrot|0
Corn|2
Tomato|0
Radish|0
                                                                                                                         
                                                                                                                         
8.Write a valid SQL statement that would produce a result set like the following:
                                                                                                                         
name |  name  |    date    | amount 
------|--------|------------|-------- 
 Tim  | Radish | 2012-07-16 |     23 
 Tim  | Carrot | 2012-08-18 |     28 
                                                                                                                         
  
select g.name,p.name,pi.date1,pi.amount from picked pi join gardener g on pi.gardenerFK=g.gardenerid join plant p on pi.plantFK=p.plantid where g.name='Tim' and pi.date1 between '16-JUL-2012' and '18-AUG-2012';
name|name|date1|amount
Tim|Carrot|18-AUG-2012|28
Tim|Radish|16-JUL-2012|23 
                                                                                                                         
 
                                                                                                                         
9.Find out persons who picked from the same location as he/she planted.     
select g.name,p.locationFK as planted_location,pi.locationFK as picked_location from gardener g join planted p on p.gardenerFK=g.gardenerid join picked pi on p.plantFK=pi.plantFK where p.locationFK=pi.locationFK;
                                                                                                                         
name|planted_location|picked_location
Mother|0|0
Father|1|1
Father|3|3
Tim|2|2
Tim|0|0                                                                                                                        
                                                                                                                         
                                                                                                                         
10.Create a view that lists all the plant names picked from all locations except ’West’ in the month of August.
create view plant_views as select p.name,l.name,pi.date1 from plant p join picked pi on pi.plantFK=p.plantid join location l on pi.locationFK=l.locationid where l.name!='West' and pi.date1 LIKE '%-AUG-%';
                                                                                                                         
for select query:
                                                                                                                         
name|name|date1
Carrot|East|18-AUG-2012
Carrot|North|16-AUG-2012
Corn|South|22-AUG-2012
Tomato|North|22-AUG-2012                                                                                                                       
                                                                                                                         
                                                                                                                         
                                                                                                                         
                                                                                    
                                                                                                                         


 












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












CREATE DATABASE lab4week8;

CREATE TABLE Warehouses(
  code SERIAL PRIMARY KEY,
  location VARCHAR(255),
  capacity INTEGER
);

CREATE TABLE Boxes(
  code VARCHAR(4),
  contents VARCHAR(255),
  value INTEGER,
  warehouses INTEGER REFERENCES Warehouses(code),
  PRIMARY KEY(warehouses)
);

 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);

 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,warehouses) VALUES('TU55','Papers',90,5);


SELECT *
from Warehouses;

select *
from Boxes
where value>=50 AND value<=150;

SELECT distinct on(code) *
from Boxes;

SELECT warehouse, count(contents)
from boxes
group by warehouse;

select warehouse, value
from boxes where contents = 'Papers';

insert into Warehouses (location, capacity) values ('New York', 3);

insert into Boxes values ('H5RT', 'Papers', 200, 2);

update Boxes set value = value * 0.8

where value = (select value from Boxes limit 1 offset 2);

delete from Boxes where value < 150;

delete from Warehouses where location in (select location from warehouses where location = 'New York') returning  Warehouses;

delete from Boxes where warehouse in (select code from warehouses where location = 'New York');
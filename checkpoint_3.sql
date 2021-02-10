
create database project;
use project;

/**
ToDo 1:
Create all the normalised tables in the MySQL Workbench.
**/
create table user
(
user_id	NUMERIC(10)	PRIMARY KEY,
first_name	VARCHAR(50)	NOT NULL,
last_name	VARCHAR(50)	NOT NULL,
password	VARCHAR(50)	NOT NULL,
email	VARCHAR(50)	NOT NULL UNIQUE,
mobile_no	CHAR(10)	NOT NULL UNIQUE,
wallet	DECIMAL(10,2)	DEFAULT 10000,
role_id	VARCHAR(50)	NOT NULL
);
create table role(
role_id	NUMERIC(10)	PRIMARY KEY,
role_type	VARCHAR(50)	NOT NULL
);

create table vehicle(
vehicle_id	NUMERIC(10)	PRIMARY KEY,
vehicle_model	VARCHAR(50)	NOT NULL,
vehicle_number	CHAR(10)	NOT NULL UNIQUE,
type_id	NUMERIC(10)	NOT NULL,
category_id	NUMERIC(10)	NOT NULL,
vehicle_color	VARCHAR(50)	NOT NULL,
location_id	NUMERIC(10)	NOT NULL,
image	VARCHAR(500)	NOT NULL,
price_per_day	DECIMAL(10,2)	NOT NULL,
fuel_id	NUMERIC(10)	NOT NULL,
availability	BOOLEAN	NOT NULL
);

create table type
(		
type_id	NUMERIC(10)	PRIMARY KEY,
type_name	VARCHAR(50)	NOT NULL
);


create table category
(		
category_id	NUMERIC(10)	PRIMARY KEY,
vehicle_category_name	VARCHAR(50)	NOT NULL,
type_id	NUMERIC(10)	NOT NULL
);		
		
create table location        
(
location_id	NUMERIC(10)	PRIMARY KEY,
vehicle_location	VARCHAR(50)	NOT NULL,
vehicle_address	VARCHAR(100)	NOT NULL,
city_id	NUMERIC(10)	NOT NULL,
vehicle_pincode	CHAR(6)	NOT NULL
);		

create table city
(
city_id	NUMERIC(10)	PRIMARY KEY,
vehicle_city_name	VARCHAR(50)	NOT NULL
);
		
create table fuel
(		
fuel_id	NUMERIC(10)	PRIMARY KEY,
fuel_type	VARCHAR(50)	NOT NULL
);		

create table booking
(
booking_id	NUMERIC(10)	PRIMARY KEY,
pickup_date	    DATE	NOT NULL,
dropoff_date	DATE	NOT NULL,
booking_date	DATE	NOT NULL,
booking_amount	NUMERIC(10,2)	NOT NULL,
location_id	NUMERIC(10)	NOT NULL,
vehicle_id	NUMERIC(10)	NOT NULL,
user_id	NUMERIC(10)	NOT NULL
);



/**
ToDo 2:
Populate each table with records. You can choose to populate the tables with
data as per your choice, but every table should at least have two records.
**/
insert into user values
(1,'Sam','Kumar','abc123','sam@gmail.com','7452189634',10000,1),
(2,'Ram','Tyagi','def456', 'ram@gmail.com', '7418529635', 10000,2),
(3,"Amol","Nath","pass456","a.n56@gmail.com","748596213", 500000, 1);


insert into role values
(1,'customer'),(2,'admin');

insert into type values 
(1,'Car'),(2,'Bike');

insert into category values
(1,'Sedan'),(2,'SUV'),(3,'Hatchback'),(4,'Dirt Bike'),(5,'Cruiser'),(6,'Sports Bike');


insert into location values
(1, 'MG Road','B-4,MG Road, Mumbai',1,220022),
(2, 'Golf links','C-10,Golf links,New Delhi',2,110075);

alter table location
add foreign key (city_id)
references city(city_id);


insert into city values
(1,'Mumbai'),(2,'Delhi');


 insert into fuel values
 (1,'CNG'),(2,'Petrol'),(3,'Diesel');
 
 insert into booking values
 (1,'2020-01-05','2020-01-06', '2020-01-01', 20000,1,1,1),
  (2,'2020-02-05','2020-02-06', '2020-02-01', 20000,2,2,2),
  (3,'2020-06-06','2020-06-08','2020-05-25',40000,1,2,2),
  (4,'2020-06-05','2020-06-09','2020-05-25',50000,2,1,1);
  
  select * from vehicle;
  
  insert into vehicle
values(01, "micra", "Mh1234", 01, 02, 'black', 01, 'micra.jpg', 870.55, 01 , true);

insert into vehicle
values(02, "ducatiR1", "DL1234", 02, 06, 'blue', 02, 'ducati.jpg', 1170, 02 , true);

  
  
  
  alter table vehicle
  add foreign key (type_id)
  references type(type_id);
  
  alter table vehicle
  add foreign key (category_id)
  references category(category_id);
 
alter table vehicle 
add foreign key (location_id)
references location(location_id);


alter table vehicle
add foreign key (fuel_id)
references fuel(fuel_id);

alter table booking
add foreign key (location_id)
references location(location_id);

alter table booking
add foreign key (vehicle_id)
references vehicle(vehicle_id);


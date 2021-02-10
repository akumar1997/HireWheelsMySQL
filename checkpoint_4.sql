
use project;

/**
ToDo 1:
Add all the necessary constraints to each attribute of the tables.
**/

-- user table

-- There needs to be a unique identifier to identify each user record.

-- user_id is used to identify each record uniquely

Alter table user
add primary key (user_id);

-- The user must have a first name.

alter table user
modify first_name varchar(50) not null;

-- The user must have a password with a minimum length of five characters.

alter table user
modify password VARCHAR(20) NOT NULL CHECK (LENGTH(password) > 5);

-- The user must provide their email address; the email ID does not allow duplicate values.

alter table user
modify email VARCHAR(50) NOT NULL UNIQUE ;



-- The user must provide a mobile number; the mobile number does not allow duplicate values.

alter table user
modify mobile_no char(10) not null unique;

-- Every user should have an initial account balance of 10000.00.

alter table user
modify wallet decimal(10,2) default 10000;
 
-- Every user must have a role.

alter table user
modify role_id numeric(10) not null;

-- The roles should have been stored in a separate table and role names in that table should be unique.

alter table role
modify role_type varchar(50) not null unique;

describe role;

-- Linking user table to role table through role_id column

alter table user
add foreign key (role_id)
references role(role_id);

desc user;

-- vehicle table

-- There needs to be a unique identifier to identify the vehicle data.
-- vehicle_id serves as the unique identifier

alter table vehicle
add primary key (vehicle_id);

-- The following details of the vehicle must be provided:
-- Vehicle model
alter table vehicle
modify  vehicle_model varchar(50) not null;

-- Vehicle number

alter table vehicle
modify  vehicle_number varchar(50) not null;

-- Vehicle category name
-- vehicle category is defined in a separate table type, haing type_id, type_name columns

alter table vehicle
MODIFY type_id int(20) not null;

alter table type
modify type_name varchar(50) not null;

alter table type
add primary key (type_id);

-- Linking type table to vehicle table
alter table vehicle
add foreign key (type_id)
references type(type_id);

-- Vehicle subcategory
-- Vehicle subcategory defined in a separate category table

alter table vehicle 
modify category_id numeric(10) not null;

-- category table has category_id, vehicle_category_name, type_id 

alter table category
add primary key (category_id);

alter table category
modify vehicle_category_name varchar(50) not null;

-- link category table with type table to uniquely identify the type of each subcategory 

alter table category
add foreign key (type_id)
references type(type_id);

-- to connect the category table with vehicle table

ALTER TABLE vehicle
ADD FOREIGN KEY (category_id) REFERENCES category(category_id);

-- Colour of the vehicle

alter table vehicle
modify vehicle_color varchar(50) not null;

-- Fuel type of vehicle
-- fuel type is mentioned in a separate table fuel

alter table vehicle
modify fuel_id numeric(10) not null;

-- link fuel table with vehicle table

alter table fuel
add primary key (fuel_id);

alter table vehicle
add foreign key (fuel_id)
references fuel(fuel_id);

desc fuel;

-- Image of the vehicle 
alter table vehicle
MODIFY image varchar(50) not null;

-- Location name
-- Complete address of the vehicle
-- City name
-- Pincode

-- location, address, city name, pincode  are defined in a separate table named location as created in checkpoint 2

alter table vehicle
modify location_id numeric(10) not null;

-- link vehicle table with the location table 

alter table location
add primary key (location_id);


alter table vehicle
add foreign key (location_id)
references location(location_id);

-- Location name
alter table location
MODIFY location_name varchar(50) not null;

-- Complete address of the vehicle
alter table location
MODIFY location_address varchar(50) not null;


-- City name
-- city name is provided in another table named city

 
ALTER TABLE city 
ADD PRIMARY KEY (city_id);



-- city table is linked with location table to uniquely define each city, through city_id column

ALTER TABLE location
ADD FOREIGN KEY (city_id) REFERENCES city(city_id);


-- Pincode
alter table location
MODIFY pincode char(6) not null;

-- Price per day of the vehicle

alter table vehicle
modify price_per_day decimal(10,2) not null;

-- booking table

-- There needs to be a unique identifier to identify each booking record.
-- booking-id attribute defines each booking uniquely

alter table booking
add primary key (booking_id);

-- Each booking must also have the following details:
-- Pickup date

alter table booking
modify pickup_date date not null;

-- Drop-off date
alter table booking
modify dropoff_date date not null;

-- Booking date

alter table booking
modify booking_date date not null;

-- Booking amount
alter table booking
modify booking_amount numeric(10,2) not null;

-- location
-- to uniquely identify location, booking table is linked  to location table through location_id

alter table booking
add foreign key (location_id)
references location(location_id);

 
-- There also needs a reference to the vehicle that is booked by the user and each booking must have this reference.
-- vehicle table is referenced through vehicle_id

alter table booking
add foreign key (vehicle_id)
references vehicle(vehicle_id);

-- Each booking should also have a reference to the user who has raised the request.
alter table booking
add foreign key (user_id)
references user (user_id);

desc booking;



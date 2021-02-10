----------
-- PART A--
----------
/**
TODO 1: Insert the following records into the ‘city’ table.
Record 1:
        city_name: ‘Bangalore’ 

Record 2:
        city_name: ‘Delhi’ 

Record 3:
        city_name: ‘Kolkata’
**/
desc city;

select * from city;

insert into city values
(3,"Bangalore"),(4,"Kolkata");

/**
TODO 2: Insert the following records into the ‘location’ table.
Record 1:
        location_name: ‘Bangalore Railway station’ 
        address: ‘Kempegowda, Sevashrama, Bengaluru’
        city_id: <city_id corresponding to Bangalore>
        pincode: ’560023’

Record 2:
        location_name: ‘New Delhi Railway station’ 
        address: ‘Bhavbhuti Marg, Ratan Lal Market, Kamla Market, Ajmeri Gate’
        city_id: <city_id corresponding to Delhi>
        pincode: ’110006
*/

 
-- select * from location;

insert into location values
(3,"Bangalore Railway station","Kempegowda, Sevashrama, Bengaluru",3,"560023"),
(2,"New Delhi Railway station","Bhavbhuti Marg, Ratan Lal Market, Kamla Market, Ajmeri Gate",2,"110006");


/**
TODO 3: Find the count of bookings per city. Include only those cities that have at 
least one booking. The result should contain the following two columns:

City name
Number of bookings (in the respective city)
**/
-- select * from booking;
-- select * from location;
-- select * from city;

-- query to join booking, location and city tables 
select c.vehicle_city_name, count(*) as "Number of bookings"
from city c inner join location l 
on c.city_id = l.city_id inner join booking b
on l.location_id = b.location_id
group by c.vehicle_city_name ;



----------
-- PART B--
----------
/**  
TODO 1: Find the number of bookings done by each user, and display the results in 
descending order. If a user has not made any booking, show the number of bookings as 0. 
The result should contain the following two columns: 

User ID 
Number of bookings (made by the respective user) 
**/

-- select * from booking;
-- select * from user;

insert into user values (4,"Arun","Kumar","pas1","a.k@gmail.com","9899562314",500236,1); 

select u.user_id , count(booking_id) as "Number of bookings"
from user u left join booking b
on u.user_id = b.user_id
group by u.user_id; 


----------
-- PART C--
----------
/**
TODO 1: Insert the following records into the ‘role’ table. 
Record 1:
      role_name: ‘Employee’ 
**/

insert into role values
(3,'Employee');

select * from role;

/**
TODO 2: Provide a combined list of all users and roles. If a role does not exist for a 
user, let it be displayed as null/empty.
**/

desc role;
select u.user_id, role_type 
from user u left join role r
on u.role_id = r.role_id;

select * from location;
select * from vehicle;


 ----------
-- PART D--
----------
/**
TODO 1: Insert the following records into the ‘booking’ table.
Record 1:
              pickup_date: ’21-05-20’
              dropoff_date: ’29-05-20’
              booking_date: ’25-05-20’
              amount: 3000.00
              location_id: <any location_id>
              vehicle_id: <any vehicle_id>
              user_id: <any user_id>





Record 2:
              pickup_date: ’21-04-20’
              dropoff_date: ’29-04-20’
              booking_date: ’10-04-20’
              amount: 2000.00
              location_id: <any location_id>
              vehicle_id: <any vehicle_id>
              user_id: <any user_id>';



Record 3:
              pickup_date: ’11-04-20’
              dropoff_date: ’20-04-20’
              booking_date: ’10-04-20’              
              amount: 1000.00
              location_id: <any location_id>
              vehicle_id: <any vehicle_id>
              user_id: <any user_id>



Record 4:
              pickup_date: ’21-07-20’
              dropoff_date: ’29-07-20’
              booking_date: ’10-07-20’              
              amount: 3000.00
              location_id: <any location_id>
              vehicle_id: <any vehicle_id>
              user_id: <any user_id>



Record 5:
              pickup_date: ’11-07-20’
              dropoff_date: ’20-07-20’
              booking_date: ’10-07-20’              
              amount: 5000.00
              location_id: <any location_id>
              vehicle_id: <any vehicle_id>
              user_id: <any user_id>



Record 6:
              pickup_date: ’11-08-20’
              dropoff_date: ’23-08-20’
              booking_date: ’10-08-20’              
              amount: 5000.00
              location_id: <any location_id>
              vehicle_id: <any vehicle_id>
              user_id: <any user_id>

**/

insert into booking values
(5,'21-05-20','29-05-20','25-05-20',3000.00,1,1,2),
(6,'21-04-20','29-04-20','10-04-20',2000.00,1,2,3),
(7,'11-04-20','20-04-20','10-04-20' ,1000.00,2,1,3),
(8,'21-07-20','29-07-20','10-07-20',3000.00,3,2,1),
(9,'11-07-20','20-07-20','10-07-20', 5000.00,1,2,3),
(10,'11-08-20','23-08-20','10-08-20' ,5000.00,2,2,2);

select * from booking;

/**
TODO 2: You need to calculate the percentage change in the number of pickups from the 
company website in the subsequent months for the year 2020. Show the results of comparison 
of only those months in which vehicles were picked up (i.e., number of pickups > 0). 
The result should contain the following two columns: 

Month number: The number of the month that is being compared to the earlier months. 
For example, if the month is March, it should be 03.
Percentage change: The percentage change in the number of pickups between the month 
mentioned in the first column and the following month. 
For example,
Month Number | Percent Change
1			 | (booking_in_month_2 - booking_in_month_1) * 100 / booking_in_month_1
2			 | (booking_in_month_3 - booking_in_month_2) * 100 / booking_in_month_2

Note: You can use the EXTRACT function provided by MySQL to extract the month or year out of the date and the ROUND function to calculate the percentage change in the number of pickups. 
**/

select extract(MONTH from booking_date) as 'Month Number',
(((lead(count(*)) over(order by extract(MONTH from booking_date)) - count(*)) * 100) / count(*)) as 'Percent Change'
from booking group by 1;

use project;

----------
-- PART E--
----------
/**
TODO 1: For all months of 2020 in which bookings were made, count how many bookings 
had a booking amount greater or equal to that month's average booking amount. The result 
obtained should be in ascending order of the month number. The returned table should 
contain the following two columns:

Month Number: This specifies the month of the year 2020 in which bookings have been made.
Counter: This specifies the number of bookings for which the booking amount has been 
greater than the average booking amount received in that month.
**/

select month(booking_date) as 'Month Number', count(booking_id) as 'Counter'
from booking b
where b.booking_amount>=(select avg(booking_amount) from booking)
group by month(booking_date) ;


----------
-- PART F--
----------
/**
TODO 1: Find the revenue generated to date from renting out vehicles of type ‘car’. 
The returned table should contain only one row and one column, and the column should be 
named ‘Revenue by Car’.
**/

select * from booking;
select * from type; 
select * from vehicle;
-- type_id =1 -> Car

select sum(booking_amount) as "Revenue by Car"
from booking b inner join vehicle v
on b.vehicle_id = v.vehicle_id 
inner join type t
on v.type_id = t.type_id
where t.type_name = 'Car';

----------
-- PART G--
----------
/**
TODO 1: Create a single index named ‘users_name_index’ on first name and last name columns
of users table in the same order as mentioned below:
1. First name 
2. Last name.
**/
use project;
select * from user;

create index users_name_index
on user (first_name,last_name);


----------
-- PART H--
----------
/**
TODO 1: Create a view named ‘booking_view’ to display the details of the booking and 
the respective vehicle. The returned table should contain the following columns:

Booking date
Amount
Vehicle model
Vehicle category name
Vehicle sub-category  name
**/

-- select * from vehicle;
-- select * from type;
-- select * from booking;
-- select * from category;

-- set sql_safe_updates = 0;

-- update vehicle 
-- set category_id = 3
-- where vehicle_model='micra';

-- view query
create or replace view booking_view as
select b.booking_date, b.booking_amount, v.vehicle_model ,t.type_name, c.vehicle_category_name
from booking b inner join vehicle v on b.vehicle_id = v.vehicle_id
inner join type t on v.type_id = t.type_id
inner join category c on v.category_id = c.category_id;

select * from booking_view;

----------
-- PART I--
----------
/**
TODO 1: Create a view named user_role_view to display the details of the user along with the 
role of the users. 
**/

create or replace view user_role_view as
select u.*, role_type 
from user u inner join role r
on u.role_id = r.role_id;

select * from user_role_view;
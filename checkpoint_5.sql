/**
TODO 1: Find the number of times a vehicle was booked on 25 May 2020 and display them
in descending order of their number of bookings.

The query should return the following columns: 
	Vehicle_id
	Total number of times the vehicle was booked on 25 May 2020 as “Number of Bookings” 
**/

select v.vehicle_id, v.vehicle_model ,count(*) as 'Number of Bookings'
from booking b left join vehicle v
on b.vehicle_id = v.vehicle_id
where booking_date = '2020-05-25'
group by vehicle_id;




/**
TODO 2: Find the revenue generated by each vehicle, and display them in descending order of
their revenue. List only those vehicles that have had any bookings.

The returned table should contain the following two columns:
	Vehicle_id
	Amount generated by that particular vehicle as “Revenue”
**/

select v.vehicle_id, sum(booking_amount) as “Revenue”
from vehicle v inner join booking b 
on v.vehicle_id = b.vehicle_id
group by 1
order by 2 desc;

select * from booking;


/**
TODO 3: Make a list of unique IDs of all the users who have not booked any vehicle so far.
The result should only contain the user_id displayed as ‘ID’. 
**/

select user_id as "ID" 
from user where user_id not in
(select user_id from booking);





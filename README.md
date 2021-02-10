# HireWheelsMySQL

The advent of self-drive vehicle renting companies such as Zoom Car and Revv has made travelling a lot more convenient. You can choose a vehicle from the fleet, decide a pick up point, and start your journey at an affordable price. Moreover, they also add the convenience of driving at your own pace, more personal space and desired stops to the vehicle rental experience.

 

As part of this project, we have  build a similar prototype of a self-drive vehicle website named "HireWheels". 

Following are the important components of the project that need to be stored in the database:

User: A user can join the website by signing up. 
A customer needs to provide the following information at the time of sign-up, which will be stored in the database:
First name,Last name
,Password
,Email ID
,Mobile number
,Each user will have a wallet associated with them, which will store information on how much money the user has. This money will be used for making payments while booking the vehicles. The initial balance for every user is kept as 10,000.
 
 
Any user can assume either of the following two roles: CUSTOMER or ADMIN. The role associated with each user, CUSTOMER or ADMIN, needs to be stored in the database.
 

Vehicle: The following details of all the vehicles in the application need to be stored in the database with the following information:

Vehicle model
,Vehicle number
,Vehicle type (There can be two types of vehicles in our application: Car and Bike)
,Each vehicle type is further divided into subcategories:

Car:
Sedan
,SUV
,Hatchback

Bike:
Dirt bike
,Cruiser
,Sports bike

Colour of the vehicle
,The location where the vehicle will be available for booking. The following details of the location that need to be stored in the database:
,Location name
,Complete address of the where the vehicle will be available
,City name
,Pincode
,Image of the vehicle 
,Price per day of the vehicle
,Fuel type of the vehicle: CNG,
Petrol,
Diesel


Booking: Every customer books vehicles from the website based on their location as well as time. Once the customer has completed all the steps involved, the booking is confirmed and the record is stored in the database. A vehicle booking completed by any customer should contain the following information:

Pickup date and time
,Drop-off date and time
,Booking date and time
,Booking amount 
,Location of the vehicle
,Vehicle number (The number of vehicle that has been booked)
,Customer email (The email ID of the customer who has booked the vehicle)

The functionality of the admin: The admin can perform two activities in the application apart from booking the vehicle: First, adding vehicles for rent by providing all the required vehicle details, and second, stopping the booking of vehicles by the customers.

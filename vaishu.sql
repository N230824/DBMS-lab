CREATE DATABASE IRCTCdb;
USE IRCTCdb;
show tables;

CREATE TABLE Passenger(PassengerID INT PRIMARY KEY,PassengerName VARCHAR(50) NOT NULL,Age INT,
gender VARCHAR(1) NOT NULL,City VARCHAR(30) NOT NULL,Phone varchar(15) UNIQUE,AlternatePhone VARCHAR(15) UNIQUE);
INSERT INTO PASSENGER VALUES (101, 'Rahul', 28, 'M', 'Hyderabad', '9876543210', NULL);
INSERT INTO PASSENGER VALUES (102, 'Anjali', 35, 'F', 'Vijayawada', '9876543211', '9123456780');
INSERT INTO PASSENGER VALUES (103, 'Sneha', 22, 'F', 'Guntur', NULL, '9123456781');
INSERT INTO PASSENGER VALUES (104, 'Ravi', 42, 'M', 'Visakhapatnam', '9876543213', NULL);
INSERT INTO PASSENGER VALUES (105, 'Priya', 31, 'F', 'Hyderabad', '9876543214', NULL);
INSERT INTO PASSENGER VALUES (106, 'Kiran', 19, 'M', 'Guntur', '9876543215', '9123456782');
INSERT INTO PASSENGER VALUES (107, 'Arjun', 65, 'M', 'Vijayawada', NULL, '9123456783');
INSERT INTO PASSENGER VALUES (108, 'Rani', 27, 'F', 'Tirupati', '9876543217', NULL);
INSERT INTO PASSENGER VALUES (109, 'Rahul', 38, 'M', 'Hyderabad', '9876543218', NULL);
INSERT INTO PASSENGER VALUES (110, 'Suresh', 55, 'M', 'Guntur', NULL, NULL);
SELECT * FROM Passenger;

CREATE TABLE TRAIN(TrainID INT PRIMARY KEY,TrainName VARCHAR(50),SourceE VARCHAR(30),Destination VARCHAR(30),Fare DECIMAL(10,2));
INSERT INTO TRAIN VALUES
(201, 'Godavari Express', 'Visakhapatnam', 'Hyderabad', 650),
(202, 'Simhadri Express', 'Visakhapatnam', 'Hyderabad', 420),
(203, 'Krishna Express', 'Vijayawada', 'Hyderabad', 550),
(204, 'Rayalaseema Express', 'Tirupati', 'Hyderabad', 700),
(205, 'Amaravati Express', 'Guntur', 'Hyderabad', 600),
(206, 'Godavari Superfast', 'Visakhapatnam', 'Vijayawada', 800),
(207, 'Narasapur Express', 'Vijayawada', 'Visakhapatnam', 500),
(208, 'Swarna Express', 'Hyderabad', 'Visakhapatnam', 750);
SELECT * FROM TRAIN;

CREATE TABLE BOOKING(BookingID INT PRIMARY KEY,PassengerID INT,TrainID INT,JourneyDate DATE,SeatClass VARCHAR(20),TicketStatus VARCHAR(20),AmountPaid DECIMAL(10,2),Remarks VARCHAR(100));
INSERT INTO BOOKING VALUES
(301, 101, 201, '2026-08-20', 'AC', 'Confirmed', 650, NULL),
(302, 102, 203, '2026-08-21', 'Sleeper', 'Confirmed', 550, 'Window Seat'),
(303, 103, 202, '2026-08-22', 'AC', 'Waiting', 420, NULL),
(304, 104, 206, '2026-08-23', 'AC', 'Confirmed', 800, 'Meal Required'),
(305, 105, 205, '2026-08-24', 'Sleeper', 'Cancelled', 600, 'Cancelled by passenger'),
(306, 101, 204, '2026-08-25', 'AC', 'Confirmed', 700, NULL),
(307, 106, 203, '2026-08-26', 'Sleeper', 'Waiting', 550, NULL),
(308, 107, 201, '2026-08-27', 'AC', 'Confirmed', 650, 'Senior Citizen'),
(309, 108, 207, '2026-08-28', 'Sleeper', 'Confirmed', 500, NULL),
(310, 109, 208, '2026-08-29', 'AC', 'Cancelled', 750, 'Payment issue'),
(311, 105, 201, '2026-08-30', 'AC', 'Confirmed', 650, NULL),
(312, 102, 206, '2026-08-31', 'Sleeper', 'Confirmed', 800, NULL),
(313, 103, 203, '2026-09-01', 'Sleeper', 'Waiting', 550, NULL),
(314, 104, 201, '2026-09-02', 'AC', 'Confirmed', 650, 'Lower Berth'),
(315, 108, 204, '2026-09-03', 'AC', 'Cancelled', 700, NULL);
SELECT * FROM BOOKING;
alter table BOOKING
rename column AountPaid to AmountPaid;

CREATE TABLE STATION(StationID INT PRIMARY KEY,StationName VARCHAR(50), City VARCHAR(50),State VARCHAR(30));
INSERT INTO STATION VALUES
(401, 'Secunderabad Junction', 'Hyderabad', 'Telangana'),
(402, 'Visakhapatnam Junction', 'Visakhapatnam', 'Andhra Pradesh'),
(403, 'Vijayawada Junction', 'Vijayawada', 'Andhra Pradesh'),
(404, 'Guntur Junction', 'Guntur', 'Andhra Pradesh'),
(405, 'Tirupati Railway Station', 'Tirupati', 'Andhra Pradesh'),
(406, 'Hyderabad Deccan', 'Hyderabad', 'Telangana');
SELECT * FROM STATION;

select PassengerName as pn, City as c ,Phone as ph
from Train 
order by fare;

select  TrainName, Fare ,Fare*10/100 as discount , Fare - (Fare*10/100) as final_fare
from Train;

select AmountPaid ,AmountPaid + 10 as FinalAmountPaid
from BOOKING;

select b.BookingID, t.Fare, t.Fare + (t.Fare*20/100) as TatkalFare 
from  BOOKING b
join TRAIN t
on b.TrainID=t.TrainID
where b.SeatClass ='AC';

select b.BookingID, t.Fare, t.Fare + (t.Fare*15/100) as TatkalFare 
from  BOOKING b
join TRAIN t
on b.TrainID=t.TrainID
where b.SeatClass ='AC' and t.fare>500;

select Fare, Fare - (Fare*20/100) as Discount
from  Train;

select TrainID,Fare, Fare + (Fare*18/100) as FarewithGST
from  Train;

select TrainID,Fare, Fare + 50 as totalfare 
from  Train;

select * from BOOKING 
where TicketStatus<> cancelled;

select * from passenger
where age> 30;

select PassengerName, Age,City from Passenger 
where Age>=28 and City="Hyderabad";

select TrainID from TRAIN
where Fare<500;

select * from passenger
where City<>'Hyderabad';

select * from passenger
where Age>=19;


select * from BOOKING
where SeatClass='AC' AND TicketStatus='Confirmed';

select * from BOOKING
where SeatClass='AC' AND TicketStatus='Cancelled';

select * from TRAIN
where Fare>600 or Destination='Hyderabad';

select * from booking
where amountpaid>= 500 and not ticketstatus='cancelled';

select seatclass from booking where seatclass like '_c';
select trainname from train where trainname like '%i%';
select trainname from train where trainname like '__i';

select passengername , city from passenger where city='hyderabad' or city='vijayawada';
select passengername , city from passenger where city in('hyderabad','vijayawada');
 
 select passengername from passenger where passengername like 'r%';
 select passengername , city from passenger where city in('hyderabad','vijayawada','guntur');
 select passengername from passenger where phone is null;
 select passengername from passenger where phone is not null;
 select * from passenger where passengername like '%ra%';
 select passengername from passenger where passengername like '___i';
 
 select * from booking
 where passengerid in(101,103,105) and ticketstatus='confirmed';

select * from booking
where seatclass='AC' and amountpaid>600;

select trainname,destination,fare from train
where sourceE='hyderabad'
order by fare ;

select * from train
where trainname like '_express' and fare<800
order by fare;

select p.passengername,p.city,t.trainname,t.sourceE,b.journeydate,b.ticketstatus from passenger p
join booking b
on p.passengerid=b.passengerid 
join train t
on b.trainid=t.trainid
where ticketstatus='confirmed' and city!=sourceE;

select * from booking
where trainid=(select trainid from train
where trainname='krishna express');

select * from passenger 
where passengerid in (select passengerid from 
booking );

select * from booking
where trainid in(select trainid from train
where sourceE='visakhapatnam');

select * from passenger
where passengerid in(
select passengerid from  booking
where trainid in(select trainid from train
where sourceE='visakhapatnam'));


select count(bookingid) from  booking;

select min(fare) from train;

select avg(fare) from train
where sourceE='visakhapatnam';

select sum(amountpaid) from booking
where ticketstatus='confirmed';

select ticketstatus,count(bookingid) from booking
group by ticketstatus;


/*
ALTER TABLE Booking
ADD CONSTRAINT fk_passenger
FOREIGN KEY (PassengerID)
REFERENCES Passenger(PassengerID);

ALTER TABLE Booking
ADD CONSTRAINT fk_train
FOREIGN KEY(TrainID)
REFERENCES Train(TrainID);
SELECT passengername,city FROM PASSENGER;
SELECT TrainName,fare FROM TRAIN;
SELECT Passengername FROM PASSENGER WHERE city="HYDERABAD";
SELECT trainName,fare FROM TRAIN WHERE fare>500;
SELECT * FROM BOOKING WHERE TicketStatus="CONFIRMED";
SELECT * FROM PASSENGER WHERE AGE BETWEEN 13 AND 19;



SELECT  TrainName FROM TRAIN ORDER BY FARE ;
SELECT BookingID FROM BOOKING ORDER BY JOURNEYDATE DESC;
SELECT BookingID FROM BOOKING ORDER BY TicketStatus ASC,AOUNTPAID DESC;
SELECT FARE ,FARE-(FARE*0.15) AS Finalfar FROM TRAIN; */




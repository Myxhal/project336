DROP DATABASE IF EXISTS `TravelReservation`;
CREATE DATABASE IF NOT EXISTS`TravelReservation`;
USE `TravelReservation`;

DROP TABLE IF EXISTS `airline`;
CREATE TABLE airline(airlineID char(2) PRIMARY KEY);

DROP TABLE IF EXISTS `plane`;
CREATE TABLE Plane(planeID varchar(20), seats int, airlineID char(2),
PRIMARY KEY (planeID),
FOREIGN KEY (airlineID) REFERENCES Airline(airlineID));

DROP TABLE IF EXISTS `airport`;
CREATE TABLE airport(AirportID char(3) PRIMARY KEY);

DROP TABLE IF EXISTS `customerRep`;
CREATE TABLE customerRep(ID varchar(10), password varchar (20),
PRIMARY KEY (ID));

DROP TABLE IF EXISTS `admin`;
CREATE TABLE admin(ID varchar(10), password varchar(20),
PRIMARY KEY (ID));

DROP TABLE IF EXISTS `customer`;
CREATE TABLE customer(ID varchar(10), password varchar(20),
PRIMARY KEY (ID));

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE ticket(tid varchar(10), cid varchar(10), airline char(2), planeID varchar(20), 
dep_airport char(3), dep_date date, dep_time time, arr_airport char(3), arr_date date,  
class varchar(50), fare varchar(10), 
PRIMARY KEY (tid),
FOREIGN KEY (cid) REFERENCES customer(ID),
FOREIGN KEY (airline) REFERENCES airline(airlineID),
FOREIGN KEY (planeID) REFERENCES plane(planeID));

DROP TABLE IF EXISTS `flights`;
CREATE TABLE flights(FID varchar(20) PRIMARY KEY, OperationDays varchar(100), 
arrivalTime date, departureTime date, planeType varchar(50), DomesticFlight boolean, InteralFlight boolean, 
depid char(3), destid char(3), departPlane varchar(20), destPlane varchar(20),
FOREIGN KEY (depid) REFERENCES Airport(AirportID),
FOREIGN KEY (destid) REFERENCES Airport(AirportID),
FOREIGN KEY (departPlane) REFERENCES Plane(planeID),
FOREIGN KEY (destPlane) REFERENCES Plane(planeID));

DROP TABLE IF EXISTS `questions`;
CREATE TABLE questions(ID varchar(10), question varchar(100),
PRIMARY KEY(ID, question),
FOREIGN KEY (ID) REFERENCES customer(ID));

DROP TABLE IF EXISTS `replies`;
CREATE TABLE replies(ID varchar(10), question varchar(100), 
repID varchar(10), reply varchar(100),
PRIMARY KEY (ID, question, reply),
FOREIGN KEY (ID) REFERENCES customer(ID),
FOREIGN KEY (repID) REFERENCES customerRep(ID),
FOREIGN KEY (question) references questions(question));


insert into customer(ID, password) 
values('1001', 'password');

insert into customer(ID, password)
values('1002', 'finalproject');

insert into customer(ID, password)
values('1003', 'part3');

select * from customer;

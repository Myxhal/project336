DROP DATABASE IF EXISTS `TravelReservation`;
CREATE DATABASE IF NOT EXISTS`TravelReservation`;
USE `TravelReservation`;

DROP TABLE IF EXISTS `airline`;
CREATE TABLE airline(airlineID char(2) PRIMARY KEY);

DROP TABLE IF EXISTS `plane`;
CREATE TABLE Plane(planeID varchar(20), seats int, airlineID char(2),
PRIMARY KEY (planeID));

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
CREATE TABLE ticket(tid varchar(30), cid varchar(10), airline char(2), planeID varchar(20), 
dep_airport char(3), dep_date date, dep_time time, arr_airport char(3), purchase_date date,  
class varchar(50), fare varchar(10),
PRIMARY KEY (tid));

DROP TABLE IF EXISTS `flights`;
CREATE TABLE flights(FID varchar(20) PRIMARY KEY, airline char(2), planeid varchar(30),
dep_airport char(3), dep_date date, dep_time time, arr_airport char(3), arr_date date, arr_time time, 
f_type varchar(20), stops int, eco_price int, bus_price int, first_price int, seats int, Domestic varchar(20));

DROP TABLE IF EXISTS `questions`;
CREATE TABLE questions(cID varchar(10), question varchar(100),
PRIMARY KEY(cID, question));

DROP TABLE IF EXISTS `replies`;
CREATE TABLE replies(ID varchar(10), question varchar(100), 
repID varchar(10), reply varchar(100),
PRIMARY KEY (ID, question, reply));

DROP TABLE IF EXISTS `waitingList`;
CREATE TABLE waitingList(ID varchar(10), airline char(2), planeid varchar(30), dep_date date,
PRIMARY KEY (ID, airline, planeid, dep_date));


insert into customer(ID, password) 
values('1001', 'password');

insert into customer(ID, password)
values('1002', 'finalproject');

insert into customer(ID, password)
values('1003', 'part3');

insert into replies(id, question, repid, reply)
values('1001', 'Hi how are you?', 'repdeez', "Terrible");

select * from replies WHERE reply LIKE '%ter%';

insert into ticket(tid, cid, airline, planeid, dep_airport, dep_date, dep_time, arr_airport, purchase_date, class, fare)
values('1234', '1001', 'UD', 'nxb7ef', 'LAX', '2023-12-29', '2:00:00', 'EWR', '2023-11-23', 'First Class', 315);

insert into admin(id, password)
values ('admin1', 'adminpass');

select * from admin;
select * from ticket;
select * from flights;

insert into flights(fid, airline, planeid, dep_airport, dep_date, dep_time, arr_airport, arr_date, arr_time, f_type, stops,
eco_price, bus_price, first_price, seats, domestic)
values('8b472', 'UD', 'fh873', 'PHL', '2023-12-30', '11:30:00', 'TPA', '2023-12-30', '14:15:00', 
'One Way', 0, 150, 350, 500, 20, 'Domestic');
select * from flights;

-- Sample data for airline table
INSERT INTO airline (airlineID) VALUES ('AA');
INSERT INTO airline (airlineID) VALUES ('UA');
INSERT INTO airline (airlineID) VALUES ('DL');

-- Sample data for Plane table
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('PL001', 150, 'AA');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('PL002', 200, 'UA');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('PL003', 180, 'DL');

-- Sample data for airport table
INSERT INTO airport (AirportID) VALUES ('JFK');
INSERT INTO airport (AirportID) VALUES ('LAX');
INSERT INTO airport (AirportID) VALUES ('ORD');

-- Sample data for customerRep table
INSERT INTO customerRep (ID, password) VALUES ('rep1', 'password1');
INSERT INTO customerRep (ID, password) VALUES ('rep2', 'password2');
INSERT INTO customerRep (ID, password) VALUES ('rep3', 'password3');

-- Sample data for admin table
INSERT INTO admin (ID, password) VALUES ('admin1', 'adminpass1');
INSERT INTO admin (ID, password) VALUES ('admin2', 'adminpass2');
INSERT INTO admin (ID, password) VALUES ('admin3', 'adminpass3');

-- Sample data for customer table
INSERT INTO customer (ID, password) VALUES ('user1', 'userpass1');
INSERT INTO customer (ID, password) VALUES ('user2', 'userpass2');
INSERT INTO customer (ID, password) VALUES ('user3', 'userpass3');

-- Sample data for ticket table
INSERT INTO ticket (tid, cid, airline, planeID, dep_airport, dep_date, dep_time, arr_airport, purchase_date, class, fare)
VALUES
    ('T001', 'user1', 'AA', 'PL001', 'JFK', '2023-01-01', '12:00:00', 'LAX', '2023-01-01', 'Economy', '100.00'),
    ('T002', 'user2', 'UA', 'PL002', 'LAX', '2023-02-01', '22:00:00', 'ICN', '2023-02-01', 'Business', '1200.00'),
    ('T003', 'user3', 'DL', 'PL003', 'ORD', '2023-03-01', '10:00:00', 'JFK', '2023-03-01', 'First Class', '300.00');

-- Sample data for flights table
INSERT INTO flights (FID, airline, planeid, dep_airport, dep_date, dep_time, arr_airport, arr_date, arr_time, f_type, stops, eco_price, bus_price, first_price, seats, Domestic)
VALUES
    ('F001', 'AA', 'PL001', 'JFK', '2023-01-01', '12:00:00', 'LAX', '2023-01-01', '15:00:00', 'One Way', 0, 150, 300, 500, 150, 'Domestic'),
    ('F002', 'UA', 'PL002', 'LAX', '2023-02-01', '14:00:00', 'ICN', '2023-02-01', '22:00:00', 'Round Trip', 0, 1200, 1400, 1600, 200, 'International'),
    ('F003', 'DL', 'PL003', 'ORD', '2023-03-01', '10:00:00', 'JFK', '2023-03-01', '13:00:00', 'Round Trip', 0, 250, 450, 700, 180, 'Domestic');

-- Sample data for questions table
INSERT INTO questions (cID, question) VALUES ('user1', 'How can I change my seat?');
INSERT INTO questions (cID, question) VALUES ('user2', 'What is the baggage policy?');
INSERT INTO questions (cID, question) VALUES ('user3', 'Can I bring my pet on board?');

-- Sample data for replies table
INSERT INTO replies (ID, question, repID, reply) VALUES ('user1', 'How can I change my seat?', 'rep1', 'You can change your seat by...');
INSERT INTO replies (ID, question, repID, reply) VALUES ('user2', 'What is the baggage policy?', 'rep2', 'The baggage policy allows...');
INSERT INTO replies (ID, question, repID, reply) VALUES ('user3', 'Can I bring my pet on board?', 'rep3', 'Yes, you can bring your pet under certain conditions.');

-- Sample data for waitingList table
INSERT INTO waitingList (ID, airline, planeid, dep_date) VALUES ('user1', 'AA', 'PL001', '2023-02-01');
INSERT INTO waitingList (ID, airline, planeid, dep_date) VALUES ('user2', 'UA', 'PL002', '2023-03-01');
INSERT INTO waitingList (ID, airline, planeid, dep_date) VALUES ('user3', 'DL', 'PL003', '2023-04-01');

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
CREATE TABLE questions(cID varchar(10), question varchar(900));

DROP TABLE IF EXISTS `replies`;
CREATE TABLE replies(ID varchar(10), question varchar(900), 
repID varchar(10), reply varchar(900));

DROP TABLE IF EXISTS `waitingList`;
CREATE TABLE waitingList(ID varchar(10), airline char(2), planeid varchar(30), dep_date date,
PRIMARY KEY (ID, airline, planeid, dep_date));


insert into customer(ID, password) 
values('1001', 'password');

insert into admin(id, password)
values ('admin1', 'adminpass');

-- Sample data for airline table
INSERT INTO airline (airlineID) VALUES ('AA');
INSERT INTO airline (airlineID) VALUES ('UA');
INSERT INTO airline (airlineID) VALUES ('SW');

-- Sample data for Plane table
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('eb321', 150, 'AA');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('hv890', 200, 'UA');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('pv734', 180, 'SW');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('lh894', 170, 'AA');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('tv882', 190, 'UA');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('ml194', 200, 'SW');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('ph647', 180, 'AA');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('zc836', 210, 'UA');
INSERT INTO Plane (planeID, seats, airlineID) VALUES ('fh873', 200, 'UA');

-- Sample data for airport table
INSERT INTO airport (AirportID) VALUES ('JFK');
INSERT INTO airport (AirportID) VALUES ('LAX');
INSERT INTO airport (AirportID) VALUES ('ORD');
INSERT INTO airport (AirportID) VALUES ('TPA');
INSERT INTO airport (AirportID) VALUES ('PHL');
INSERT INTO airport (AirportID) VALUES ('MCO');
INSERT INTO airport (AirportID) VALUES ('LHR');
INSERT INTO airport (AirportID) VALUES ('ICN');

-- Sample data for customerRep table
INSERT INTO customerRep (ID, password) VALUES ('rep1', 'password1');
INSERT INTO customerRep (ID, password) VALUES ('rep2', 'password2');
INSERT INTO customerRep (ID, password) VALUES ('rep3', 'password3');

-- Sample data for customer table
INSERT INTO customer (ID, password) VALUES ('user1', 'userpass1');
INSERT INTO customer (ID, password) VALUES ('user2', 'userpass2');
INSERT INTO customer (ID, password) VALUES ('user3', 'userpass3');

-- Sample data for ticket table
INSERT INTO ticket (tid, cid, airline, planeID, dep_airport, dep_date, dep_time, arr_airport, purchase_date, class, fare)
VALUES
    ('eb321user1', 'user1', 'AA', 'eb321', 'JFK', '2023-01-01', '12:00:00', 'LAX', '2023-01-01', 'Economy Class', '300.00'),
    ('hv890user2', 'user2', 'UA', 'hv890', 'LAX', '2023-02-01', '22:00:00', 'ICN', '2023-02-11', 'Business Class', '1550.00'),
    ('pv734user3', 'user3', 'SW', 'pv734', 'ORD', '2023-03-01', '10:00:00', 'JFK', '2023-03-07', 'First Class', '850.00');

-- Sample data for questions table
INSERT INTO questions (cID, question) VALUES ('user1', 'How can I change my seat?');
INSERT INTO questions (cID, question) VALUES ('user2', 'What is the baggage policy?');

-- Sample data for replies table
INSERT INTO replies (ID, question, repID, reply) VALUES ('user3', 'Can I bring my pet on board?', 'rep3', 'Only service animals are allowed.');

-- Sample data for waitingList table
INSERT INTO waitingList (ID, airline, planeid, dep_date) VALUES ('user1', 'UA', 'tv882', '2023-05-01');
INSERT INTO waitingList (ID, airline, planeid, dep_date) VALUES ('user2', 'UA', 'zc836', '2023-07-01');
INSERT INTO waitingList (ID, airline, planeid, dep_date) VALUES ('user3', 'AA', 'ph647', '2023-08-01');

INSERT INTO flights (FID, airline, planeid, dep_airport, dep_date, dep_time, arr_airport, arr_date, arr_time, f_type, stops, eco_price, bus_price, first_price, seats, Domestic)
VALUES
	('F009', 'UA', 'fh873', 'PHL', '2023-12-30', '11:30:00', 'TPA', '2023-12-30', '14:15:00', 'One Way', 0, 150, 350, 500, 200, 'Domestic'),
    ('F001', 'AA', 'eb321', 'JFK', '2023-01-01', '12:00:00', 'LAX', '2024-01-01', '15:00:00', 'One Way', 0, 150, 300, 500, 150, 'Domestic'),
    ('F002', 'UA', 'hv890', 'LAX', '2023-02-01', '14:00:00', 'ICN', '2024-02-11', '22:00:00', 'Round Trip', 0, 1200, 1400, 1600, 200, 'International'),
    ('F003', 'SW', 'pv734', 'ORD', '2023-03-01', '10:00:00', 'JFK', '2024-03-07', '13:00:00', 'Round Trip', 0, 250, 450, 700, 180, 'Domestic'),
    ('F004', 'AA', 'lh904', 'JFK', '2023-04-01', '08:00:00', 'LAX', '2024-04-05', '11:00:00', 'Round Trip', 0, 180, 350, 550, 170, 'International'),
    ('F005', 'UA', 'tv882', 'LAX', '2023-05-01', '16:00:00', 'ORD', '2024-05-01', '19:00:00', 'One Way', 0, 220, 420, 650, 190, 'Domestic'),
    ('F006', 'SW', 'ml194', 'LHR', '2023-06-01', '11:00:00', 'JFK', '2024-06-01', '14:00:00', 'One Way', 0, 760, 1480, 1720, 200, 'International'),
    ('F007', 'AA', 'ph647', 'JFK', '2023-07-01', '14:00:00', 'LAX', '2024-07-09', '17:00:00', 'Round Trip', 0, 400, 780, 1100, 180, 'Domestic'),
    ('F008', 'UA', 'zc386', 'LAX', '2023-08-01', '18:00:00', 'FCO', '2024-08-01', '21:00:00', 'Round Trip', 0, 1240, 1450, 1680, 210, 'International');


-- Sample data for waitingList table
INSERT INTO waitingList (ID, airline, planeid, dep_date) VALUES ('user1', 'AA', 'PL001', '2023-02-01');
INSERT INTO waitingList (ID, airline, planeid, dep_date) VALUES ('user2', 'UA', 'PL002', '2023-03-01');
INSERT INTO waitingList (ID, airline, planeid, dep_date) VALUES ('user3', 'DL', 'PL003', '2023-04-01');

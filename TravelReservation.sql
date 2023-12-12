DROP TABLE IF EXISTS `replies`;
CREATE TABLE replies(ID varchar(10), question varchar(100), 
repID varchar(10), reply varchar(100),
PRIMARY KEY (ID, question, reply));
/*FOREIGN KEY (ID) REFERENCES customer(ID),
FOREIGN KEY (repID) REFERENCES customerRep(ID),
FOREIGN KEY (question) references questions(question));*/

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

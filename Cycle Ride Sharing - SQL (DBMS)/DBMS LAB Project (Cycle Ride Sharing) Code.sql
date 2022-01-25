DROP TABLE Customer;
DROP TABLE Provider;
DROP TABLE Cycle;
DROP TABLE Provide;
DROP TABLE Bill;
DROP TABLE Discount;
DROP TABLE Pay;
DROP TABLE Rid;

CREATE TABLE Customer (
  C_ID varchar(20),
Name varchar(50) NOT NULL,
Age float NOT NULL,
Gender varchar(100) NOT NULL,
    Address varchar(100) NOT NULL,
    Occupation varchar(100) NOT NULL,
    Email_ID varchar(100) UNIQUE,
    Phone_No varchar(15) UNIQUE,
    PRIMARY KEY (C_ID)
);

CREATE TABLE Provider(
    Provider_ID varchar (20),
    Povider_Name varchar (30) NOT NULL,
    Provider_Phone varchar(15) NOT NULL,
    Provider_Email varchar(30) NOT NULL,
    Provider_Address varchar(30) NOT NULL,
    PRIMARY KEY (Provider_ID) 
);

CREATE TABLE Cycle(
    Cycle_ID varchar(20),
    Type varchar(50) NOT NULL,
    Registration_No varchar(50) UNIQUE,
    Cy_Status varchar (20) NOT NULL
 	PRIMARY KEY (Cycle_ID)
);

CREATE TABLE Provide(
Provider_ID varchar (20),
Cycle_ID varchar(20),
Providing_Date varchar (20),
FOREIGN KEY (Provider_ID) REFERENCES provider(Provider_ID) ON UPDATE  CASCADE ON DELETE CASCADE,
FOREIGN KEY (Cycle_ID) REFERENCES cycle ( Cycle_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Bill( 
Bill_ID varchar (20),
Boarding_Point varchar (20) NOT NULL,
Dropping_Point varchar (20) NOT NULL,
Distance_KM float NOT NULL,
Date_Of_Ride varchar (20) NOT NULL,
PRIMARY KEY (Bill_ID) 
);

CREATE TABLE Discount (
Bill_ID varchar (20),
Coupon_Code varchar (20) UNIQUE,
Discount_Amount float NOT NULL,
FOREIGN KEY (Bill_ID) REFERENCES bill(Bill_ID) ON UPDATE   CASCADE ON DELETE CASCADE  
);

CREATE TABLE Pay(
Customer_ID varchar (20),
Bill_ID varchar (20) UNIQUE,
Cycle_ID varchar (20),
Amount float NOT NULL,
Pay_Status varchar (10) NOT NULL,      
FOREIGN KEY (Customer_ID) REFERENCES customer(C_ID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Bill_ID) REFERENCES bill(Bill_ID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Cycle_ID) REFERENCES provide(Cycle_ID) ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE Rid(
Cycle_ID varchar (20),
Customer_ID varchar (20),

FOREIGN KEY (Cycle_ID) REFERENCES cycle(Cycle_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Customer_ID) REFERENCES customer(C_ID) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO customer (C_ID,Name,Age,Gender,Address,Occupation,Email_ID,Phone_No)
VALUES
('1001','Md.Abtab Uddin Akib',21,'Male','Mirpur 1','Student','akib@gmail.com','01666666666'),
INSERT INTO Customer VALUES
('1002','Md Kawser',22,'male','Gazipur','Student','kawser@gmail.com','01999999999'),
INSERT INTO Customer VALUES
('1003','Abdul Kayum',21,'male','Uttara','Student','kayum@gmail.com','01555555555'),
INSERT INTO Customer VALUES  
('1004','Mosfik Rahman',21,'Male','Khagan','Student','mosfik@gmail.com','01777777777'),
INSERT INTO Customer VALUES
('1005','Mahfuza Mahin',21,'Female','YKSG','Student','mahin@gmail.com','0156666665'),
INSERT INTO Customer VALUES
('1006','Zobayer  Sheik             ',24,'Male','Ashulia','Student','zobzyer@gmail.com','01940635869'),
INSERT INTO Customer VALUES
('1007','Ela',23,'Female','Uttara','Student','ela@gmail.com','01787114278'),
INSERT INTO Customer VALUES
('1008','Jabin',24,'Female','Ashulia','Student','jabin@gmail.com','01300000000'),
INSERT INTO Customer VALUES
('1009','Sourov',34,'Male','Dattapara','Teacher','sourov@gmail.com','01830635861'),
INSERT INTO Customer VALUES
('1010','nabil',32,'Male','Ashulia','Student','nabil@gmail.com','01222635866');

INSERT INTO provider
VALUES
('01','Farhan Sadiq','01774339285','far@gmail.com','Savar'),
INSERT INTO provider VALUES
('02','Abdur Rashid','01774339286','rah@gmail.com','Mirpur'),
INSERT INTO provider VALUES
('03','Karim Hasan','01774339288','kar@gmail.com','Mirpur'),
INSERT INTO provider VALUES
('04','Kasem Khan','01924339287','kas@gmail.com','Mirpur'),
INSERT INTO provider VALUES
('05','Ayman Sadiq','01924339281','ay@gmail.com','	Ashulia'),
INSERT INTO provider VALUES
('06','Dhiman Roy','01924339283','dhi@gmail.com','Ashulia'),
INSERT INTO provider VALUES
('07','Shamim Hossain','01844339287','sha@gmail.com','Savar');

INSERT INTO cycle(Cycle_ID,Type,Registration_No,Cy_Status)
VALUES
("S100","Pedal","DIU-S100","Good"),
INSERT INTO Cycle VALUES
("S101","Auto","DIU-S101","Excellent"),
INSERT INTO Cycle VALUES
("S102","Auto","DIU-S102","Good"),
INSERT INTO Cycle VALUES
("S103","Pedal","DIU-S103","Bad"),
INSERT INTO Cycle VALUES
("S104","Pedal","DIU-S104","Good"),
INSERT INTO Cycle VALUES
("S105","Auto","DIU-S105","Medium"),
INSERT INTO Cycle VALUES
("S106","Auto","DIU-S106","Excellent"),
INSERT INTO Cycle VALUES
("S107","Pedal","DIU-S107","Good"),
INSERT INTO Cycle VALUES
("S108","Pedal","DIU-S108","Bad"),
INSERT INTO Cycle VALUES
("S109","Pedal","DIU-S109","Good");

INSERT INTO Provide
VALUES
('01', 'S100', '01-04-2019'),
INSERT INTO Provide VALUES
('02', 'S101', '03-04-2019'),
INSERT INTO Provide VALUES
('03', 'S102', '02-04-2019'),
INSERT INTO Provide VALUES
('04', 'S103', '03-04-2019'),
INSERT INTO Provide VALUES
('05', 'S104', '04-04-2019'),
INSERT INTO Provide VALUES
('06', 'S105', '05-04-2019'),
INSERT INTO Provide VALUES
('07', 'S106', '05-04-2019');

INSERT INTO Bill
VALUES
('G10001', 'DIU PC', 'Savar', '8', '01-04-2019'),
INSERT INTO Bill VALUES
('G10002', 'DIU PC', 'Khagan', '4', '02-04-2019'),
INSERT INTO Bill VALUES
('G10003', 'DIU PC', 'Akraine', '3', '03-04-2019'),
INSERT INTO Bill VALUES
('G10004', 'DIU PC', 'Ashulia', '6', '04-04-2019'),
INSERT INTO Bill VALUES
('G10005', 'Akraine', 'DIU PC', '8', '05-04-2019'),
INSERT INTO Bill VALUES
('G10006', 'Khagan', 'DIU PC', '8', '06-04-2019'),
INSERT INTO Bill VALUES
('G10007', 'Ashulia', 'DIU PC', '7', '07-04-2019'),
INSERT INTO Bill VALUES
('G10008', 'Khagan', 'DIU PC', '2', '08-04-2019'),
INSERT INTO Bill VALUES
('G10009', 'Khagan', 'DIU PC', '3', '09-04-2019'),
INSERT INTO Bill VALUES
('G10010', 'Khagan', 'DIU PC', '4', '10-04-2019');

INSERT INTO discount
VALUES
('G10001','GHURRR',100),
INSERT INTO Discount VALUES   						                                                                   
('G10002','GHOOOP',45),
INSERT INTO Discount VALUES
('G10003','GHUSSS',100),
INSERT INTO Discount VALUES
('G10004','GHUEEE',150),
INSERT INTO Discount VALUES
('G10005','GHUYYY',60),
INSERT INTO Discount VALUES
('G10006','GHUZZZ',100),
INSERT INTO Discount VALUES
('G10007','GHUAAA',92),
INSERT INTO Discount VALUES
('G10008','GHUBBB',100),
INSERT INTO Discount VALUES
('G10009','GHUBBX',85),
INSERT INTO Discount VALUES
('G10010','GHUDDD',100);

INSERT INTO Pay 
VALUES
('1001','G10001','S100',500,'Done'),
INSERT INTO Pay VALUES
('1001','G10002','S100',400,'Done'),
INSERT INTO Pay VALUES
('1003','G10003','S101',300,'Done'),
INSERT INTO Pay VALUES
('1003','G10004','S106',250,'Done'),
INSERT INTO Pay VALUES
('1003','G10005','S101',450,'Done'),
INSERT INTO Pay VALUES
('1006','G10006','S103',200,'Done'),
INSERT INTO Pay VALUES
('1004','G10007','S101',900,'Done'),
INSERT INTO Pay VALUES
('1004','G10008','S102',300,'Done'),
INSERT INTO Pay VALUES
('1004','G10009','S101',700,'Done'),
INSERT INTO Pay VALUES
('1002','G10010','S104',300,'Done');

INSERT INTO Ride (Cycle_ID, Customer_ID)
VALUES
('S100', '1001'),
INSERT INTO Ride VALUES
('S100', '1002'),
INSERT INTO Ride VALUES
('S101', '1003'),
INSERT INTO Ride VALUES
('S106', '1004'),
INSERT INTO Ride VALUES
('S101', '1005'),
INSERT INTO Ride VALUES
('S103', '1006'),
INSERT INTO Ride VALUES
('S101', '1007'),
INSERT INTO Ride VALUES
('S102', '1008'),
INSERT INTO Ride VALUES
('S101', '1009'),
INSERT INTO Ride VALUES
('S104', '1010');



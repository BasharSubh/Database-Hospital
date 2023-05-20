Use master
go
CREATE DATABASE [hospital] ON primary
( 
NAME = N' hospital_dat',
FILENAME = N'c:\hospital.mdf', SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 2048KB )
LOG ON
( NAME = N' hospital_log', FILENAME = N'c:\hospital_log.ldf', SIZE = 1024KB ,
MAXSIZE = 512MB , FILEGROWTH = 10%)





CREATE TABLE [dbo].[Patients](
[PSSNO] [int] CONSTRAINT [PK_Patients] PRIMARY KEY ,
[FirstName] [varchar](15) NOT NULL,
[LastName] [varchar](15) NOT NULL ,
[DOB] [DateTime] NOT NULL,
[sex] [varchar](6)NOT NULL,
[Street] [char] (20) NULL,
[City] [char] (20) NULL CONSTRAINT [df_city]  DEFAULT ('syria'),	
[homephone] [int] NOT NULL)


ALTER TABLE [dbo].[Patients] ADD CONSTRAINT
[unique_city] UNIQUE ( [homephone])

CREATE TABLE [dbo].[Doctors](
[DSSNO] [smallint] CONSTRAINT [PK_doctors] PRIMARY KEY CLUSTERED,
[FirstName] [varchar](15) NOT NULL,
[LastName] [varchar](15) NOT NULL ,
[specialty] [char](20) NOT NULL ,
[Officephone] [int] NOT NULL,
[Mob] [int] NOT NULL )

ALTER TABLE [dbo].[Doctors] ADD CONSTRAINT
[unique_mob] UNIQUE ( [mob])

CREATE TABLE [dbo].[Examines](
[DSSNO] [smallint]  NOT NULL foreign key references doctors (DSSNO),
[PSSNO] [int] NOT NULL foreign key references patients (PSSNO),
[Date] [DateTime] NULL,
[Time] [DateTime] NULL,
[Diagnosis] [char](20) NOT NULL,
[Fee] [Money] NULL  CONSTRAINT  [df_fee]  DEFAULT (500),
)

CREATE TABLE [dbo].[Accounts](
[PSSNO] [int] NOT NULL  foreign key references patients (PSSNO),
[DateIn] [DateTime] NOT NULL,
[DateOut] [DateTime] NOT NULL,
[Total] [Money] NOT NULL
)

CREATE TABLE [dbo].[Beds](
[RoomNumber] [smallint] CONSTRAINT [PK_RoomNumber] PRIMARY KEY NONCLUSTERED,
[BedNumber] [smallint] ,
[Type] [smallint] NULL CONSTRAINT [Fk_type] foreign key references bedcosts (type),
[Status] [char](15) NOT NULL
)

CREATE TABLE [dbo].[BedCosts](
[Type] [smallint]  CONSTRAINT [PK_type] PRIMARY KEY NONCLUSTERED,
[PricePerHour] [Money] NOT NULL
)

CREATE TABLE [dbo].[Bed_Assignment](
[PSSNO] [int] foreign key references Patients (PSSNO),
[RoomNumber] [smallint] foreign key references beds (RoomNumber),
[BedNumber] [smallint] ,
[DateIN] [DateTime],
[Timein] [DateTime] NOT NULL,
[DateOut] [DateTime] NULL,
[TimeOut] [DateTime] NULL,	
[Amount] [Money] NULL )

INSERT INTO patients (PSSNO, FirstName, LastName, DOB, sex, Street, City, homephone) 
VALUES (1,'Loai' , 'anas' , '2-12-1982', 'male' , 'maza' , 'damascous',432423)
INSERT INTO patients
VALUES (2,'hiba' , 'mhd' , '4-15-1977', 'fmale' , 'medan' , 'damascous',234234)
INSERT INTO patients
VALUES (3,'rafie' , 'nar' , '8-22-1990', 'male', 'shabiba' , 'hama' , 12312312)
INSERT INTO patients
VALUES (4,'maher' , 'hussen' , '1-11-1984', 'male', 'alkaldeih' , 'homs',23423)
INSERT INTO patients
VALUES (5,'sara' , 'kasem' , '7-17-1998', 'fmale', 'thaoura' , 'raqa',324342)

INSERT INTO doctors (dSSNO, FirstName, LastName, specialty, Officephone, Mob) 
VALUES (1,'mohanad' , 'alnagar' , ' Promissory', 33242286 ,0988657842)
INSERT INTO doctors
VALUES (2,'saed' , 'alahmad' , ' heart', 33658754 , 0999675940)
INSERT INTO doctors
VALUES (3,'farah' , 'morad' , ' Surgery', 1155675 , 0962330428)
INSERT INTO doctors
VALUES (4,'hassan' , 'hussen' , ' children', 12245778 , 0988545681)
INSERT INTO doctors
VALUES (5,'emad' , 'flaha' , ' kind', 33598646 ,0934758204)

INSERT INTO Examines (DSSNO, PSSNO, Date, Time, Diagnosis, Fee) 
VALUES (1,2, '3-16-2013', 11.30, 'ssssss',500)
INSERT INTO Examines
VALUES (2,2, '7-4-2012', 10.00, 'ssssss',700)
INSERT INTO Examines
VALUES (3,3, '1-10-2013', 11.00, 'ssssss',500)
INSERT INTO Examines
VALUES (4,1, '8-1-2009', 9.30, 'ssssss',500)
INSERT INTO Examines
VALUES (5,4, '10-25-2012', 1.30, 'ssssss',350)


INSERT INTO Accounts (PSSNO, DateIn, DateOut, Total) 
VALUES (1,'3-16-2013', '', 15000)
INSERT INTO Accounts
VALUES (2,'7-4-2012', '7-4-2012' , 1000)
INSERT INTO Accounts
VALUES (3,'1-10-2013', '2-1-2013' , 13500)
INSERT INTO Accounts
VALUES (4,'8-1-2009', '9-10-2009' , 34000)
INSERT INTO Accounts
VALUES (5,'10-25-2012', '10-25-2012' , 640)

INSERT INTO Beds (RoomNumber, BedNumber, Type, Status) 
VALUES (11,1, 1 , ' occupied ')
INSERT INTO Beds
VALUES (44,1, 2 , ' available ')
INSERT INTO Beds
VALUES (512,1, 1 , ' available ')
INSERT INTO Beds
VALUES (3,1, 3 , ' available ')
INSERT INTO Beds
VALUES (7,1, 1 , ' available')
INSERT INTO Beds
VALUES (8,1, 1 , ' available ')
INSERT INTO Beds
VALUES (96,1, 2 , ' available ')


INSERT INTO BedCosts (Type, PricePerHour) 
VALUES (1,50)
INSERT INTO BedCosts
VALUES (2,75)
INSERT INTO BedCosts
VALUES (3,100)

INSERT INTO Bed_Assignment (PSSNO, RoomNumber, BedNumber, DateIN, Timein, DateOut, TimeOut , Amount ) 
VALUES (1,11, 1 , '3-16-2013', '9:00', '', '1:00',1200)
INSERT INTO Bed_Assignment
VALUES (2,44, 1 , '7-4-2012', '9:00', '7-4-2012', '1:00',900)
INSERT INTO Bed_Assignment
VALUES (3,512, 1 , '1-10-2013', '9:00', '2-1-2013', '1:00',24000)
INSERT INTO Bed_Assignment
VALUES (4,3, 1 , '8-1-2009', '9:00', '9-10-2009', '1:00',98400)
INSERT INTO Bed_Assignment
VALUES (5,7, 1 , '10-25-2012', '9:00', '10-25-2012', '1:00',600)




---------------
select * from doctors


---------------

select top 3 Examines.dssno as 'id doctor' ,doctors.firstname , doctors.lastname ,doctors.Specialty
 ,count(Examines.pssno) as 'number of visit' from Examines,doctors
where Examines.dssno=doctors.dssno
group by Examines.dssno,doctors.firstname,doctors.lastname ,doctors.Specialty

----------------
select  distinct specialty 
from doctors

----------------
select Bed_Assignment.pssno as 'id patient' ,patients.FirstName ,patients.lastname from Bed_Assignment,patients where  
Bed_Assignment.pssno=patients.pssno and
Bed_Assignment.dateout=''

---------------
select top 7 Accounts.pssno as 'id patient',min(Accounts.total)as 'minmany'  , patients.firstname ,
patients.lastname
 from Accounts,patients
where Accounts.pssno=patients.pssno
group by  Accounts.pssno,Accounts.total,patients.firstname,patients.lastname

---------------
select Examines.pssno as 'id patient' , patients.FirstName ,patients.lastname from Examines,patients where 
Examines.pssno=patients.pssno and
Examines.dssno in 
(select dssno from doctors where specialty=' children')

---------------

select pssno as 'id patient',firstname,lastname from patients 
where pssno in (select pssno from Examines 
where date=(getdate()))

--------------


CREATE PROCEDURE
AS BEGIN 
END
exec

--------------
CREATE PROCEDURE Addpatient
 @PSSNO int , @FirstName varchar(30), @lastName varchar(30), @City varchar(20),
 @DOB DateTime , @Street char(15), @sex char(7) , 
@homephone int 
AS BEGIN 
INSERT INTO patients (PSSNO, FirstName, LastName, DOB, sex, Street, City, homephone) 
values(@PSSNO, @FirstName, @lastName, @DOB, @sex, @Street, @City, @homephone)
END 


-----------------


CREATE view testpatient as select Examines.pssno as 'id patient',
patients.FirstName ,patients.lastname,
count(Examines.date) as 'Number of Visit' from Examines,patients
where Examines.pssno=patients.pssno
group by Examines.pssno,patients.FirstName ,patients.lastname

SELECT *
FROM testpatient

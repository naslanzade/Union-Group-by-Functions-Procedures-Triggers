create database Company

use Company

create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
);


create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[CountryId] int foreign key references Countries([Id])
);

create table Employees(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Surname] nvarchar(100),
[Age] int,
[Salary] decimal,
[Position] nvarchar(100),
[IsDeleted] bit,
[CityId] int foreign key references Cities([Id])
);

select * from Employees



insert into Employees([Name],[Surname],[Age],[Salary],[Position],[IsDeleted],[CityId])
values('Aygun','Mammadova',29,697.89,'Reception',0,1),
      ('Sabina','Gasimova',27,1300,'Hr',0,1),
	  ('Asli','Mahmudova',22,1200,'Specialist',1,4),
	  ('Fuad','Rasulov',26,1500,'Senior',0,3),
	  ('Elbay','Huseynli',33,2000,'Manager',1,2),
	  ('Ziya','Nasirov',37,3400,'Partner',0,1)


insert into Countries([Name])
values('Azerbaijan'),
       ('Turkey'),
	   ('Germany'),
	   ('United Kingdom')


insert into Cities([Name],[CountryId])
values('Baku',1),
       ('London',4),
	   ('Istanbul',2),
	   ('Berlin',3)


select * from Employees

select * from Cities

select * from Countries


--1
select * from Employees
join
Cities on
Employees.CityId=Cities.Id
join 
Countries on
Cities.CountryId=Countries.Id


--2
select Employees.[Name], Countries.[Name] from Employees
join
Countries on
Employees.CityId=Countries.Id
where [Salary]>2000


--3
select Cities.[Name],Countries.[Name] from Cities
join
Countries on
Cities.CountryId=Countries.id

--4
select Employees.[Name],Employees.[Surname],Employees.[Age],Employees.[Salary],Employees.[Position],Employees.[IsDeleted],Cities.[Name],Countries.[Name] from Employees
join
Cities on
Employees.CityId=Cities.Id
join 
Countries on
Cities.CountryId=Countries.Id
where [Position]='Reception'

--5
select Employees.[Name],Employees.[Surname],Employees.[Age],Cities.[Name],Countries.[Name] from Employees
join
Cities on
Employees.CityId=Cities.Id
join 
Countries on
Cities.CountryId=Countries.Id
where [IsDeleted]='true'





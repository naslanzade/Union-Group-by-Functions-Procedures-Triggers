
create database Course

use Course

create table  Customers(
[Id] int primary key identity(1,1),
[Name] nvarchar (100),
[Age] int,
[Address] nvarchar (100)
);


create table  Employees(
[Id] int primary key identity(1,1),
[Name] nvarchar (100),
[Age] int,
[Address] nvarchar (100)
);


insert into Customers([Name],[Age],[Address])
values('Anar',36,'Sumqayit'),
       ('Gultac',19,'Yasamal'),
       ('Vuqar',38,'Xirdalan'),
	   ('Novrasta',25,'Nesimi'),
	   ('Cavid',29,'Ehmedli'),
	   ('Lala',27,'Nesimi')
	   
	   
	   


insert into Employees([Name],[Age],[Address])
values('Musa',19,'Neftchiler'),
       ('Gultac',19,'Yasamal'),
	   ('Vuqar',38,'Xirdalan'),
	   ('Novrasta',25,'Nesimi'),
	   ('Murad',19,'Nzs'),	   
	   ('Mahir',21,'Sahil'),	   
	    ('Orkhan',21,'Ankara')

select * from Employees
union
select * from Customers

select * from Employees
union all
select * from Customers

select * from Employees
except
select * from Customers

select * from Employees
intersect
select * from Customers

select GETDATE()

select * from Employees 
order by [Age] asc

select * from Employees 
order by [Age] desc

select * from Employees 
order by [Name] asc

select * from Employees 
order by [Name] desc

select * from Employees  where [ID]>3
order by [Age] desc

select Count(*) as 'Count by age',age from Employees  
group by [Age] 

select Count(*) as 'Count by age',age from Employees  where [Age]>19
group by [Age] 

select Count(*) as 'Count by age',age from Employees 
group by [Age]
having count(*)>1

select Count(*) as 'Count by age',age from Employees 
group by [Age]
having count(*)>1
order by [Age] desc

select Count(*) as 'Count by age',age from Employees 
group by [Age]
having count(*)>1
order by count(*) desc


create table  Teachers(
[Id] int primary key identity(1,1),
[Name] nvarchar (100),
[Surname] nvarchar (100),
[Age] int,
[Email] nvarchar(100) unique,
[Salary] decimal
);


insert into Teachers([Name],[Surname],[Age],[Email],[Salary])
values('Cavid','Bashirov',29,'cavid@gmail.com',3500),
       ('Sebire','Huseynova',45,'sebire@gmail.com',1500),
	   ('Nagi','Aliyev',55,'nagi@gmail.com',500),
	   ('Hesen','Quliyev',31,'hesen@gmail.com',4000),
	   ('Emin','Baghirov',25,'emin@gmail.com',5500)


create view vw_TeachersByAge
as
select * from Teachers where [Age]>30

select * from vw_TeachersByAge


create table Users(
[Id] int primary key identity(1,1),
[FullName] nvarchar (100),
[Age] int,
[Email] nvarchar(100) unique,
[Salary] decimal
);

insert into Users([FullName],[Age],[Email],[Salary])
values('Cavid Bashirov',29,'cavid@gmail.com',3500),
       ('Sebire Huseynova',45,'sebire@gmail.com',1500),
	   ('Nagi Aliyev',55,'nagi@gmail.com',500),
	   ('Hesen Quliyev',31,'hesen@gmail.com',4000),
	   ('Emin Baghirov',25,'emin@gmail.com',5500)


select * from Users


create view vw_UsersBySalary
AS
SELECT TOP 100 PERCENT
count(*) as 'Count',[Salary],[Age]
from Users
group by [Salary],[Age]

select * from vw_UsersBySalary order by [Age]


create function GetTeachersCountbyAge()
returns int
as
begin
declare @age int;
select @age=count(*) from Teachers
return @age
end


select dbo.GetTeachersCountbyAge()


create function GetTeachersCount()
returns int
as
begin
declare @age int;
select @age=count(*) from Teachers
return @age
end

select dbo.GetTeachersCount()


create function GetTeachersCountByAgeStatic()
returns int
as
begin
declare @age int;
declare @mainage int=30;
select @age=count(*) from Teachers where [Age]> @mainage
return @age
end

select dbo.GetTeachersCountByAgeStatic()


create function GetTeachersCountByAgeDinamic(@age int)
returns int
as
begin
declare @count int;
select @count=count(*) from Teachers  where [Age]> @age
return @count
end

select dbo.GetTeachersCountByAgeDinamic(30)


create function getTeachersAverageSalaryByCondition(@id int)
returns float
as
begin
declare @sum float=cast((select sum([Age]) from Teachers where [Id]>@id) as float)
declare @count float=cast((select count([Age]) from Teachers where [Id]>@id) as float)
return @sum/@count
end

select dbo.getTeachersAverageSalaryByCondition(2)


create procedure usp_InsertTeacher
@name nvarchar(100),
@surname nvarchar(100),
@age int,
@email nvarchar(100),
@salary decimal
as
begin
insert into Teachers ([Name],[Surname],[Age],[Email],[Salary])
values(@name,@surname,@age,@email,@salary)
end

exec usp_InsertTeacher 'Novrasta','Aslanzade',25,'novrasta@code.edu.az',1500

select * from Teachers

exec usp_InsertTeacher 'Ramil','Allahvedriyev',26,'ramil@code.edu.az',1500

create procedure usp_SumOfNums
@num1 int,
@num2 int
as
select @num1+@num2

exec usp_SumOfNums 5,7

create table TeachersLog(
[Id] int primary key identity(1,1),
[TeacherId] int,
[Operation] nvarchar(50),
[Date] datetime
);


create trigger InsertTeacher on Teachers
for insert
as
begin
insert TeachersLog([TeacherId],[Operation],[Date])
select Id,'Insert',getdate() from inserted
end


insert into Teachers([Name],[Surname],[Age],[Email],[Salary])
values('Musa','Afandiyev',19,'musa@gmail.com',1500)

create trigger DeleteTeacher on Teachers
for delete
as
begin
insert TeachersLog([TeacherId],[Operation],[Date])
select Id,'Delet',getdate() from deleted
end


delete from Teachers where [Id]=8






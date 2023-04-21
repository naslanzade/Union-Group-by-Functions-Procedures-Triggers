create database Course

use Course

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar (100),
[Surname] nvarchar (100),
[Age] int,
[Email] nvarchar(100) unique,
[Address] nvarchar (100),
);

select * from Students

create table StudentArchives(
[Id] int primary key identity(1,1),
[StudentId] int,
[Operation] nvarchar(50),
[Date] datetime
);

select * from StudentArchives


insert into Students ([Name],[Surname],[Age],[Email],[Address])
values('Novrasta','Aslanzade',25,'novrasta@code.edu.az','Nesimi')


insert into Students ([Name],[Surname],[Age],[Email],[Address])
values('Rasul','Hasanova',15,'rasul@code.edu.az','Xalqlar'), 
       ('Lala','Quliyeva',27,'lala@code.edu.az','Nesimi'),
	   ('Musa','Afandiyev',21,'musa@code.edu.az','Neftchiler'),
	   ('Murad','Jafarov',21,'murad@code.edu.az','Nzs'),
	   ('Gultaj','Jafarova',21,'gultaj@code.edu.az','Yasamal'),
	   ('Nijat','Novruzzade',21,'nijat@code.edu.az','Xezer')


select * from Students


create trigger DeleteStudent on Students
for delete
as
begin
insert StudentArchives([StudentId],[Operation],[Date])
select Id,'Delete',getdate() from deleted
end


create procedure usp_DeleteStudent @id int
as
begin
delete from Students where id=@id
end


exec usp_DeleteStudent @id=1







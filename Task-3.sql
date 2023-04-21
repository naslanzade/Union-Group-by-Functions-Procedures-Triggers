create database Course

use Course

create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(50)
);

create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[CountryId] int foreign key references Countries([Id])
);

create table Students(
[Id] int primary key identity(1,1),
[Fullname] nvarchar(100),
[Email] nvarchar(100),
[Age] int,
[Address] nvarchar(100),
[Phone] nvarchar(100),
[CityId] int foreign key references Cities([Id])
);

create table Teachers(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Surname] nvarchar(100),
[Age] int,
[Email] nvarchar(100),
[Salary] decimal,
[CityId] int foreign key references Cities([Id])
);


create table StaffMembers(
[Id] int primary key identity(1,1),
[Fullname] nvarchar(100),
[Email] nvarchar(100),
[Address] nvarchar(100),
[CityId] int foreign key references Cities([Id])
);

create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
);


create table MemberRoles(
[Id] int primary key identity(1,1),
[StaffMemberId] int foreign key references StaffMembers([Id]),
[RoleId] int foreign key references Roles([Id])
);

create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Capacity] integer
);


create table Educations(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
);


create table Seanses(
[Id] int primary key identity(1,1),
[Name] nvarchar(100)
);


create table WeekDays(
[Id] int primary key identity(1,1),
[Day] nvarchar(100)
);

create table WeekDaysSeanses(
[Id] int primary key identity(1,1),
[WeekDayId] int foreign key references WeekDays([Id]),
[SeanseId] int foreign key references Seanses([Id])
);

create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(100),
[Capacity] int,
[RoomId] int foreign key references Rooms([Id]),
[EducationId] int foreign key references Educations([Id])
);


create table StudentsGroups(
[Id] int primary key identity(1,1),
[GroupId] int foreign key references Groups([Id]),
[StudentId] int foreign key references Students([Id])
);

create table TeacherGroup(
[Id] int primary key identity(1,1),
[TeacherId] int foreign key references Teachers([Id]),
[GroupId] int foreign key references Groups([Id])
);

create table GroupWeekDaySeanses(
[Id] int primary key identity(1,1),
[GroupId] int foreign key references Groups([Id]),
[WeekDaySeansId] int foreign key references WeekDaysSeanses([Id])
);



/******************************************************************************************
	
	Author: Dan Mendoza
	Project: SE370 Healthy Eats App
	Date Created: 28 Sep 2019

*******************************************************************************************/


create table [User] 
(
	UserID int identity(1,1) Primary key,
	FirstName varchar(100),
	LastName varchar(100),
	Birthday date,
	Username varchar(100),
	[Password] varchar(100),
	Active bit default 1
)

create table Access
(
	AccessID int identity(1,1) primary key,
	AccessType varchar(100),
	Active bit default 1
)

create table UserAccess
(
	UserAccessID int identity(1,1) primary key,
	UserID int,
	AccessID int,
	Active bit default 1
)

alter table UserAccess
	add constraint FK_User_UserAccess
		foreign key (UserID)
		references [User] (UserID)
	on update cascade
	on delete cascade

alter table UserAccess
	add constraint FK_Access_UserAccess
		foreign key (AccessID)
		references Access (AccessID)
	on update cascade

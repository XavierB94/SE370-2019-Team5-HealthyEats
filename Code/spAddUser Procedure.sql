
/******************************************************************************************
	
	Author: Dan Mendoza
	Project: SE370 Healthy Eats App
	Description:  This procedure creates new user
	Date Created: 28 Sep 2019

*******************************************************************************************/

create procedure spAddUser
(
	@firstname nvarchar(100),
	@lastname nvarchar(100),
	@username nvarchar(100),
	@birthday date,
	@password nvarchar(100),
	@access nvarchar(100)
) as
begin
	set nocount on;
	
	declare @accessID int
	declare @userID int

	--Gets the access id
	select @accessid  = a.accessid
	from access a
	where a.AccessType = @access

	--Creates new user instance
	insert into [User]
		(firstname, lastname, birthday, username, [password])
		values
			(@firstname, @lastname,@birthday, @username, @password)

	--Retrives the user id of the new user
	set @userID = IDENT_CURRENT('User')

	--Creates instance to UserAccess table
	insert into UserAccess (userid, accessid)
		values (@userID, @accessID)
end 




	


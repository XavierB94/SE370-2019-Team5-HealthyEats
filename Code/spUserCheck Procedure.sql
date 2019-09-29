/******************************************************************************************
	
	Author: Dan Mendoza
	Project: SE370 Healthy Eats App
	Description:  This procedure verifies if the user exist and if the password entered is correct
	Date Created: 28 Sep 2019

*******************************************************************************************/

alter procedure spUserCheck
(
	@username varchar(100),
	@password varchar(100)
) as
begin
	
	declare @currentPassword  varchar(100)

	select @currentPassword = a.[Password]
	from [User] a
	where a.Username = @username

	if @currentPassword is null
	begin
		select -1
	end
	else
	begin
		if @password = @currentPassword
		begin
			select 1
		end
		else
		begin
			select 0
		end
	end

end
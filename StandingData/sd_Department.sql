if OBJECT_ID('sp_Department') is not null
begin
	drop procedure sp_Department
end
go
create procedure sp_Department(
		@DeptID int,
		@DeptName	varchar(60)
)
as begin
	if not exists (select 1 from t_Department where DeptID=@DeptID )
	begin
		insert into t_Department (
			DeptID,
			DeptName
		)
		values
		(
			@DeptID,
			@DeptName
		)
		if @@ERROR <> 0 
		begin
			print 'Error inserting'
			return -1
		end
	end
	else
	begin
		update t_Department
		set DeptName= @DeptName
		where DeptID = @DeptID 
		
		if @@ERROR <> 0 
		begin
			print 'Error updating'
			return -1
		end
	end
end
go

declare @status integer
declare @failure integer

if OBJECT_ID('sp_Department') is not null
begin
	exec @status = sp_Department 1001,'IT'
	if @status= -1 select @failure= 1
end


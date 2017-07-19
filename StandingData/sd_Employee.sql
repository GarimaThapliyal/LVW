if OBJECT_ID('sp_Employee') is not null
begin
	drop procedure sp_Employee
end
go
create procedure sp_Employee(
		@EmpID int,
		@EmpName	varchar(60),
		@Location varchar(60),
		@DeptID int
)
as begin
	if not exists (select 1 from t_Employee where EmpID=@EmpID )
	begin
		insert into t_Employee (
			EmpID,
			EmpName,
			Location,
			DeptID
		)
		values
		(
			@EmpID,
			@EmpName,
			@Location,
			@DeptID
		)
		if @@ERROR <> 0 
		begin
			print 'Error inserting'
			return -1
		end
	end
	else
	begin
		update t_Employee
		set EmpName= @EmpName ,
			Location = @Location ,
			DeptID = @DeptID 
		where EmpId = @EmpID 
		
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

if OBJECT_ID('sp_Employee') is not null
begin
	exec @status = sp_Employee 1,'Garima','Mumbai',1
	if @status= -1 select @failure= 1
end


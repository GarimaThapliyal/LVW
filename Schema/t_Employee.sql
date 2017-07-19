If exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME='t_Employee')
begin
	print 'Table already exists'
end
else
begin
	create table dbo.t_Employee
	(
		EmpID int,
		EmpName	varchar(60),
		Location varchar(60),
		DeptID int
	)
print 'Created table t_Employee'
end
go

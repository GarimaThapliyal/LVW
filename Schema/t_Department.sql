If exists (select 1 from INFORMATION_SCHEMA.TABLES where TABLE_NAME='t_Department')
begin
	print 'Table t_Department already exists'
end
else
begin
	create table dbo.t_Department
	(
		DeptID int,
		DeptName	varchar(60)
	)
	print 'Created table t_Department'
end
go

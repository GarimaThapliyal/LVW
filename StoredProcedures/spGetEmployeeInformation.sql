If OBJECT_ID('dbo.spGetEmployeeInformation') is not null
begin
	drop procedure dbo.spGetEmployeeInformation
	If OBJECT_ID('dbo.spGetEmployeeInformation') is not null
		Print 'Failed dropping procedure'
	else
		Print 'Procedure dropped'
end
go

create procedure dbo.spGetEmployeeInformation
as begin
	Select EmpID,EmpName,Location,DeptName
	from t_Employee emp inner join t_Department dept
	on emp.DeptID = dept.DeptID
end
If OBJECT_ID('dbo.spGetEmployeeInformation') is not null
	Print 'created procedure'
else
	Print 'Failed creating procedure'
go

USE olympic_games;
go
select
	ID,
	Name,
	Medal,
	case when Sex='M' then 'Male' else 'Female' End as Sex,
	case when Age<18 then 'under 18'
		when Age between 18 and 25 then '18-25'
		when Age between 25 and 30 then '25-30'
		when Age>30 then 'Over 30'
	end as [Age group],
	Height,
	Weight,
	NOC as [Nation code],
	LEFT(Games, PATINDEX('% %', Games)-1) as [Year], --usign paternindex to return the occurence of space to the left function
	RIGHT(Games, PATINDEX('% %', reverse(Games))-1) as [Season], --usign paternindex to return the occurence of space in reverse order of the column to the right function
	Sport,
	Event
from athletes_event_results
where RIGHT(Games, PATINDEX('% %', reverse(Games))-1) = 'Summer';
	
	

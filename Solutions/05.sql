SELECT
	*
FROM (
	SELECT
		*
		,DENSE_RANK() OVER (PARTITION BY [State] ORDER BY [Registration Date]) AS RegDateRank
	FROM [dbo].[ConventionAttendees]
) con
WHERE
	RegDateRank < 4

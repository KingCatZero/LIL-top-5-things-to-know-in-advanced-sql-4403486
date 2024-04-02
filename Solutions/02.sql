WITH
	cteAvgStock (
		x
	) AS (
		SELECT AVG([In Stock]) FROM [dbo].[Inventory]
	)
SELECT
	ProdCategory
	,ProdNumber
	,ProdName
	,[In Stock]
FROM [dbo].[Inventory]
WHERE
	[In Stock] < (SELECT x FROM cteAvgStock)

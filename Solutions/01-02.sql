SELECT
	ProdCategory
	,ProdNumber
	,ProdName
	,[In Stock]
FROM [dbo].[Inventory]
WHERE
	[In Stock] < (
		SELECT AVG([In Stock]) FROM [dbo].[Inventory]
	)

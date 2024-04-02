SELECT
	OrderNum
	,OrderDate
	,CustName
	,ProdCategory
	,ProdName
	,[Order Total]
FROM (
	SELECT
		*
		,ROW_NUMBER() OVER (PARTITION BY ProdCategory ORDER BY [Order Total] DESC) AS RowNumber
	FROM [dbo].[OnlineRetailSales]
	WHERE
		CustName = 'Boehm Inc.'
) AS sales
WHERE
	RowNumber < 4

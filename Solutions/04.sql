WITH
	cteDailyQuantity AS (
		SELECT
			OrderDate
			,SUM(Quantity) AS Quantity
		FROM [dbo].[OnlineRetailSales]
		WHERE
			ProdCategory = 'Drones'
		GROUP BY
			OrderDate
	)
SELECT
	*
	,LAG(Quantity, 1, 0) OVER (ORDER BY OrderDate) AS [Quantity D-1]
	,LAG(Quantity, 2, 0) OVER (ORDER BY OrderDate) AS [Quantity D-2]
	,LAG(Quantity, 3, 0) OVER (ORDER BY OrderDate) AS [Quantity D-3]
	,LAG(Quantity, 4, 0) OVER (ORDER BY OrderDate) AS [Quantity D-4]
	,LAG(Quantity, 5, 0) OVER (ORDER BY OrderDate) AS [Quantity D-5]
FROM cteDailyQuantity

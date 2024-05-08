WITH address_info AS (
	SELECT address, 
		round(max(age) - (min(age) / max(age::numeric)), 2) formula, 
		round(avg(age), 2) average
	FROM person
	GROUP BY 1
)
SELECT address, formula, average, formula > average comparison 
FROM address_info
ORDER BY 1;
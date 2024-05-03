INSERT INTO person_discounts
SELECT ROW_NUMBER( ) OVER ( ) AS id, po.person_id, menu.pizzeria_id,
CASE
	WHEN COUNT(*) = 1 THEN 10.5
    WHEN COUNT(*) = 2 THEN 22
    ELSE 30
END discount
FROM person_order po 
JOIN menu ON menu.id = po.menu_id
GROUP BY 2, 3
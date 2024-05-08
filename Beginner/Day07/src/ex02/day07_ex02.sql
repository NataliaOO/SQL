WITH top_person_order AS (
	SELECT pizzeria.name, count(*), 'order' action_type
	FROM person_order po
	JOIN menu on menu.id = po.menu_id
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 3
),
top_person_visits AS (
	SELECT pizzeria.name, count(*), 'visit' action_type
	FROM person_visits pv
	JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
	GROUP BY 1
	ORDER BY 2 DESC
	LIMIT 3
)
SELECT * FROM top_person_order
UNION
SELECT * FROM top_person_visits
ORDER BY 3, 2 DESC;
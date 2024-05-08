SELECT name, COUNT(*) AS total_count
FROM (
    SELECT pizzeria.name
    FROM person_order po
    JOIN menu ON menu.id = po.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    UNION ALL
    SELECT pizzeria.name
    FROM person_visits pv
    JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
) AS combined_data
GROUP BY name
ORDER BY 2 DESC, 1;

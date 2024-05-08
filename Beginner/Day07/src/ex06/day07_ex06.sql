SELECT pizzeria.name, count(*) count_of_orders, 
		round(AVG(menu.price), 2) average_price, 
		max(menu.price) max_price, min(menu.price) min_price
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY 1
ORDER BY 1;
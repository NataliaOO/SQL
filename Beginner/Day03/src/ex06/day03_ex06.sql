SELECT m1.pizza_name, p2.name pizzeria_name_1, p1.name pizzeria_name_2, m1.price
FROM menu m1
JOIN pizzeria p1 ON m1.pizzeria_id = p1.id
JOIN menu m2 ON m1.pizza_name = m2.pizza_name AND m1.price = m2.price AND m1.pizzeria_id < m2.pizzeria_id
JOIN pizzeria p2 ON m2.pizzeria_id = p2.id
ORDER BY 1;
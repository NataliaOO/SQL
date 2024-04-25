SELECT menu.pizza_name, name pizzeria_name, menu.price FROM menu 
JOIN pizzeria on pizzeria.id = menu.pizzeria_id
WHERE menu.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1, 2
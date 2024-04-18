SELECT person.name person_name, menu.pizza_name, pizzeria.name pizzeria_name FROM person_order 
JOIN person ON person.id = person_order.person_id
join menu on menu.id = person_order.menu_id
JOIN pizzeria on pizzeria.id = menu.pizzeria_id
ORDER BY person_name, pizza_name, pizzeria_name;
with menu_person as (
  SELECT * FROM person_order 
  join person on person.id = person_order.person_id
  WHERE name in ('Anna','Denis')
)
SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN menu_person mp ON menu.id = mp.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2;
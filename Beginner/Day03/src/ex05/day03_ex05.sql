WITH order_pizzaria as (
  SELECT DISTINCT pizzeria.name FROM person 
  JOIN person_order ON person.id = person_order.person_id
  JOIN menu ON menu.id = person_order.menu_id
  JOIN pizzeria on pizzeria.id = menu.pizzeria_id
  where person.name LIKE 'Andrey'
),
visit_pizzeria as (
  SELECT DISTINCT pizzeria.name FROM person_visits
  JOIN person ON person.id = person_visits.person_id
  JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
  where person.name LIKE 'Andrey'
)
SELECT name pizzeria_name FROM visit_pizzeria
EXCEPT
SELECT * FROM order_pizzaria
WITH price_menu as (
  SELECT pizzeria_id, name, pizza_name, price FROM menu
  JOIN pizzeria on pizzeria.id = menu.pizzeria_id
  WHERE price BETWEEN 800 AND 1000
)
SELECT pizza_name, price, price_menu.name pizzeria_name, visit_date FROM person_visits 
join person on person_visits.person_id = person.id
JOIN price_menu on price_menu.pizzeria_id = person_visits.pizzeria_id
where person.name LIKE 'Kate'
ORDER BY 1, 2, 3
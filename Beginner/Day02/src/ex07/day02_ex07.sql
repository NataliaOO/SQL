with visits as ( 
  SELECT pizzeria_id, pizzeria.name FROM person_visits
  JOIN person ON person.id = person_visits.person_id
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
  where visit_date = '2022-01-08' AND person.name LIKE 'Dmitriy'
)
SELECT DISTINCT name pizzeria_name from visits
JOIN menu ON menu.pizzeria_id = visits.pizzeria_id
where price < 800
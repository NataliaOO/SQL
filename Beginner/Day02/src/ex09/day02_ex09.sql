with pizza_pepperoni_cheese as (
  SELECT * FROM menu where pizza_name in ('pepperoni pizza', 'cheese pizza')
),
person_female as (
  SELECT * FROM person where gender LIKE 'female' 
)
SELECT name FROM person_order
join pizza_pepperoni_cheese p ON p.id = person_order.menu_id
JOIN person_female ON person_female.id = person_order.person_id
GROUP by name
HAVING COUNT(p.id) = 2
ORDER by 1
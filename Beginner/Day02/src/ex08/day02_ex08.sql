with pizza_pepperoni_mushroom as (
  SELECT * FROM menu where pizza_name in ('pepperoni pizza', 'mushroom pizza')
),
person_male as (
  SELECT * FROM person where gender LIKE 'male' AND address in ('Moscow', 'Samara')
)
SELECT name FROM person_order
join pizza_pepperoni_mushroom p ON p.id = person_order.menu_id
JOIN person_male ON person_male.id = person_order.person_id
ORDER by name DESC
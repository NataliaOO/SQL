WITH pizza_no_ordered as (
  SELECT * from person_order
  RIGHT JOIN menu ON person_order.menu_id = menu.id
  where menu_id IS NULL
)
SELECT pizza_name, price, name pizzeria_name  from pizza_no_ordered
JOIN pizzeria ON pizzeria.id = pizza_no_ordered.pizzeria_id
ORDER BY 1, 2

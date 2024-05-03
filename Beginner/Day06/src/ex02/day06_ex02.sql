    SELECT
        person.name,
        menu.pizza_name,
        menu.price,
  		ROUND(price * (100 - discount) / 100) AS discount_price,
        pizzeria.name AS pizzeria_name
    FROM person_order po
    JOIN person ON person.id = po.person_id
    JOIN menu ON menu.id = po.menu_id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_discounts pd ON pd.person_id = po.person_id AND pd.pizzeria_id = menu.pizzeria_id
  	ORDER BY 1, 2;

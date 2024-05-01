CREATE VIEW v_price_with_discount
as
SELECT person.name, menu.pizza_name, menu.price, ROUND(menu.price * 0.9) discount_price FROM person_order 
join person on person.id = person_order.person_id
join menu ON menu.id = person_order.menu_id
order by 1, 2;
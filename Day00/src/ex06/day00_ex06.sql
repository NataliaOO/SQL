SELECT person.name as name,
   case
	WHEN person.name = 'Denis' THEN 'True'
   ELSE 'False'
   END check_name
from person_order
JOIN person ON person.id = person_order.person_id
where ( menu_id BETWEEN 13 and 14 or menu_id = 18 ) and order_date = '2022-01-07';
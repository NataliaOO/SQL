SELECT (SELECT name from person WHERE id = person_order.person_id) as name 
from person_order where (menu_id between 13 and 14 or menu_id = 18) and order_date = '2022-01-07';
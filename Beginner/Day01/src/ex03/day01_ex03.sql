SELECT order_date action_date, person_id from person_order
INTERSECT
SELECT visit_date, person_id from person_visits ORDER BY action_date, person_id DESC;
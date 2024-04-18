SELECT order_date action_date, name person_name from person_order JOIN person ON person_order.person_id = person.id
INTERSECT
SELECT visit_date, name from person_visits JOIN person ON person_visits.person_id = person.id
ORDER BY action_date, person_name DESC;
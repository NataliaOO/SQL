SELECT (SELECT name FROM person where id = person_id) AS person_name, (SELECT name FROM pizzeria where id = pizzeria_id) AS pizzeria_name
from (select * from person_visits where  visit_date BETWEEN '2022-01-07' and '2022-01-09') AS pv
order by person_name, pizzeria_name DESC;
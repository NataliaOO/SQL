SELECT person.name, count(*) count_of_visits
FROM person_visits
JOIN person ON person.id = person_visits.person_id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY person.name
HAVING count(*) > 3;
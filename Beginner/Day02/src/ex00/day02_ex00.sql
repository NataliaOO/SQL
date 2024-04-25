SELECT name, rating FROM pizzeria
left JOIN person_visits on person_visits.pizzeria_id = pizzeria.id
where pizzeria_id is NULL
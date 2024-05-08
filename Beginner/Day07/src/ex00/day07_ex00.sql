SELECT person_id, count(*) count_of_visits FROM person_visits
JOIN person ON person.id = person_visits.person_id
GROUP BY person_id
ORDER BY 2 DESC, 1;
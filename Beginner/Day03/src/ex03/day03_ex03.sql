WITH v_count as (
  SELECT pizzeria.name pizzeria_name,
  COUNT ( CASE WHEN person.gender = 'male' THEN 1 END) male_visits,
  COUNT ( CASE WHEN person.gender = 'female' THEN 1 END) female_visits
  FROM person_visits 
  JOIN person ON person_visits.person_id = person.id
  JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
  GROUP BY pizzeria_name
)
SELECT pizzeria_name from v_count
where male_visits > female_visits or female_visits > male_visits
ORDER BY pizzeria_name

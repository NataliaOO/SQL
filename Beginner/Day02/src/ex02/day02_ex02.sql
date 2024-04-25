SELECT COALESCE(p.name, '-') AS person_name, pv.visit_date ,COALESCE(pr.name , '-') AS pizzeria_name
FROM (
  SELECT DISTINCT *
  FROM person_visits
  WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
) AS pv
FULL JOIN person p ON pv.person_id = p.id
FULL JOIN pizzeria pr ON pv.pizzeria_id = pr.id
ORDER BY 1, 2, 3;

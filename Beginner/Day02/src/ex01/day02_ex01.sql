SELECT missing_date::date
FROM (
  SELECT generate_series(TIMESTAMP '2022-01-01', '2022-01-10', '1 day') AS missing_date
) AS dates
LEFT JOIN (
  SELECT DISTINCT visit_date
  FROM person_visits
  WHERE person_id BETWEEN 1 AND 2
) AS v
ON dates.missing_date = v.visit_date
WHERE v.visit_date IS NULL
ORDER BY 1;
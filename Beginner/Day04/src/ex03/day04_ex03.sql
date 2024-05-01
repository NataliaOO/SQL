SELECT generated_date FROM person_visits 
RIGHT JOIN v_generated_dates ON visit_date = generated_date
WHERE visit_date IS NULL
ORDER BY 1;
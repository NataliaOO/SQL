CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar DEFAULT 'Dmitriy',
    IN pprice integer DEFAULT 500,
    IN pdate date DEFAULT '2022-01-08'
)
RETURNS TABLE (
    pizzeria_name varchar
)
AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pizzeria.name AS pizzeria_name
    FROM person_visits
    JOIN person ON person.id = person_visits.person_id
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    WHERE person.name = pperson
      AND menu.price < pprice
      AND person_visits.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');




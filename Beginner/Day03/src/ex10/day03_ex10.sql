INSERT INTO person_order
VALUES ((SELECT COALESCE(MAX(id), 0) + 1 FROM person_order), 
       (SELECT p.id FROM person p WHERE p.name = 'Denis'),
       (SELECT id FROM menu WHERE pizza_name = 'Sicilian pizza'),
       TIMESTAMP '2022-02-24'
),
((SELECT COALESCE(MAX(id), 0) + 2 FROM person_order), 
       (SELECT p.id FROM person p WHERE p.name = 'Irina'),
       (SELECT id FROM menu WHERE pizza_name = 'Sicilian pizza'),
       TIMESTAMP '2022-02-24'
 );

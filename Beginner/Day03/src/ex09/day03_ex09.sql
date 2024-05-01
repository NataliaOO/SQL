INSERT INTO person_visits
VALUES ((SELECT COALESCE(MAX(id), 0) + 1 FROM person_visits), 
       (SELECT p.id FROM person p WHERE p.name = 'Denis'),
       (SELECT id FROM pizzeria WHERE name LIKE 'Dominos'),
       TIMESTAMP '2022-02-24'
),
((SELECT COALESCE(MAX(id), 0) + 2 FROM person_visits), 
       (SELECT p.id FROM person p WHERE p.name = 'Irina'),
       (SELECT id FROM pizzeria WHERE name LIKE 'Dominos'),
       TIMESTAMP '2022-02-24'
 );

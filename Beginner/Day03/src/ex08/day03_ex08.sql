INSERT INTO menu 
VALUES ((SELECT COALESCE(MAX(id), 0) FROM menu) + 1, 
        (SELECT id FROM pizzeria where name LIKE 'Dominos'),
        'Sicilian pizza', 900);
SELECT * FROM menu where pizza_name LIKE 'Sicilian pizza';

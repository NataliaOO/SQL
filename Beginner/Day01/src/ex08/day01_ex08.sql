SELECT order_date, p.name || '(age:' || p.age || ')' person_information 
FROM person_order natural join (select id as person_id, name, age from person) p
ORDER BY order_date, person_information;
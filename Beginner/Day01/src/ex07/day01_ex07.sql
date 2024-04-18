SELECT order_date, person.name || '(age:' || person.age || ')' person_information 
FROM person_order join person ON person.id = person_order.person_id
ORDER BY order_date, person_information;
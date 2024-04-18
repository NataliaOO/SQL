SELECT id object_id, pizza_name object_name from menu
UNION
SELECT id, name FROM person ORDER BY object_id, object_name;
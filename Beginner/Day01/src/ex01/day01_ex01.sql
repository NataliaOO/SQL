( SELECT name object_name FROM person ORDER BY name )
UNION all
( SELECT pizza_name  from menu ORDER BY pizza_name );
SELECT id from menu
WHERE id NOT IN (
  SELECT DISTINCT menu_id from person_order
) order BY id
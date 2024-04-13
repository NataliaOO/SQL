SELECT id,name, 
   CASE
	WHEN age BETWEEN 10 and 20 THEN 'interval #1'
   WHEN age > 20 and age < 24 THEN 'interval #2'
ELSE 'interval #3'
END as interval_info
from person ORDER BY interval_info;
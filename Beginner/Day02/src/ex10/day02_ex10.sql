SELECT DISTINCT f.name person_name1, s.name person_name2, f.address common_address FROM person f
JOIN person s ON f.address = s.address and f.id > s.id
ORDER BY 1, 2
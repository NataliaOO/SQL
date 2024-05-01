CREATE VIEW v_symmetric_union
as
WITH R as (
	SELECT * FROM person_visits where visit_date <= '2022-01-02'
),
S as (
	SELECT * FROM person_visits where visit_date <= '2022-01-06'
),
S_R AS (
	SELECT * FROM S
	EXCEPT
	SELECT * FROM R
),
R_S AS (
  	SELECT * FROM R
	EXCEPT
	SELECT * FROM S
)
SELECT person_id FROM R_S
UNION
SELECT person_id FROM S_R
ORDER BY 1;
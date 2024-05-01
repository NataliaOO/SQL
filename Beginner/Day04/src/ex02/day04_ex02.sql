CREATE VIEW v_generated_dates
as
SELECT day::date generated_date 
FROM generate_series(TIMESTAMP '2022-01-01', '2022-01-31', '1 day') day
ORDER BY 1
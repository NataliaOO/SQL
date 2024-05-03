CREATE UNIQUE INDEX idx_person_order_order_date  on person_order (person_id, menu_id)
where order_date = '2022-01-01';

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, menu_id
FROM person_order
WHERE order_date = '2022-01-01';
CREATE UNIQUE INDEX idx_person_discounts_unique on person_discounts(person_id, pizzeria_id);

set ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
SELECT * FROM person_discounts
WHERE person_id = 3 AND pizzeria_id = 5;
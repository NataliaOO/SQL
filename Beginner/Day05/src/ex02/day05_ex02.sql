CREATE INDEX idx_person_name on person (UPPER(NAME));

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT * FROM person WHERE UPPER(NAME) = 'DIMITRY';
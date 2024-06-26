ALTER TABLE person_discounts 
	ADD CONSTRAINT ch_nn_person_id CHECK (person_id is NOT NULL),
	add CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id is not NULL),
	add CONSTRAINT ch_nn_discount CHECK (discount is not NULL),
	ALTER COLUMN discount SET DEFAULT 0,
	add CONSTRAINT ch_range_discount CHECK (discount BETWEEN 0 and 100);
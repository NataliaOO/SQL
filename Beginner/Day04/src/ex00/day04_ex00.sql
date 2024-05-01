create VIEW v_persons_female
as
SELECT * FROM person WHERE gender LIKE 'female';
create VIEW v_persons_male
as
SELECT * FROM person WHERE gender LIKE 'male';
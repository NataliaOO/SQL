 -- Session 1
begin transaction isolation level serializable;

 -- Session 2
begin transaction isolation level serializable;

 -- Session 1
update pizzeria set rating = 1 where id = 1;

 -- Session 2
update pizzeria set rating = 1 where id = 2;

 -- Session 1
update pizzeria set rating = 1 where id = 2;

 -- Session 2
update pizzeria set rating = 1 where id = 1;

 -- Session 1
commit;

 -- Session 2
commit;
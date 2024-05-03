COMMENT on TABLE person_discounts IS 'Информация о скидках для лиц в пиццериях.';
COMMENT ON COLUMN person_discounts.id IS 'Индификатор ID записи';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор лица, получающего скидку.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, где действует скидка.';
COMMENT ON COLUMN person_discounts.discount IS 'Процент скидки для указанной пиццерии.';
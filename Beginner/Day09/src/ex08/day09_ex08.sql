CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
    RETURNS TABLE(fib bigint)
AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE fib_series AS (
        SELECT 0::bigint AS n1, 1::bigint AS n2
        UNION ALL
        SELECT n2 AS n1, n1 + n2 AS n2
        FROM fib_series
        WHERE n2 < pstop
    )
    SELECT n1 FROM fib_series;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
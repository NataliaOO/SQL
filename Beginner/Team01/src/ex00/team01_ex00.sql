WITH user_balance AS (
    SELECT COALESCE(u.name, 'not defined') AS name,
           COALESCE(u.lastname, 'not defined') AS lastname,
           b.type AS type,
           SUM(b.money) AS volume,
           b.currency_id
    FROM "user" u
    FULL JOIN balance b ON u.id = b.user_id
    GROUP BY u.id, u.name, u.lastname, b.type, b.currency_id
),
currency_info AS (
    SELECT id, name AS currency_name, rate_to_usd
    FROM currency
    WHERE (id, updated) IN (
        SELECT id, MAX(updated)
        FROM currency
        GROUP BY id
    )
),
total_volume AS (
    SELECT ub.name,
           ub.lastname,
           ub.type,
           ub.volume,
           COALESCE( ci.currency_name, 'not defined') currency_name,
           COALESCE(ci.rate_to_usd, 1) AS last_rate_to_usd,
           COALESCE(ub.volume * ci.rate_to_usd, ub.volume) AS total_volume_in_usd
    FROM user_balance ub
    LEFT JOIN currency_info ci ON ub.currency_id = ci.id
)
SELECT name, lastname, type, volume, currency_name, last_rate_to_usd, total_volume_in_usd
FROM total_volume
ORDER BY 1 DESC, 2, 3;
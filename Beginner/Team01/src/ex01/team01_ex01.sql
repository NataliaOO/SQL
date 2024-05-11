INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH transactions AS (
    SELECT b.user_id, c.name AS currency_name, money,
        COALESCE(
            (
                SELECT rate_to_usd FROM currency c
                WHERE b.currency_id = c.id AND c.updated < b.updated
                ORDER BY c.updated DESC LIMIT 1
            ),
            (
                SELECT rate_to_usd FROM currency c
                WHERE b.currency_id = c.id AND c.updated > b.updated
                ORDER BY c.updated ASC LIMIT 1
            )
        ) AS rate_to_usd
    FROM balance b
    INNER JOIN (
        SELECT c.id, c.name FROM currency c
        GROUP BY c.id, c.name
    ) AS c ON c.id = b.currency_id
)

SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    currency_name,
    money * rate_to_usd AS currency_in_usd
FROM transactions
LEFT JOIN "user" u ON u.id = transactions.user_id
ORDER BY 1 DESC, 2, 3;
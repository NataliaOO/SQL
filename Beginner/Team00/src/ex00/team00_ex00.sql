CREATE TABLE node (
  id SERIAL PRIMARY KEY,
  point1 VARCHAR(1) NOT NULL,
  point2 VARCHAR(1) NOT NULL,
  cost INTEGER NOT NULL
);

INSERT INTO node (point1, point2, cost) 
VALUES 
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('d', 'c', 30),
    ('c', 'd', 30);

CREATE OR REPLACE VIEW total_cost_tour AS (
    WITH RECURSIVE tours (id, point1, point2, result_cost, level, path) AS (
        SELECT id, point1, point2, 0, 0, cast('{a,' as text) 
        FROM node
        WHERE point1 = 'a'
        UNION
        SELECT n.id, n.point1, n.point2, t.result_cost + n.cost as result_cost, level + 1, t.path || n.point1 || ','
        FROM node n
        JOIN tours t ON t.point1 = n.point2
        WHERE n.point1 != 'a' AND t.path not LIKE ('%' || n.point1 || '%')
    )
    SELECT (MIN(result_cost) + (
            SELECT cost 
            FROM node 
            WHERE point1 = (SELECT SUBSTRING(path, LENGTH(path) - 1, 1)) 
            AND point2 = 'a'
        )) AS total_cost,
        (path || 'a}') AS tour 
    FROM tours
    WHERE level = 3
    GROUP BY path
    ORDER BY 1, 2
);

SELECT * 
FROM total_cost_tour 
WHERE total_cost = (SELECT MIN(total_cost) FROM total_cost_tour)
ORDER BY 1, 2;
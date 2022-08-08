SELECT 
    MIN(plan_price) AS faturamento_minimo,
    MAX(plan_price) AS faturamento_maximo,
    ROUND(AVG(plan_price), 2) AS faturamento_medio,
    SUM(plan_price) AS faturamento_total
FROM
    SpotifyClone.users AS U
        INNER JOIN
    SpotifyClone.plans AS P ON U.user_plan = P.plan_id;
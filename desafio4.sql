SELECT 
    U.user_name AS usuario,
    IF(MAX(YEAR(H.history_date)) >= 2021,
        'Usuário ativo',
        'Usuário inativo') AS condicao_usuario
FROM
    SpotifyClone.history AS H
        INNER JOIN
    SpotifyClone.users AS U ON H.user_id = U.user_id
GROUP BY U.user_name;
SELECT 
    COUNT(history_date) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.history AS H
        INNER JOIN
    SpotifyClone.users AS U ON H.user_id = U.user_id
WHERE
    U.user_name = 'Bill';
SELECT 
    S.song_name AS nome, COUNT(H.user_id) AS reproducoes
FROM
    SpotifyClone.history AS H
        INNER JOIN
    SpotifyClone.songs AS S ON H.song_id = S.song_id
        INNER JOIN
    SpotifyClone.users AS U ON H.user_id = U.user_id
WHERE
    U.user_plan = 1 OR U.user_plan = 4
GROUP BY nome
ORDER BY reproducoes DESC , nome;
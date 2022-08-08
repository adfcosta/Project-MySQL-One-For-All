SELECT DISTINCT
    U.user_name AS usuario,
    COUNT(H.song_id) AS qtde_musicas_ouvidas,
    ROUND(SUM(S.song_length) / 60, 2) AS total_minutos
FROM
    SpotifyClone.history AS H
        INNER JOIN
    SpotifyClone.users AS U ON H.user_id = U.user_id
        INNER JOIN
    SpotifyClone.songs AS S ON H.song_id = S.song_id
GROUP BY user_name;
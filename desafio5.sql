SELECT 
    S.song_name AS cancao, COUNT(H.song_id) AS reproducoes
FROM
    SpotifyClone.history AS H
        INNER JOIN
    SpotifyClone.songs AS S ON H.song_id = S.song_id
GROUP BY cancao
ORDER BY reproducoes DESC , cancao
LIMIT 2;
SELECT 
    AR.artist_name AS artista,
    AL.album_name AS album,
    COUNT(FO.artist_id) AS seguidores
FROM
    SpotifyClone.albuns AS AL
        INNER JOIN
    SpotifyClone.artists AR ON AL.artist_id = AR.artist_id
        INNER JOIN
    SpotifyClone.followers AS FO ON AL.artist_id = FO.artist_id
GROUP BY artista , album_id
ORDER BY seguidores DESC , artista , album;
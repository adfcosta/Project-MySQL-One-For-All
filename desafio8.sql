SELECT 
    AR.artist_name AS artista, AL.album_name AS album
FROM
    SpotifyClone.albuns AS AL
        INNER JOIN
    SpotifyClone.artists AR ON AL.artist_id = AR.artist_id
WHERE
    AR.artist_name = 'Walter Phoenix'
GROUP BY artista , album;
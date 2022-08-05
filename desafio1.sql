DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

-- -----------------------------------------------------
-- Table `artists`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS SpotifyClone.artists (
    artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `albuns`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS SpotifyClone.albuns (
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    album_year INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `songs`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS SpotifyClone.songs (
    song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    song_name VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    song_length INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `plans`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS SpotifyClone.plans (
    plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plan_category VARCHAR(255) NOT NULL,
    plan_price DECIMAL(3 , 2 ) NOT NULL
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS SpotifyClone.users (
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    user_age INT NOT NULL,
    user_plan INT NOT NULL,
    plan_date DATE NOT NULL,
    FOREIGN KEY (user_plan)
        REFERENCES plans (plan_id)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `history`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS SpotifyClone.history (
    song_id INT NOT NULL,
    user_id INT NOT NULL,
    history_date DATETIME NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (song_id)
        REFERENCES songs (song_id),
    CONSTRAINT PRIMARY KEY (song_id , user_id)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `followers`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS SpotifyClone.followers (
    artist_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    CONSTRAINT PRIMARY KEY (artist_id , user_id)
)  ENGINE=INNODB;

-- ------------------------------------------------
-- INSERTING DATA
-- -------------------------------------------------

#
# Dumping data for table 'artists'
#

INSERT INTO SpotifyClone.artists (artist_name) VALUES
("Walter Phoenix"),
("Peter Strong"),
("Lance Day"),
("Freedie Shannon"),
("Tyler Isle"),
("Fog");

#
# Dumping data for table 'albuns'
#

INSERT INTO SpotifyClone.albuns(album_name, artist_id, album_year) VALUES
("Envious",	1,	1990),
("Exuberant",	1,	1993),
("Hallowed Steam",	2,	1995),
("Incandescent",	3,	1998),
("Temporary Culture",	4,	2001),
("Library of liberty",	4,	2003),
("Chained Down",	5,	2007),
("Cabinet of fools",	5,	2012),
("No guarantees",	5,	2015),
("Apparatus",	6,	2015);

#
# Dumping data for table 'songs'
#

INSERT INTO SpotifyClone.songs(song_name, artist_id, album_id, song_length) VALUES
("Soul For Us",	1,	1,	200),
("Reflections Of Magic",	1,	1,	163),
("Dance With Her Own",	1,	1,	116),
("Troubles Of My Inner Fire",	1,	2,	203),
("Time Fireworks",	1,	2,	152),
("Magic Circus",	2,	3,	105),
("Honey, So Do I",	2,	3,	207),
("Sweetie, Let's Go Wild",	2,	3,	139),
("She Knows",	2,	3,	244),
("Fantasy For Me",	3,	4,	100),
("Celebration Of More",	3,	4,	146),
("Rock His Everything",	3,	4,	223),
("Home Forever",	3,	4,	231),
("Diamond Power",	3,	4,	241),
("Let's Be Silly",	3,	4,	132),
("Thang Of Thunder",	4,	5,	240),
("Words Of Her Life",	4,	5,	185),
("Without My Streets",	4,	5,	176),
("Need Of The Evening",	4,	6,	190),
("History Of My Roses",	4,	6,	222),
("Without My Love",	4,	6,	111),
("Walking and Game",	4,	6,	123),
("Young and Father",	4,	6,	197),
("Finding My Traditions",	5,	7,	179),
("Walking and Man",	5,	7,	229),
("Hard And Time",	5,	7,	135),
("Honey, I'm A Lone Wolf",	5,	7,	150),
("She Thinks I Won't Stay Tonight",	5,	8,	166),
("He Heard You're Bad For Me",	5,	8,	154),
("He Hopes We Can't Stay",	5,	8,	210),
("I Know I Know",	5,	8,	117),
("He's Walking Away",	5,	9,	159),
("He's Trouble",	5,	9,	138),
("I Heard I Want To Be Alone",	5,	9,	120),
("I Ride Alone",	5,	9,	151),
("Honey",	6,	10,	79),
("You Cheated On Me",	6,	10,	95),
("Wouldn't It Be Nice",	6,	10,	213),
("Baby",	6,	10,	136),
("You Make Me Feel So..",	6,	10,	83);

#
# Dumping data for table 'plans'
#

INSERT INTO SpotifyClone.plans (plan_category, plan_price) VALUES
("gratuito",	0),
("familiar",	7.99),
("universitário",	5.99),
("pessoal",	6.99);

#
# Dumping data for table 'users'
#

INSERT INTO SpotifyClone.users (user_name, user_age, user_plan, plan_date) VALUES
("Thati", 23, 1, "2029-10-20"),
("Cintia", 35, 2, "2017-12-30"),
("Bill", 20, 3, "2019-06-05"),
("Roger", 45, 4, "2020-05-13"),
("Normam", 58, 4, "2017-02-17"),
("Patrick", 33, 2, "2017-01-06"),
("Vivian", 26, 3, "2018-01-05"),
("Carol", 19, 3, "2018-02-14"),
("Angelina", 42, 2, "2018-04-29"),
("Paul", 46, 2, "2017-01-17");

#
# Dumping data for table 'history'
#

INSERT INTO SpotifyClone.history(song_id, user_id, history_date) VALUES
(1, 5,	"2020-11-10 13:52:27"),
(2, 4,	"2021-08-15 17:10:10"),
(3, 3,	"2020-12-05 18:38:30"),
(4, 7,	"2020-07-27 12:52:58"),
(5, 7,	"2018-05-09 22:30:49"),
(6, 3,	"2020-11-13 16:55:13"),
(7, 5,	"2020-07-03 19:33:28"),
(8, 9,	"2021-03-14 06:14:26"),
(9, 9,	"2020-04-01 03:36:00"),
(11, 7,	"2018-01-16 18:40:43"),
(12, 5,	"2017-02-24 21:14:22"),
(12, 10,	"2017-07-27 05:24:49"),
(13, 10,	"2017-12-25 01:03:57"),
(14, 1,	"2020-08-05 08:05:17"),
(14, 5,	"2020-08-06 15:23:43"),
(15, 1,	"2020-09-14 16:32:22"),
(16, 9,	"2021-05-24 17:23:45"),
(17, 9,	"2018-12-07 22:48:52"),
(20, 10,	"2017-02-06 08:21:34"),
(21, 2,	"2020-10-09 12:27:48"),
(21, 10,	 "2017-12-04 05:33:43"),
(22, 6,	"2018-05-29 14:56:41"),
(23, 1,	"2020-03-06 11:22:33"),
(24, 2,	"2020-05-16 06:16:22"),
(25, 1,	"2020-05-02 05:30:35"),
(26, 3,	"2020-07-30 10:00:00"),
(27, 4,	"2021-01-09 01:44:33"),
(29, 6,	"2017-01-24 00:31:17"),
(30, 6,	"2017-10-12 12:35:20"),
(32, 8,	"2019-05-25 08:14:03"),
(33, 8,	"2021-08-15 21:37:09"),
(34, 2,	"2020-01-02 07:40:33"),
(35, 4,	"2021-07-10 15:20:30"),
(36, 1,	"2020-02-28 10:45:55"),
(38, 6,	"2019-02-07 20:33:48"),
(39, 2,	"2020-09-21 13:14:46"),
(39, 8,	"2018-03-21 16:56:40"),
(40, 8,	"2020-10-18 13:38:05");

#
# Dumping data for table 'followers'
#

INSERT INTO SpotifyClone.followers(artist_id, user_id) VALUES
(1,	1),
(1,	2),
(1,	3),
(1, 6),
(1,	8),
(4,	1),
(4,	4),
(4,	9),
(3,	1),
(3,	2),
(3,	6),
(3,	9),
(2,	3),
(2,	7),
(2,	10),
(5,	5),
(5,	7),
(5,	8),
(6,	5),
(6,	6),
(6,	9),
(6,	10);
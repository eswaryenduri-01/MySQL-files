
create database games;
USE games;





CREATE TABLE players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    dob DATE,
    multi_game_player VARCHAR(100),
    state VARCHAR(100),
    player_level VARCHAR(100),
    no_of_games INT
);


CREATE TABLE cricket (
    player_id INT,
    jersey_no INT PRIMARY KEY,
    player_field VARCHAR(40),
    wins INT,
    wct INT,
    centuries INT,
    avg_score FLOAT,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);


CREATE TABLE kabaddi (
    player_id INT,
    jersey_no INT PRIMARY KEY,
    player_field VARCHAR(20),
    wins INT,
    tackle_pts INT,
    ride_pts INT,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);


CREATE TABLE volley_ball (
    player_id INT,
    jersey_no INT PRIMARY KEY,
    player_field VARCHAR(40),
    wins INT,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);

-- Data Insertion
INSERT INTO players (name, age, dob, multi_game_player, state, player_level, no_of_games) VALUES
('Arjun Sharma', 24, '2002-03-15', 'Cricket', 'Maharashtra', 'National', 1),
('Rohit Verma', 27, '1999-07-21', 'Cricket,Kabaddi', 'Haryana', 'National', 2),
('Vikram Singh', 22, '2004-01-10', 'Kabaddi', 'Punjab', 'State', 1),
('Aman Kumar', 25, '2001-05-18', 'Kabaddi,Volleyball', 'Uttar Pradesh', 'National', 2),
('Karan Patel', 23, '2003-09-12', 'Cricket', 'Gujarat', 'State', 1),
('Rahul Yadav', 28, '1998-11-05', 'Kabaddi', 'Haryana', 'National', 1),
('Aditya Rao', 21, '2005-02-27', 'Volleyball', 'Karnataka', 'State', 1),
('Suresh Nair', 26, '2000-06-14', 'Cricket,Volleyball', 'Kerala', 'National', 2),
('Manish Thakur', 24, '2002-10-30', 'Kabaddi', 'Rajasthan', 'State', 1),
('Devendra Joshi', 29, '1997-04-08', 'Cricket', 'Madhya Pradesh', 'National', 1),
('Yash Deshmukh', 20, '2006-08-19', 'Cricket,Volleyball', 'Maharashtra', 'State', 2),
('Harsh Mehta', 23, '2003-12-02', 'Volleyball', 'Gujarat', 'State', 1),
('Nitin Choudhary', 27, '1999-03-25', 'Kabaddi,Cricket', 'Delhi', 'National', 2),
('Rajat Kapoor', 25, '2001-01-17', 'Volleyball', 'Punjab', 'National', 1),
('Vivek Mishra', 22, '2004-07-09', 'Cricket', 'Uttar Pradesh', 'State', 1),
('Akash Reddy', 26, '2000-09-23', 'Volleyball,Kabaddi', 'Telangana', 'National', 2),
('Pranav Iyer', 21, '2005-11-11', 'Cricket,Volleyball', 'Tamil Nadu', 'State', 2),
('Mohit Bansal', 24, '2002-05-06', 'Kabaddi', 'Rajasthan', 'State', 1),
('Sameer Khan', 28, '1998-02-13', 'Cricket,Kabaddi,Volleyball', 'West Bengal', 'National', 3),
('Tarun Shetty', 23, '2003-06-28', 'Volleyball', 'Karnataka', 'State', 1);

INSERT INTO cricket (player_id, jersey_no, player_field, wins, wct, centuries, avg_score) VALUES
(1, 7, 'Batsman', 18, 12, 4, 48.50),
(2, 18, 'All Rounder', 22, 18, 6, 52.30),
(5, 23, 'Batsman', 15, 8, 3, 45.20),
(8, 11, 'All Rounder', 20, 15, 5, 49.80),
(10, 31, 'Batsman', 25, 10, 8, 56.40),
(11, 9, 'Batsman', 14, 7, 2, 42.70),
(13, 21, 'All Rounder', 19, 16, 4, 47.60),
(15, 5, 'Bowler', 16, 25, 1, 32.50),
(17, 14, 'All Rounder', 17, 13, 3, 44.90),
(19, 45, 'Batsman', 23, 9, 7, 54.10);

INSERT INTO kabaddi (player_id, jersey_no, player_field, wins, tackle_pts, ride_pts) VALUES
(2, 18, 'Raider', 22, 35, 82),
(3, 10, 'Defender', 16, 68, 18),
(4, 7, 'All Rounder', 20, 52, 61),
(6, 12, 'Defender', 24, 75, 22),
(9, 21, 'Raider', 17, 28, 76),
(13, 5, 'All Rounder', 19, 48, 64),
(16, 11, 'Defender', 21, 63, 31),
(18, 9, 'Raider', 15, 25, 70),
(19, 45, 'All Rounder', 23, 55, 73);

INSERT INTO volley_ball (player_id, jersey_no, player_field, wins) VALUES
(4, 7, 'Outside Hitter', 18),
(7, 15, 'Setter', 20),
(8, 11, 'Middle Blocker', 22),
(11, 9, 'Outside Hitter', 19),
(12, 8, 'Libero', 16),
(14, 21, 'Outside Hitter', 19),
(16, 13, 'Opposite Hitter', 21),
(17, 14, 'Setter', 17),
(20, 16, 'Libero', 15);



SELECT * FROM cricket;
SELECT * FROM kabaddi;
SELECT * FROM volley_ball;
SELECT * FROM players;


SELECT * 
FROM players 
WHERE no_of_games > 1 
ORDER BY player_id ASC;


SELECT 
    player_level, 
    COUNT(player_id) AS total_players, 
    AVG(no_of_games) AS avg_games_played
FROM players
GROUP BY player_level;


SELECT 
    state, 
    COUNT(*) AS national_player_count
FROM players
WHERE player_level = 'National'
GROUP BY state
HAVING COUNT(*) > 1;


SELECT 
    player_id, 
    jersey_no, 
    (tackle_pts + ride_pts) AS total_points
FROM kabaddi
ORDER BY total_points DESC;



SELECT 
    p.player_id, 
    p.name, 
    p.state, 
    c.jersey_no, 
    c.player_field, 
    c.centuries, 
    c.avg_score
FROM players p
INNER JOIN cricket c ON p.player_id = c.player_id;


SELECT 
    p.player_id, 
    p.name, 
    p.player_level, 
    k.jersey_no, 
    k.player_field AS kabaddi_role, 
    k.wins AS kabaddi_wins
FROM players p
LEFT JOIN kabaddi k ON p.player_id = k.player_id;


SELECT 
    p.name, 
    p.state, 
    v.jersey_no, 
    v.player_field AS volleyball_role, 
    v.wins
FROM players p, volley_ball v
WHERE p.player_id = v.player_id;


SELECT 
    player_id, 
    player_field, 
    avg_score
FROM cricket
WHERE avg_score > (SELECT AVG(avg_score) FROM cricket);


SELECT 
    p1.player_id, 
    p1.name, 
    p1.player_level, 
    p1.age
FROM players p1
WHERE p1.age > (
    SELECT AVG(p2.age) 
    FROM players p2 
    WHERE p2.player_level = p1.player_level
);


SELECT player_id FROM cricket
UNION
SELECT player_id FROM kabaddi;

SELECT player_id 
FROM cricket 
WHERE player_id IN (SELECT player_id FROM volley_ball);


CREATE VIEW top_players_of_cricket AS
SELECT * 
FROM cricket 
WHERE wins > 16;

SELECT * FROM top_players_of_cricket;


CREATE VIEW national_multigame_summary AS
SELECT 
    p.player_id, 
    p.name, 
    p.state, 
    c.avg_score AS cricket_avg, 
    k.tackle_pts AS kabaddi_tackles, 
    v.wins AS volleyball_wins
FROM players p
LEFT JOIN cricket c ON p.player_id = c.player_id
LEFT JOIN kabaddi k ON p.player_id = k.player_id
LEFT JOIN volley_ball v ON p.player_id = v.player_id
WHERE p.player_level = 'National' AND p.no_of_games > 1;

SELECT * FROM national_multigame_summary;
DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    coach TEXT,
    ranking VARCHAR(5)
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    jersey_number INTEGER,
    is_active BOOLEAN
); 

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1 TEXT NOT NULL,
    team2 TEXT NOT NULL
);


CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players,
    match_id INT REFERENCES matches
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE teams_players (
    id SERIAL PRIMARY KEY,
    team_id INT REFERENCES teams,
    player_id INT REFERENCES players
);

CREATE TABLE seasons_matches (
    id SERIAL PRIMARY KEY,
    season_id INT REFERENCES seasons,
    match_id INT REFERENCES matches
);

CREATE TABLE referees_matches (
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES matches,
    ref_id INT REFERENCES referees
);



INSERT INTO teams (name, coach, ranking)
VALUES
('Patriots', 'Bill Belichick', '1'),
('Panthers', 'Matt Rhule', '32'),
('49ers', 'Kyle Shanahan', '7');

INSERT INTO players (first_name, last_name, jersey_number, is_active)
VALUES
('Tom', 'Brady', 12, true),
('Cam', 'Newton', 1, true),
('Baker', 'Mayfield', 15, true);

INSERT INTO referees (first_name, last_name)
VALUES
('Angel', 'Hernandez'),
('Ref', 'Referee');

INSERT INTO matches (team1, team2)
VALUES
('Patriots', 'Panthers'),
('Panthers', '49ers'),
('Patriots', '49ers');

INSERT INTO goals (player_id, match_id)
VALUES 
(1, 1),
(2, 2);

INSERT INTO seasons (start_date, end_date)
VALUES 
('2021-01-01', '2022-05-01');

INSERT INTO teams_players (team_id, player_id)
VALUES
(1, 1),
(2, 2);

INSERT INTO seasons_matches (season_id, match_id)
VALUES
(1, 1),
(1, 2),
(1, 3);

INSERT INTO referees_matches (match_id, ref_id)
VALUES
(1, 1),
(2, 2);
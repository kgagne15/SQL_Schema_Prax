-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INT REFERENCES galaxies
);

CREATE TABLE galaxies_planets (
  id SERIAL PRIMARY KEY,
  galaxy_id INT REFERENCES galaxies,
  planet_id INT REFERENCES planets
); 

CREATE TABLE moons_planets (
  id SERIAL PRIMARY KEY,
  moon_id INT REFERENCES moons,
  planet_id INT REFERENCES planets
); 




INSERT INTO galaxies (name)
VALUES
('Milky Way');

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy_id)
VALUES
  ('Earth', 1.00, 'The Sun', 1),
  ('Mars', 1.88, 'The Sun', 1),
  ('Venus', 0.62, 'The Sun', 1),
  ('Neptune', 164.8, 'The Sun', 1),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1);

INSERT INTO moons (name)
VALUES 
('The Moon'), 
('Phobos'),
('Deimos'),
('Naiad'),
('Thalassa'),
('Despina'),
('Galatea'); 

INSERT INTO moons_planets (moon_id, planet_id)
VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4);


INSERT INTO galaxies_planets(galaxy_id, planet_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6);
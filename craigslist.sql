DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    username VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    user_id INT NOT NULL REFERENCES users,
    region_id INT NOT NULL REFERENCES regions,
    -- category_id INT NOT NULL REFERENCES categories,
    location TEXT NOT NULL
);

CREATE TABLE users_regions (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users,
    region_id INT NOT NULL REFERENCES regions
);

CREATE TABLE categories_posts (
    id SERIAL PRIMARY KEY,
    category_id INT NOT NULL REFERENCES categories,
    post_id INT NOT NULL REFERENCES posts
);

INSERT INTO users (first_name, last_name, username)
VALUES
('John', 'Doe', 'Jdoe345'),
('Harry', 'Potter', 'Chosen1');

INSERT INTO regions (name)
VALUES
('San Francisco'),
('Seattle'), 
('Boston'),
('Charleston');

INSERT INTO categories (name)
VALUES
('Fun'),
('Informational'),
('Celebrity');

INSERT INTO posts (title, text, user_id, region_id, location)
VALUES
('The Monarchy', 'Queen Elizabeth II has reigned for many years', 1, 1, 'San Francisco'),
('The Grammys', 'Beyonce has a lot of Grammys', 1, 2, 'Seattle');

INSERT INTO categories_posts (category_id, post_id)
VALUES
(1, 1),
(2, 1),
(2, 2); 



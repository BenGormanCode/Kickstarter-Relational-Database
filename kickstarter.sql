-- Drop Users
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS creators;
DROP TABLE IF EXISTS pledges;
DROP TABLE IF EXISTS project_goals;
DROP TABLE IF EXISTS goals;


-- Created Tables
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username varchar(100),
  email varchar(100),
  phone VARCHAR(10) NOT NULL,
  CHECK (phone ~ '^\d{10}$')
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category_name varchar 
);

CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  title varchar(100),
  categories_id integer,
  FOREIGN KEY(categories_id) REFERENCES categories(id)
);

CREATE TABLE creators (
  id SERIAL PRIMARY KEY,
  user_id integer,
  project_id integer,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(project_id) REFERENCES projects(id)
);

CREATE TABLE pledges (
  id SERIAL PRIMARY KEY,
  user_id integer,
  project_id integer,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(project_id) REFERENCES projects(id),
  amount integer
);



-- CREATE TABLE project_goals (
-- id SERIAL PRIMARY KEY,
-- FOREIGN KEY(project_id) REFERENCES projects(id),
-- FOREIGN KEY(goals_id) REFERENCES goals(id)
-- );

-- CREATE TABLE goals (
--   id SERIAL PRIMARY KEY,
--   goal_name varchar(100), 
--   goal_amount integer(10)
-- );

-- Table Data
INSERT INTO users (username, email, phone) VALUES 
('alice.brown', 'alice.brown@gmail.com', '0401234567'),
('ben.clark', 'ben.clark@yahoo.com', '0412345678'),
('carla.davis', 'carla.davis@icloud.com', '0423456789'),
('david.evans', 'david.evans@outlook.com', '0434567890'),
('emma.ford', 'emma.ford@gmail.com', '0445678901'),
('frank.green', 'frank.green@yahoo.com', '0456789012'),
('grace.hill', 'grace.hill@icloud.com', '0467890123'),
('harry.ives', 'harry.ives@outlook.com', '0478901234'),
('isabella.james', 'isabella.james@gmail.com', '0489012345'),
('jack.king', 'jack.king@yahoo.com', '0490123456'),
('karen.lee', 'karen.lee@icloud.com', '0402345678'),
('liam.morgan', 'liam.morgan@outlook.com', '0413456789'),
('mia.nelson', 'mia.nelson@gmail.com', '0424567890'),
('noah.owen', 'noah.owen@yahoo.com', '0435678901'),
('olivia.parker', 'olivia.parker@icloud.com', '0446789012'),
('paul.quinn', 'paul.quinn@outlook.com', '0457890123'),
('quincy.roberts', 'quincy.roberts@gmail.com', '0468901234'),
('rachel.smith', 'rachel.smith@yahoo.com', '0479012345'),
('sam.taylor', 'sam.taylor@icloud.com', '0480123456'),
('tina.underwood', 'tina.underwood@outlook.com', '0491234567'),
('ursula.vasquez', 'ursula.vasquez@gmail.com', '0401345678'),
('victor.wong', 'victor.wong@yahoo.com', '0412456789'),
('wendy.xu', 'wendy.xu@icloud.com', '0423567890'),
('xander.young', 'xander.young@outlook.com', '0434678901'),
('yara.zimmer', 'yara.zimmer@gmail.com', '0445789012'),
('zach.white', 'zach.white@yahoo.com', '0456890123');

INSERT INTO categories (category_name) VALUES
('Art'),
('Comics'),
('Craft'),
('Dance'),
('Design'),
('Fashion'),
('Film'),
('Food'),
('Games'),
('Journalism'),
('Music'),
('Photography'),
('Publishing'),
('Technology'),
('Theatre');

INSERT INTO projects (title, categories_id) VALUES
('Sustainable Fashion Line', 6),
('Board Game of the Ancient Realms', 9),
('Minimalist Home Decor Collection', 5),
('Comic Book Anthology: Tales of the Future', 2),
('Indie Film: Roads Less Traveled', 7),
('Modern Dance Performance Series', 4),
('Eco-Friendly Art Supplies Kit', 3),
('Photojournalism Series: Urban Wildlife', 10),
('Handcrafted Wooden Jewelry Boxes', 3),
('Artisan Food Market Pop-Up', 8);

INSERT INTO creators (user_id, project_id) VALUES
(4, 1),
(3, 2),
(10, 3),
(9, 4),
(2, 5),
(7, 6),
(8, 7),
(6, 8),
(5, 9),
(1, 10);

INSERT INTO pledges (user_id, project_id, amount) VALUES
(12, 1, 10000),
(18, 1, 15000),
(22, 1, 5000),
(24, 1, 2000),
(14, 2, 5000),
(21, 2, 3000),
(12, 2, 2000),
(10, 3, 12000),
(17, 3, 8000),
(11, 3, 5000),
(18, 3, 3000),
(17, 4, 4000),
(19, 4, 6000),
(2, 4, 5000),
(12, 4, 3000),
(21, 4, 2000),
(15, 5, 13500),
(11, 5, 20000),
(16, 5, 10000),
(22, 6, 3000),
(17, 6, 4000),
(21, 6, 5000),
(18, 6, 9000),
(18, 7, 4500),
(14, 7, 5000),
(23, 7, 3500),
(20, 7, 2000),
(13, 7, 4500),
(13, 8, 20000),
(22, 8, 5000),
(24, 8, 7000),
(20, 9, 3000),
(18, 9, 2000),
(21, 9, 1500),
(14, 9, 1500),
(11, 9, 1000),
(16, 10, 3000),
(23, 10, 2000),
(24, 10, 6500),
(12, 10, 2500),
(22, 10, 1000);

-- INSERT INTO project_goals;
-- INSERT INTO goals;


-- View Data
SELECT * FROM users;
SELECT * FROM creators;
SELECT * FROM pledges;
SELECT * FROM projects;
-- SELECT * FROM project_goals;
-- SELECT * FROM goals;
SELECT * FROM categories;


-- 3 well written complex queries that involve selecting, filtering, grouping and ordering


-- 2 complex queries which join tables together


-- Query that retrieves data and does sum, average, min, max or other


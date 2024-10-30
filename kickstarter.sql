-- Created Tables
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username varchar(100),
  email varchar(100),
  phone VARCHAR(10) NOT NULL,
  CHECK (phone ~ '^\d{10}$')
);

-- CREATE TABLE creators (
--   id SERIAL PRIMARY KEY,
--   FOREIGN KEY(user_id) REFERENCE users(id),
--   FOREIGN KEY(project_id) REFERENCE project.id
-- );

-- CREATE TABLE pledges (
--   id SERIAL PRIMARY KEY
--   FOREIGN KEY(user_id) REFERENCE users(id),
--   FOREIGN KEY(project_id) REFERENCE projects(id),
--   amount integer
-- );

-- CREATE TABLE projects (
--   id SERIAL PRIMARY KEY,
--   title varchar(100),
--   FOREIGN KEY(categories_id) REFERENCE categories(id)
-- );

-- CREATE TABLE categories (
--   id SERIAL PRIMARY KEY
--   category_name varchar 
-- );

-- CREATE TABLE project_goals (
-- id SERIAL PRIMARY KEY,
-- FOREIGN KEY(project_id) REFERENCE projects(id),
-- FOREIGN KEY(goals_id) REFERENCE goals(id)
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




-- View Data
SELECT * FROM users;
-- SELECT * FROM creators;
-- SELECT * FROM pledges;
-- SELECT * FROM projects;
-- SELECT * FROM categories;
-- SELECT * FROM project_goals;
-- SELECT * FROM goals;


-- 3 well written complex queries that involve selecting, filtering, grouping and ordering


-- 2 complex queries which join tables together


-- Query that retrieves data and does sum, average, min, max or other


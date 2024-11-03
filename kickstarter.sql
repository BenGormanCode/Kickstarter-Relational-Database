-- Drop Tables
DROP TABLE IF EXISTS project_goals;
DROP TABLE IF EXISTS goals CASCADE;
DROP TABLE IF EXISTS pledges;
DROP TABLE IF EXISTS creators;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

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
  FOREIGN KEY(categories_id) REFERENCES categories(id) ON DELETE CASCADE
);

CREATE TABLE creators (
  id SERIAL PRIMARY KEY,
  user_id integer,
  project_id integer,
  FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY(project_id) REFERENCES projects(id) ON DELETE CASCADE
);

CREATE TABLE pledges (
  id SERIAL PRIMARY KEY,
  user_id integer,
  project_id integer,
  FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY(project_id) REFERENCES projects(id) ON DELETE CASCADE,
  amount integer
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  goal_name varchar(100), 
  goal_amount integer
);

CREATE TABLE project_goals (
id SERIAL PRIMARY KEY,
project_id integer,
goals_id integer,
FOREIGN KEY(project_id) REFERENCES projects(id) ON DELETE CASCADE,
FOREIGN KEY(goals_id) REFERENCES goals(id) ON DELETE CASCADE
);

-- Table Data
INSERT INTO users (username, email, phone) VALUES 
('Alice Brown', 'alice.brown@gmail.com', '0401234567'),
('Ben Clark', 'ben.clark@yahoo.com', '0412345678'),
('Carla Davis', 'carla.davis@icloud.com', '0423456789'),
('David Evans', 'david.evans@outlook.com', '0434567890'),
('Emma Ford', 'emma.ford@gmail.com', '0445678901'),
('Frank Green', 'frank.green@yahoo.com', '0456789012'),
('Grace Hill', 'grace.hill@icloud.com', '0467890123'),
('Harry Ives', 'harry.ives@outlook.com', '0478901234'),
('Isabella James', 'isabella.james@gmail.com', '0489012345'),
('Jack Kross', 'jack.king@yahoo.com', '0490123456'),
('Karen Lee', 'karen.lee@icloud.com', '0402345678'),
('Liam Morgan', 'liam.morgan@outlook.com', '0413456789'),
('Mia Nelson', 'mia.nelson@gmail.com', '0424567890'),
('Noah Owen', 'noah.owen@yahoo.com', '0435678901'),
('Olivia Parker', 'olivia.parker@icloud.com', '0446789012'),
('Paul Quinn', 'paul.quinn@outlook.com', '0457890123'),
('Quincy Roberts', 'quincy.roberts@gmail.com', '0468901234'),
('Rachel Smith', 'rachel.smith@yahoo.com', '0479012345'),
('Sam Taylor', 'sam.taylor@icloud.com', '0480123456'),
('Tina Underwood', 'tina.underwood@outlook.com', '0491234567'),
('Ursula Vasquez', 'ursula.vasquez@gmail.com', '0401345678'),
('Victor Wong', 'victor.wong@yahoo.com', '0412456789'),
('Wendy Xu', 'wendy.xu@icloud.com', '0423567890'),
('Xander Young', 'xander.young@outlook.com', '0434678901'),
('Yara Zimmer', 'yara.zimmer@gmail.com', '0445789012'),
('Zach White', 'zach.white@yahoo.com', '0456890123');

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

INSERT INTO goals (goal_name, goal_amount) VALUES
('Fashion Line Funding', 30000),
('Board Game Beta', 18000),
('Collecting for Collection', 25000),
('Book One', 20000),
('Film Budget', 50000),
('First Shoot', 12000),
('Art Supply Kit', 15000),
('Wildlife Series', 22000),
('Basic Boxes', 8000),
('Pop Up Market', 10000);

INSERT INTO project_goals (project_id, goals_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Number of Projects in Each Category (Select, Filter, Group, Order)
SELECT 
  categories_id,
  COUNT(*) AS project_count
FROM 
  projects
WHERE 
  categories_id IS NOT NULL
GROUP BY 
  categories_id
ORDER BY 
  project_count DESC;

-- Pledges Over $10,000 (Select, Filter, Group, Order)
SELECT 
  user_id,
  MAX(amount) AS highest_spend
FROM 
  pledges
GROUP BY 
  user_id
HAVING
  MAX(amount) > 10000
ORDER BY 
  highest_spend DESC;

-- Users with 3+ Pledges (Select, Filter, Group, Order)
SELECT 
    user_id,
    COUNT(*) AS pledge_count
FROM 
    pledges
GROUP BY 
    user_id
HAVING 
    COUNT(*) >= 3  
ORDER BY 
    pledge_count DESC;

-- Total Earned by Project (Joins)
SELECT 
  projects.title AS project_title,
  users.username AS creator,
  SUM(pledges.amount) AS total_pledged
FROM 
  projects
JOIN 
  pledges ON projects.id = pledges.project_id
JOIN 
  creators ON projects.id = creators.project_id 
JOIN 
  users ON creators.user_id = users.id 
GROUP BY 
  projects.title, users.username
ORDER BY 
  total_pledged DESC;

-- Total Number of Pledges per Category (Joins)
SELECT 
    categories.category_name,
    COUNT(pledges.id) AS total_pledges
FROM 
    categories
INNER JOIN 
    projects ON categories.id = projects.categories_id
INNER JOIN 
    pledges ON projects.id = pledges.project_id
GROUP BY 
    categories.category_name
ORDER BY 
    total_pledges DESC;
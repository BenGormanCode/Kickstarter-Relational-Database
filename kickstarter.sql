CREATE TABLE users {
  id SERIAL PRIMARY KEY,
  username varchar(100),
  email varchar(100),
  phone VARCHAR(10) NOT NULL,
  CHECK (phone ~ '^\d{10}$')
};

CREATE TABLE creators {
  id SERIAL PRIMARY KEY,
  FOREIGN KEY(user_id) REFERENCE users(id),
  FOREIGN KEY(project_id) REFERENCE project.id
};

CREATE TABLE pledges {
  id SERIAL PRIMARY KEY
  FOREIGN KEY(user_id) REFERENCE users(id),
  FOREIGN KEY(project_id) REFERENCE projects(id),
  amount integer
}

CREATE TABLE projects {
  id SERIAL PRIMARY KEY,
  title varchar(100),
  FOREIGN KEY(categories_id) REFERENCE categories(id)
}

CREATE TABLE categories {
  id SERIAL PRIMARY KEY
  category_name varchar 
}

CREATE TABLE project_goals {
id SERIAL PRIMARY KEY,
FOREIGN KEY(project_id) REFERENCE projects(id),
FOREIGN KEY(goals_id) REFERENCE goals(id)
}

CREATE TABLE goals {
  id SERIAL PRIMARY KEY,
  goal_name varchar(100), 
  goal_amount integer(10)
}


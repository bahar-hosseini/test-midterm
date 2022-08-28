DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS listings CASCADE;
DROP TABLE IF EXISTS purchases CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS favourites CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  is_admin: BOOLEAN
);

CREATE TABLE listings (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price INTEGER  NOT NULL DEFAULT 0,
  photo_url VARCHAR(255) NOT NULL,
  is_sold BOOLEAN,
  date_posted DATE
);


CREATE TABLE purchases (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  listing_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  purchase_date DATE
);

CREATE TABLE messages(
  id SERIAL PRIMARY KEY NOT NULL,
  listing_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  message TEXT,
  date_sent DATE
);

CREATE TABLE favourites(
  id SERIAL PRIMARY KEY NOT NULL,
  listing_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  date_favourited DATE
);
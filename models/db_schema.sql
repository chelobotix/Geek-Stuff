CREATE DATABASE geek_stuff;

CREATE TABLE label(
  id INT PRIMARY KEY,
  title VARCHAR(250),
  color VARCHAR(250)
);

CREATE TABLE genres(
  id SERIAL PRIMARY KEY,
  name VARCHAR(200),
);

CREATE TABLE author(
  id INT PRIMARY KEY,
  first_name VARCHAR(250),
  last_name VARCHAR(250)
);

CREATE TABLE music(
    id SERIAL PRIMARY KEY,
    publish_date DATE NOT NULL,
    archived BOOLEAN FALSE
    on_spotify BOOLEAN FALSE,
    label_id INT,
    genre_id INT,
    author_id INT,
    CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id),
    CONSTRAINT fk_authors FOREIGN KEY(author_id) REFERENCES author(id),
    CONSTRAINT fk_genres FOREIGN KEY(genre_id) REFERENCES genres(id)
);

CREATE TABLE game(
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN FALSE,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  label_id INT,
  genre_id INT,
  author_id INT,
  CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id),
  CONSTRAINT fk_authors FOREIGN KEY(author_id) REFERENCES author(id),
  CONSTRAINT fk_genres FOREIGN KEY(genre_id) REFERENCES genres(id)
);

CREATE TABLE book(
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN FALSE,
  cover_state VARCHAR(50) NOT NULL,
  publisher VARCHAR(250) NOT NULL,
  label_id INT,
  genre_id INT,
  author_id INT,
  CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id),
  CONSTRAINT fk_authors FOREIGN KEY(author_id) REFERENCES author(id),
  CONSTRAINT fk_genres FOREIGN KEY(genre_id) REFERENCES genres(id)
);




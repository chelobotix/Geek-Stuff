CREATE DATABASE geek_stuff;

CREATE TABLE music_albums(
    id SERIAL PRIMARY KEY,
    genre_id INT NOT NULL,
    publish_date DATE NOT NULL,
    on_spotify BOOLEAN FALSE,
    archived BOOLEAN FALSE
    CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE genres(
  id SERIAL PRIMARY KEY,
  name VARCHAR(200),
);

CREATE TABLE game(
  id INT PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_paleyd_at DATE,
  label_id INT,
  genre_id INT,
  author_id INT,
  CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id),
  CONSTRAINT fk_authors FOREIGN KEY(author_id) REFERENCES author(id),
  CONSTRAINT fk_genres FOREIGN KEY(genre_id) REFERENCES genres(id)
);

CREATE TABLE author(
  id INT PRIMARY KEY,
  first_name VARCHAR(250),
  last_name VARCHAR(250)
);
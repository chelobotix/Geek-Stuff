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
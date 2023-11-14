-- We can insert a new row as follows
INSERT INTO `moviesdb`.`movies` (`movie_id`, `title`, `industry`, `release_year`, `imdb_rating`, `studio`, `language_id`) 
VALUES ('141', 'Bahubali', 'Bollywood', 2025, '9.0', 'Arka Media Works', '2');

-- We can insert values in individual columns by just mentioning the column name and corresponding values as follows 
INSERT INTO movies
(title, industry, release_year)
values ('Bahubali', 'Bollywood', 2030);

-- Inserting multiple values in the table
INSERT INTO movies
	(title,industry,language_id)
VALUES
	("Inception 2","Hollywood",5),
    ("Inception 3","Hollywood",5),
    ("Inception 4","Hollywood",5);

SELECT * FROM moviesdb.movies;


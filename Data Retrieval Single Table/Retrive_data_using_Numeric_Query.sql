SELECT * FROM movies;
-- How do we find the movies with highest IMDB rating
SELECT * FROM movies WHERE imdb_rating>=9;

-- Movies with IMDB rating less than 5
SELECT * FROM movies WHERE imdb_rating<=5;

-- We need to find movies between rating 6 and 8
SELECT * FROM movies WHERE imdb_rating>=6 AND imdb_rating<=8;

-- Better way to find movies between rating 6 and 8 is to use the BETWEEN operator
SELECT * FROM movies WHERE imdb_rating BETWEEN 6 AND 8;

-- We will see how to use the "OR" operator
SELECT * FROM movies WHERE release_year= 2022 OR release_year=2021 OR release_year=2020;

-- Now Imagine we have to see five different release years its better to use the "IN" operator
SELECT * FROM movies WHERE release_year IN(2022,2013,2014,2015);

-- Another example of "IN" operator in a text column
SELECT * FROM movies WHERE studio IN("Marvel Studios","Homable Films");

-- NULL is an value and when we want to retrieve NULl value from imdb rating we use "is NULL" operator
SELECT * FROM movies WHERE imdb_rating is NULL;

-- Similary we have the "is NOT NULL" operator
SELECT * FROM movies WHERE imdb_rating is NOT NULL;

-- Suppose you want to order the movies with highest IMDB rating you can use the "ORDER BY" clause. by default is ASC order
SELECT * FROM movies WHERE industry="Bollywood" 
ORDER BY imdb_rating;

-- You can specify for DESC order
SELECT * FROM movies WHERE industry="Bollywood" 
ORDER BY imdb_rating DESC;

-- We want to see the first 5 highest rated movies. We use the "LIMIT" clause
SELECT * FROM movies WHERE industry="Bollywood" 
ORDER BY imdb_rating DESC LIMIT 5;

-- We want to display the 5 highest rated movies from the second index we use "OFFSET"
SELECT * FROM movies WHERE industry="Bollywood" 
ORDER BY imdb_rating DESC LIMIT 5 OFFSET 1;

-- 1. Print all movies in the order of their release year (latest first)
SELECT * FROM movies
ORDER BY release_year DESC;

-- 2. All movies released in the year 2022
SELECT * FROM movies WHERE release_year=2022;

-- Now all the movies released after 2020
SELECT * FROM movies WHERE release_year>2020;

-- 4. All movies after the year 2020 that have more than 8 rating
SELECT * FROM movies WHERE release_year> 2020 AND imdb_rating>8;

-- 5. Select all movies that are by Marvel studios and Hombale Films
SELECT * FROM movies WHERE studio IN ("Marvel studios","Homable Films");

-- 6. Select all THOR movies by their release year
SELECT * FROM movies WHERE title LIKE "%thor%" ;

-- 7. Select all movies that are not from Marvel Studios
SELECT * FROM movies WHERE studio != "Marvel Studios";







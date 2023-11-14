-- Select a movie with highest imdb_rating
-- We will see SUBQUERIES

SELECT * FROM movies
ORDER BY imdb_rating DESC
LIMIT 1 ;

-- We will see doing the above with a subquery
-- This SubQuery Returned a SINGLE value
SELECT max(imdb_rating) FROM movies;


SELECT * FROM movies
WHERE imdb_rating = (SELECT max(imdb_rating) FROM movies);

-- Lets see an example of a SubQuery Reutrning LIST of values
-- Suppose we want to return a list of movies with min and max values 

SELECT * 
FROM movies
WHERE imdb_rating IN ((SELECT max(imdb_rating) FROM movies),(SELECT min(imdb_rating) FROM movies));

-- Lets see an example where SubQuery Returns a Table
-- Select all the actors whose age > 70 and < 85

SELECT 
name,
YEAR(curdate())-birth_year as age
FROM actors
HAVING age >40;
-- Note we cannot use WHERE clasue above on "age" as age is a derived Column.as
-- We can use HAVING clause OR we can use a subquery

-- --Let us see how we can Subquery the above. First we will alias the entire query 
SELECT * FROM
(SELECT 
name,
YEAR(curdate())-birth_year as age
FROM actors) as actors_age
WHERE age>70 and age<85




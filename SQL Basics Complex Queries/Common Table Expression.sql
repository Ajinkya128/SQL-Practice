-- COMMON TABLE EXPRESSION

-- get all actors whose age is between 70 and 85


SELECT * 
FROM (SELECT * ,
YEAR(curdate())-birth_year as age
FROM actors ) as actors_age
WHERE age>70 and age<85 ;

-- Writing the above with CTE

WITH actors_age as (SELECT * ,
YEAR(curdate())-birth_year as age
FROM actors ) 

SELECT *
FROM actors_age
WHERE age>70 and age<85;

# movies that produced 500% profit and their rating was less than avg rating for all movies
-- Lets divide the above in two sections
-- The first section is movies that produced 500% profit

SELECT *,
		(revenue-budget)*100/budget as pct_profit
FROm Financials
WHERE (revenue-budget)*100/budget >=500;

-- The second section is movies where rating was less than avg rating
SELECT * 
FROM movies
WHERE imdb_rating< (SELECT 
AVG(imdb_rating)
FROM movies);

-- How do we combine these two queries to get the final answer?
-- We see that the movie_id column is common on both the tables
-- We will do a JOIN on both the above queries
-- Suppose you make a JOIN from some table x on some table y 

SELECT * 
FROM (SELECT *,
		(revenue-budget)*100/budget as pct_profit
FROM Financials
WHERE (revenue-budget)*100/budget >=500)  x
JOIN (SELECT * FROM movies WHERE imdb_rating< (SELECT AVG(imdb_rating) FROM movies)) y

ON x.movie_id=y.movie_id;

-- Lets convert the above in CTE

WITH 
	x as (SELECT *,
		(revenue-budget)*100/budget as pct_profit
FROM Financials
WHERE (revenue-budget)*100/budget >=500
    ),
    y as(SELECT * FROM movies WHERE imdb_rating< (SELECT AVG(imdb_rating) FROM movies)
    )
    
SELECT *
FROM x
JOIN y 
ON x.movie_id=y.movie_id;
    




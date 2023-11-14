
-- The first Join we are writing is INNER JOIN
-- First we specify which columns we want
-- The left table is movies and the right table is financials 
SELECT  
movie_id , title, budget, revenue, currency, unit
FROM movies
JOIN financials
ON movies.movie_id = financials.movie_id;

-- The above query will give an error since movie_id is present in both the tables
--  Therefore we have to specify from which table is the movie_id, by movies.movie_id
SELECT  
movies.movie_id , title, budget, revenue, currency, unit
FROM movies
JOIN financials
ON movies.movie_id = financials.movie_id;

-- --We can shorten the above query by
SELECT  
m.movie_id , title, budget, revenue, currency, unit
FROM movies m
JOIN financials f
ON m.movie_id = f.movie_id;

-- --The join that we performed above by defualt is a INNER JOIN 
-- An INNER JOIN only returns all the common values between the tables

-- NOW theer are some data which is present in movies table and some data which is present only in financials table
-- If we want all the data from the left table we will use the LEFT JOIN

SELECT  
m.movie_id , title, budget, revenue, currency, unit
FROM movies m
LEFT JOIN financials f
ON m.movie_id = f.movie_id;

-- As soon as we do LEFT JOIN we see that Sholay & Inception is populated but it does not have rest of values

-- Similarly when we do a RIGHT JOIN, we will get all the records in the RIght Join but Sholay&Inception will not be visible

SELECT
m.movie_id , title, budget, revenue, currency, unit
FROM movies m
RIGHT JOIN financials f
ON m.movie_id= f.movie_id;
-- As we can see from the above JOIN that there are 3 NULL items

-- We want to do a FULL JOIN, for this we will use "UNION"
SELECT  
m.movie_id , title, budget, revenue, currency, unit
FROM movies m
LEFT JOIN financials f
ON m.movie_id = f.movie_id

UNION

SELECT
f.movie_id , title, budget, revenue, currency, unit
FROM movies m
RIGHT JOIN financials f
ON m.movie_id= f.movie_id;

-- Now we will see "USING" clause. It is used when the column names are same for Join Performing
SELECT  
m.movie_id , title, budget, revenue, currency, unit
FROM movies m
LEFT JOIN financials f
USING (movie_id); -- We can sometimes Join two tables based on two columns and specify USING(movie_id,second column)

-- 1. Show all the movies with their language names

SELECT
title,name
FROM movies m
LEFT JOIN languages l
ON m.language_id=l.language_id;

-- Show all Telugu movie names (assuming you don't know the language
-- id for Telugu)-- 
SELECT
title,name
FROM movies m
LEFT JOIN languages l
ON m.language_id=l.language_id
WHERE name="Telugu";

-- Show the language and number of movies released in that language

SELECT
COUNT(name) as Movie_name,name
FROM movies m
LEFT JOIN languages l
ON m.language_id=l.language_id
GROUP BY name
order by Movie_name DESC











 


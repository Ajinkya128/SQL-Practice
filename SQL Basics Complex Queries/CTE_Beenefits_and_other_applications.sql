-- CTE benefits and other applications
-- Query READABILITY is the biggest advantage

-- Simple Queries
-- The same resultset can be referenced Multiple Times.(Within the Scope of the WITH statement)
-- Potential candidate for views 

-- EXERCISE: CTE

-- Select all Hollywood movies released after the year 2000 that made more than 500 million $ profit or more profit. 
-- Note that all Hollywood movies have millions as a unit hence you don't 
-- need to do the unit conversion. Also, you can write this query without CTE as well but you should try to write this using CTE only

SELECT *
FROM movies
WHERE release_year > 2000;

SELECT *,
(revenue-budget) as profit 
FROM financials
WHERE (revenue-budget) > 500;

SELECT *
FROM (SELECT *
FROM movies
WHERE release_year > 2000) x
JOIN (SELECT *,
(revenue-budget) as profit 
FROM financials
WHERE (revenue-budget) > 500) y
ON x.movie_id=y.movie_id;

-- The above can be written as CTE as 

WITH 
x as (SELECT *
FROM movies
WHERE release_year > 2000),
y as (SELECT *,
(revenue-budget) as profit 
FROM financials
WHERE (revenue-budget) > 500)

SELECT 
y.profit, x.title,x.release_year
FROM x
JOIN y
ON x.movie_id=y.movie_id;
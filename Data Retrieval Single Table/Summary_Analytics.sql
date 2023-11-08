-- Example of Count(*). COUNT is an inbuilt function. GIves the total record count in a Table or for a given condition
SELECT COUNT(*) FROM movies WHERE release_year=2022;

-- Syntax for Group By
-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- ORDER BY column_name(s);

-- Suppose we want to get the maximum IMBD rating for bollywood movies
SELECT MAX(imdb_rating) FROM movies WHERE industry = "bollywood";
-- Similarly there is a "MIN" function
SELECT MIN(imdb_rating) FROM movies WHERE industry = "bollywood";

-- We want to find the AVG rating for marvel studios we will use the "AVG" function
SELECT AVG(imdb_rating) FROM movies WHERE studio = "Marvel Studios";

-- To round off the decimals after the . we can use the round() function
SELECT ROUND(AVG(imdb_rating),2) FROM movies WHERE studio = "Marvel Studios";

-- to give Alias. To give a specific name to the output column.
SELECT ROUND(AVG(imdb_rating),2) as avg_rating
FROM movies 
WHERE studio = "Marvel Studios";

-- Suppose we also want to add min and max to the above 
SELECT 
MIN(imdb_rating) as min_rating,
MAX(imdb_rating) as max_rating,
ROUND(AVG(imdb_rating),2) as avg_rating
FROM movies 
WHERE studio = "Marvel Studios";

-- Suppose you want to see the industry count together, we can use the GROUP BY clause.
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) 
-- to group the result-set by one or more columns.

SELECT 
industry,COUNT(*) 
FROM movies 
GROUP BY industry;

-- Now we will set an Alias and use ORDER BY

SELECT 
studio,COUNT(*) as count
FROM movies 
GROUP BY studio
ORDER BY count DESC;

-- Now lets do the same for studio and add avg_rating

SELECT 
studio,COUNT(*) as count,
ROUND(avg(imdb_rating),2) as avg_rating
FROM movies 
GROUP BY studio
ORDER BY avg_rating DESC;

-- How many movies were released between 2015 and 2022-- 
SELECT * FROM movies WHERE release_year IN (2015,2022);

-- 2. Print the max and min movie release year
SELECT 
MAX(release_year) as maxyear,
MIN(release_year) as minyear
FROM movies;

-- 3. Print a year and how many movies were released in that year starting with the latest year
SELECT 
release_year,
COUNT(release_year) as countyear
 FROM movies
 GROUP BY release_year
ORDER BY release_year DESC; 

















 
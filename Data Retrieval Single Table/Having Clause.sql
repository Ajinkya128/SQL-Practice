SELECT * FROM movies;

-- Suppose we want to print all the years where more than two movies were released
SELECT release_year, COUNT(release_year) as rlyear
FROM movies
GROUP BY release_year
ORDER BY rlyear DESC;
-- The above gives us all the movies with desc order of release year
-- Now we want to apply a filter on this to get year with more than two release years
-- There is something similar to WHERE clasue which gets executed after GROUP BY, its called "HAVING".

SELECT release_year, COUNT(release_year) as rlyear
FROM movies
GROUP BY release_year
HAVING rlyear>=2
ORDER BY rlyear DESC;

-- SELECT ---> WHERE ---> GROUP BY ---> HAVING ---> ORDER BY 

-- While using the HAVING clause, the column used with HAVING should be in the SELECT statement





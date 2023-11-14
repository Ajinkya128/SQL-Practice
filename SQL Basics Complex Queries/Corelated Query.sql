-- Co-Related QUery
-- Select the actor id, actor name and the total number of movies they acted in.

	SELECT 
	a.actor_id, a.name, 
	COUNT(*) as movie_count
	FROM movie_actor ma
	JOIN actors a
	ON a.actor_id=ma.actor_id
	GROUP BY a.actor_id
	ORDER BY movie_count DESC;
    
    -- Select the actor id, actor name and the total number of movies they acted in.
   --  When we use subquery we will first start witht the actors table
   SELECT actor_id,name
   FROM actors;
   
   SELECT count(*) FROM movie_actor WHERE actor_id= 51; -- This will only return the count of actor id 51
   
   SELECT 
   actor_id,
   name,
   (SELECT count(*) from movie_actor
   WHERE actor_id= actors.actor_id) as movies_count
   FROM actors
   ORDER BY movies_count DESC;
   
   -- The above subquery is called CORELATED SUBQUERY because the execution of that depends on the outer query
   
   -- We can use EXPLAIN ANALYZE to see how fast a query was executed
   
  --  EXERCISE
  -- 1. Select all the movies with minimum and maximum release_year. Note that there
-- can be more than one movie in min and a max year hence output rows can be more than 2

SELECT *
FROM movies
WHERE release_year IN ((SELECT MAX(release_year) FROM movies),(SELECT MIN(release_year) FROM movies));

-- 2. Select all the rows from the movies table whose imdb_rating is higher than the average 

SELECT *
FROM movies
WHERE imdb_rating > (SELECT 
AVG(imdb_rating)
FROM movies);


 


   
   

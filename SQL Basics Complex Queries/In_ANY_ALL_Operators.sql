
-- Select actors who acted in any of these movies (101,110,121)

SELECT actor_id
FROM movie_actor 
WHERE movie_id IN (101,110,121);

-- Below we used the Subqueries 

SELECT * FROM actors WHERE actor_id IN (SELECT actor_id
FROM movie_actor 
WHERE movie_id IN (101,110,121));

-- The above query can also be written using ANY 
 -- ANY is used in similar fashion to IN, WHERE it will return ANY values mentioned in the subquery

SELECT * FROM actors WHERE actor_id = ANY (SELECT actor_id
FROM movie_actor 
WHERE movie_id IN (101,110,121));

-- Select all movies whose rating is greater than *any* of the marvel movies rating
SELECT * FROM movies WHERE imdb_rating > ANY(SELECT imdb_rating  
FROM movies
WHERE studio="Marvel Studios");
-- bsically using ANY above will return all values which are above minimum imdb rating for marvel 

SELECT * FROM movies WHERE imdb_rating > ALL(SELECT imdb_rating  
FROM movies
WHERE studio="Marvel Studios");

SELECT * FROM movies WHERE imdb_rating > (SELECT max(imdb_rating)  
FROM movies
WHERE studio="Marvel Studios")
-- In the above using ALL will return all the values which are above maximum imdb rating for marvel 
-- Both of the above queries are the same using ALL and MAX 




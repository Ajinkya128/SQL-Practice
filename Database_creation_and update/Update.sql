-- Lets see how to Update a table 
-- There are different ways to UPDATE The Table.
-- Below we have used to update studios where title is inception  
UPDATE movies
SET 
	studio="Warner Bros. Pictures"
WHERE movie_title LIKE "%Inception%";

-- Or here where we explicitly mention the movie_id so as not to Make Mistakes 

UPDATE movies
SET 
	studio="Warner Bros. Pictures"
WHERE movie_id IN (142,106,107,108,109);


SELECT movie_id FROM moviesdb.movies;

 -- Lets Delete all the unwanted ROWS
 
 DELETE FROM movies
 WHERE movie_id IN(143,144,145)
 
 
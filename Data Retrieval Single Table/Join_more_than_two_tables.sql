-- Suppose we want to generate a report where we have Movie nmaes and Comma Seperated Actor names.
-- Here we will need to Join more than 2 tables. movies, movie_actor and actors table
-- We will have to perfoem the JOINS based on movie_id and actor_id
-- We will have to visualize how to make the JOINTS. best is to sketch on paper the various tables.
-- Entity Relationship Diagram: dbdiagram.io 

SELECT 
m.title, a.name
FROM movies m
JOIN movie_actor ma
ON m.movie_id=ma.movie_id
JOIN actors a
ON ma.actor_id=a.actor_id;

-- The above query will give us the Title and and the actor name
-- But we notice that the actor names is seperate. We need the actors together for each Movie

SELECT
m.title, group_concat(a.name SEPARATOR " | ") as actors
FROM movies m
JOIN movie_actor ma
ON m.movie_id=ma.movie_id
JOIN actors a
ON ma.actor_id=a.actor_id
GROUP BY m.movie_id;
-- After using GROUP BY m.movie_id  

-- NOW we have a different Requirement, we need the actor in one column and all the Movies the actor has done seperated by commas

SELECT 
a.name,group_concat(m.title separator " | ") as movies,
COUNT(m.title) as movie_count
FROM actors a
JOIN movie_actor ma
ON a.actor_id=ma.actor_id
JOIN movies m
ON ma.movie_id=m.movie_id	
GROUP BY a.actor_id
ORDER BY movie_count DESC;

-- 1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
-- Print movie name, revenue, currency, and unit-- 
SELECT 
m.title, f.currency, f.unit,l.name, f.revenue,
CASE
	WHEN unit="Billions" THEN (revenue*1000)
    WHEN unit="thousands" THEN (revenue/1000)
    ELSE revenue
END as revenue_mil    
FROM movies m
JOIN languages l
ON m.language_id=l.language_id
JOIN financials f
ON m.movie_id=f.movie_id
WHERE name="hindi"
ORDER BY revenue_mil DESC; 












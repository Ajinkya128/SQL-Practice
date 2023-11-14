-- We have the movies and financials table.
-- Now we want to show the movie title and the Profit together in one table. We will use a JOIN for this 

SELECT 
	m.movie_id,title,industry,budget,revenue,unit,currency,
	CASE
    WHEN unit="thousands" THEN (revenue-budget)/1000
    WHEN unit="Billions" THEN (revenue-budget)*1000
    ELSE (revenue-budget)
    END as Profit_mln 
FROM movies m
JOIN financials f
ON m.movie_id=f.movie_id
WHERE industry = "bollywood"
ORDER BY Profit_mln DESC

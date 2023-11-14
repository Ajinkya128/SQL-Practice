
-- We will see calculated columns
-- We will see the actors table
SELECT * FROM actors;
-- Suppose we want to derive the age of t he actors. We will need to get the current date and subtract the birth_year from it.
-- The below will give you the current Year
SELECT YEAR(CURDATE());

SELECT *,
YEAR(CURDATE()) - birth_year as age FROM actors;

-- Now lets go to a different tabel called FINANCIALS

SELECT * FROM financials;
-- Now we want to print the Revenue of each movies in a new column

SELECT *,
(revenue-budget) as Profit FROM financials;

-- Now we have a new column Profit where everything is in millions. But we have chnage the currency to INR.
-- We will use the IF statement
SELECT *,
if(currency="USD",revenue*77,revenue) as revenue_INR 
FROM financials;
-- It will give a new column Where the usd currency is multiplied by 77

-- We see that the unit of currency is in millions,billions nad thousands. We will bring everything in Millions

SELECT distinct(unit) FROM financials;

-- Lets convert all units in Millions

-- Billions -> rev*1000
-- Thousands -> rev/1000
-- Million -> rev
-- We will use the CASE statement

SELECT *,
CASE
	WHEN unit="Billions" THEN revenue*1000
    WHEN unit="Thousands" THEN revenue/1000
ELSE revenue
END as revenue_MLN
FROM financials;

-- Print profit % for all movies

SELECT *, ((revenue-budget)*100/budget) as Profitpercent
FROM financials;


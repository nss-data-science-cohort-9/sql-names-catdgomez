--selecting all from the names table but just the first 5
/*
SELECT * 
FROM names
LIMIT 5;
*/

-- SQL Names
-- Save a script containing the query you used to answer each question.


-- 1 How many rows are in the names table?
-- there are 1,957,046 rows are in the names table
SELECT COUNT(*)
FROM names;

-- 2 How many total registered people appear in the dataset?
-- 351,653,025 is the total number of registered people in the dataset
SELECT SUM(num_registered) AS Registered_People
FROM names
ORDER BY SUM(num_registered) DESC;


-- 3 Which name had the most appearances in a single year in the dataset?
-- Linda in 1947 at 99,905
SELECT name, year, SUM(num_registered) AS Registered_People
FROM names
GROUP by name, year
ORDER BY SUM(num_registered) DESC;


-- 4 What range of years are included?
-- 1880 through 2018
SELECT MAX(year)
FROM names;

SELECT MIN(year)
FROM names;


-- 5 What year has the largest number of registrations?
-- 1957 with 4,200,022
SELECT year, SUM(num_registered) 
FROM names
GROUP BY year
ORDER BY SUM(num_registered) DESC;

-- 6 How many different (distinct) names are contained in the dataset?
-- There are 98,400 distinct or unique names in the dataset.
SELECT COUNT(DISTINCT name)
FROM names;

-- 7 Are there more males or more females registered?
-- F -> 1,156,527 and M -> 800,519
SELECT gender, COUNT(gender) AS num_of_gender
FROM names
GROUP BY gender;

-- 8 What are the most popular male and female names overall (i.e., the most total registrations)?
-- JAMES at 5,164,280 registered and MARY at 4,125,675
SELECT DISTINCT(name), gender, SUM(num_registered) AS num_of_registered_in_gender
FROM names
GROUP BY gender, name
ORDER BY SUM(num_registered) DESC
LIMIT 5;


-- SELECT 
-- 	DISTINCT(name), 
-- 	gender
-- FROM 	
-- 	names
-- WHERE 
-- 	num_registered =(
-- 	SELECT MAX(num_registered)
-- 	FROM names
-- )
-- GROUP BY 
-- 	gender, 
-- 	name
-- LIMIT 1;



-- What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
SELECT * 
FROM names;


-- Which year had the most variety in names (i.e. had the most distinct names)?

-- What is the most popular name for a girl that starts with the letter X?

-- Write a query to find all (distinct) names that start with a 'Q' but whose second letter is not 'u'.

-- Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.

-- Find all names that are "unisex" - that is all names that have been used both for boys and for girls.

-- Find all names that have made an appearance in every single year since 1880.

-- Find all names that have only appeared in one year.

-- Find all names that only appeared in the 1950s.

-- Find all names that made their first appearance in the 2010s.

-- Find the names that have not be used in the longest.

-- Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.

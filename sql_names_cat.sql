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
-- This is a small enough table to do this, though this: is not a great idea in some cases with larger tables
-- SELECT *
-- FROM names;


-- 2 How many total registered people appear in the dataset?
-- 351,653,025 is the total number of registered people in the dataset
SELECT SUM(num_registered) AS Registered_People
FROM names;

-- not this: from JOSH
-- SELECT COUNT(DISTINCT name)
-- FROM names;


-- 3 Which name had the most appearances in a single year in the dataset?
-- Linda in 1947 at 99,689
SELECT name, year, num_registered 
FROM names
ORDER BY num_registered DESC
LIMIT 1;


-- 4 What range of years are included?
-- 1880 through 2018
SELECT MAX(year), MIN(year)
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
-- This was wrong:
-- SELECT gender, COUNT(gender) AS num_of_gender
-- FROM names
-- GROUP BY gender;

-- THIS WAS CORRECT FROM ABIGAIL
SELECT gender, SUM(num_registered) as totalreg
FROM names
GROUP BY gender
ORDER BY totalreg DESC
LIMIT 2;


-- 8 What are the most popular male and female names overall (i.e., the most total registrations)?
-- JAMES at 5,164,280 registered and MARY at 4,125,675
SELECT name, gender, SUM(num_registered) AS num_of_registered_in_gender
FROM names
GROUP BY gender, name
ORDER BY SUM(num_registered) DESC
LIMIT 5;

-- This was from Shannon
SELECT name, SUM(num_registered) AS total_registered
FROM names
WHERE gender='F'
GROUP BY name
ORDER BY total_registered DESC
LIMIT 1;

SELECT name, SUM(num_registered) AS total_registered
FROM names
WHERE gender='M'
GROUP BY name
ORDER BY total_registered DESC
LIMIT 1;

-- This one was from ANITHA
SELECT DISTINCT ON (gender) gender, name, SUM(num_registered) as total_registered   --DISTINCT ON picks TOP name per gender
FROM names
GROUP BY name, gender
ORDER BY gender, total_registered DESC

-- This was from JOSH
WITH RankedNames AS (
 SELECT 
  gender,
  name,
  SUM(num_registered) as total_registered,
  RANK() OVER (PARTITION BY gender ORDER BY SUM(num_registered) DESC) as rn
 FROM
  names 
 GROUP BY
  gender,
  name
)
SELECT
 gender,
 name,
 total_registered
FROM
 RankedNames
WHERE
 rn = 1;


-- 9 What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
-- Jacob 34,477 and Emily 25,956

SELECT gender, name, SUM(num_registered) 
FROM names
WHERE year BETWEEN 2000 AND 2009 AND gender LIKE '%M%'
GROUP BY gender, name, num_registered
ORDER BY SUM(num_registered) DESC
LIMIT 1;

SELECT gender, name, SUM(num_registered) 
FROM names
WHERE year BETWEEN 2000 AND 2009 AND gender LIKE '%F%'
GROUP BY gender, name, num_registered
ORDER BY SUM(num_registered) DESC
LIMIT 1;


-- 10 Which year had the most variety in names (i.e. had the most distinct names)?
-- 2008	with 32,518 distinct names
SELECT year, COUNT(DISTINCT name)
FROM names
GROUP BY year
ORDER BY COUNT(DISTINCT name) DESC;

-- 11 What is the most popular name for a girl that starts with the letter X?
-- It was "Ximena" at 26,145
SELECT name, gender, SUM(num_registered) AS num_of_name
FROM names
GROUP BY name, gender
HAVING name LIKE 'X%' AND gender LIKE 'F%'
ORDER BY SUM(num_registered) DESC;


-- 12 Write a query to find all (distinct) names that start with a 'Q' but whose second letter is not 'u'.
-- There are 46 distinct names that begin with "Q" but do not have a "u" as their second letter.
SELECT COUNT(DISTINCT name)
FROM names
WHERE name LIKE 'Q%'
  AND name NOT LIKE '_u%'

SELECT DISTINCT(name)
FROM names
WHERE name LIKE 'Q%'
  AND name NOT LIKE '_u%'


-- 13 Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
-- It appears that "Steven" at 1,286,951 is more common than "Stephen"	at 860,972.
SELECT name, SUM(num_registered)
FROM names
WHERE name LIKE 'Stephen' OR name LIKE 'Steven'
GROUP BY name
ORDER BY SUM(num_registered) DESC;


-- 14 Find all names that are "unisex" - that is all names that have been used both for boys and for girls.
-- It appears there are 10,773 names on the list.

SELECT name, COUNT(DISTINCT gender) AS num_of_genders
FROM names
GROUP BY name
HAVING COUNT(DISTINCT gender) > 1;


-- 15 Find all names that have made an appearance in every single year since 1880.
-- There 921

SELECT name, COUNT(DISTINCT year)
FROM names
GROUP BY name
HAVING COUNT(DISTINCT year) = 139;


-- 16 Find all names that have only appeared in one year.
-- There were 21,123 names
SELECT name, COUNT(DISTINCT year)
FROM names
GROUP BY name
HAVING COUNT(DISTINCT year) = 1;


-- 17 Find all names that only appeared in the 1950s.
-- There were 661 unique names but the names that only appeared in the 1950s were: 
SELECT name
FROM names
WHERE year BETWEEN 1950 AND 1959 
EXCEPT
SELECT name
FROM names
WHERE year BETWEEN 1880 AND 1949 OR year BETWEEN 1960 AND 2018;


-- 18 Find all names that made their first appearance in the 2010s.
-- There were 11,270 names
SELECT DISTINCT(name)
FROM names
WHERE year BETWEEN 2010 AND 2018
GROUP BY DISTINCT(name)
EXCEPT
SELECT DISTINCT(name)
FROM names
WHERE year BETWEEN 1880 AND 2009;


-- 19 Find the names that have not be used in the longest.
-- There are 98,400 names in the list
SELECT name, MAX(year) 
FROM names
GROUP BY name
ORDER by MAX(year)


-- 20 Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.
-- Find all unique names that only appeared in 1986
-- There were 201 unique names in 1986

SELECT DISTINCT(name)
FROM names
WHERE year = 1986 
EXCEPT
SELECT DISTINCT(name)
FROM names
WHERE year BETWEEN 1880 AND 1985 OR year BETWEEN 1987 AND 2018
ORDER by name;



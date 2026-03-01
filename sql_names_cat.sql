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



-- What year has the largest number of registrations?

SELECT * 
FROM names;

-- How many different (distinct) names are contained in the dataset?

-- Are there more males or more females registered?

-- What are the most popular male and female names overall (i.e., the most total registrations)?

-- What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?

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

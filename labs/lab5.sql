use taxation;
show tables;
select * from taxpayer;
select * from income_record;
select * from income_category;
select * from financial_year;


SELECT COUNT(*) AS total_income_records
FROM Income_Record;

SELECT SUM(income_id) AS total_income
FROM Income_Record;


SELECT AVG(income_id) AS average_income
FROM Income_Record;

SELECT MAX(income_id) AS highest_income
FROM Income_Record;


SELECT MIN(income_id) AS lowest_income
FROM Income_Record;

/* level 2 */

SELECT taxpayer_id,
       COUNT(*) AS number_of_records
FROM Income_Record
GROUP BY taxpayer_id;


SELECT taxpayer_id,
       SUM(income_id) AS total_income
FROM Income_Record
GROUP BY taxpayer_id;

SELECT category_id,
       AVG(income_amount) AS average_income
FROM Income_Record
GROUP BY category_id;

SELECT category_id,
       MAX(income_amount) AS highest_income
FROM Income_Record
GROUP BY category_id;


SELECT category_id,
       MIN(income_amount) AS lowest_income
FROM Income_Record
GROUP BY category_id;

SELECT year_id,
       SUM(income_amount) AS total_income
FROM Income_Record
GROUP BY year_id;


SELECT year_id,
       COUNT(*) AS number_of_records
FROM Income_Record
GROUP BY year_id;



SELECT category_id,
       year_id,
       SUM(income_amount) AS total_income
FROM Income_Record
GROUP BY category_id, year_id;

/* level 3*/

SELECT category_id,
       SUM(income_amount) AS total_income
FROM Income_Record
GROUP BY category_id
HAVING SUM(income_amount) > 1000000;

SELECT category_id,
       AVG(income_amount) AS average_income
FROM Income_Record
GROUP BY category_id
HAVING AVG(income_amount) > 500000;


SELECT year_id,
       COUNT(*) AS number_of_records
FROM Income_Record
GROUP BY year_id
HAVING COUNT(*) > 3;



SELECT category_id,
       SUM(income_amount) AS total_income
FROM Income_Record
GROUP BY category_id
ORDER BY SUM(income_amount) DESC;


SELECT category_id,
       SUM(income_amount) AS total_income
FROM Income_Record
GROUP BY category_id
HAVING SUM(income_amount) > 1000000
ORDER BY SUM(income_amount) DESC;


SELECT category_id,
       SUM(income_amount) AS total_income,
       AVG(income_amount) AS average_income
FROM Income_Record
GROUP BY category_id;


SELECT category_id,
       year_id,
       SUM(income_amount) AS total_income
FROM Income_Record
GROUP BY category_id, year_id
ORDER BY SUM(income_amount) DESC
LIMIT 1;


SELECT year_id,
       COUNT(DISTINCT taxpayer_id) AS number_of_taxpayers
FROM Income_Record
GROUP BY year_id;




SELECT category_id,
       SUM(income_amount) AS total_income
FROM Income_Record
GROUP BY category_id
ORDER BY SUM(income_amount) DESC
LIMIT 1;


SELECT year_id,
       SUM(income_amount) AS total_income
FROM Income_Record
GROUP BY year_id
ORDER BY SUM(income_amount) DESC
LIMIT 1;




SELECT category_id,
       AVG(income_amount) AS average_income
FROM Income_Record
GROUP BY category_id
ORDER BY AVG(income_amount) DESC
LIMIT 1;


-- Task 4: Income categories having more than 2 records

SELECT category_id,
       COUNT(*) AS number_of_records
FROM Income_Record
GROUP BY category_id
HAVING COUNT(*) > 2;


SELECT year_id,
       SUM(income_amount) AS total_income
FROM Income_Record
GROUP BY year_id
HAVING SUM(income_amount) > 1000000;


-- Task 6: Complete summary report

SELECT category_id,
       COUNT(*) AS number_of_records,
       SUM(income_amount) AS total_income,
       AVG(income_amount) AS average_income,
       MAX(income_amount) AS highest_income,
       MIN(income_amount) AS lowest_income
FROM Income_Record
GROUP BY category_id;

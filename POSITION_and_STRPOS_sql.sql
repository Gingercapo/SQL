-- POSITION takes a character and a column, and provides the index where that character is for each row. The index of the first position is 1 in SQL. If you come from another programming language, many begin indexing at 0. Here, you saw that you can pull the index of a comma as POSITION(',' IN city_state).

-- STRPOS provides the same result as POSITION, but the syntax for achieving those results is a bit different as shown here: STRPOS(city_state, ',').

-- Note, both POSITION and STRPOS are case sensitive, so looking for A is different than looking for a.

-- Therefore, if you want to pull an index regardless of the case of a letter, you might want to use LOWER or UPPER to make all of the characters lower or uppercase.



---### Quizzes POSITION & STRPOS
-- You will need to use what you have learned about LEFT & RIGHT, as well as what you know about POSITION or STRPOS to do the following quizzes.

> -- quetion1. Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.
SELECT 
LEFT(primary_poc, position(' ' IN primary_poc)) as first_name,                           
RIGHT(primary_poc, length(primary_poc) - position(' ' IN primary_poc)) as last_name                           
FROM accounts



> -- quetion2. Now see if you can do the same thing for every rep name in the sales_reps table. Again provide first and last name columns.
SELECT 
left(name, position(' ' IN name)) AS first_name,    right(name, length(name) - position(' ' IN name))  AS last_name                 
FROM sales_reps

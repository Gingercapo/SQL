-- POSITION takes a character and a column, and provides the index where that character is for each row. The index of the first position is 1 in SQL. If you come from another programming language, many begin indexing at 0. Here, you saw that you can pull the index of a comma as POSITION(',' IN city_state).


-- STRPOS provides the same result as POSITION, but the syntax for achieving those results is a bit different as shown here: STRPOS(city_state, ',').


-- Note, both POSITION and STRPOS are case sensitive, so looking for A is different than looking for a.


-- Therefore, if you want to pull an index regardless of the case of a letter, you might want to use LOWER or UPPER to make all of the characters lower or uppercase.


#1. Use DISTINCT to test if there are any accounts associated with more than one region.

SELECT 
  a.id as "account id", 
  r.id as "region id", 
  a.name as "account name", 
  r.name as "region name"
FROM accounts a
    JOIN sales_reps s
       ON s.id = a.sales_rep_id
    JOIN region r
       ON r.id = s.region_id;
       
       
#2. Have any sales reps worked on more than one account?

#Actually all of the sales reps have worked on more than one account. The fewest number of accounts any sales rep works on is 3. There are 50 sales reps, and they all have more than one account.
#Using DISTINCT in the second query assures that all of the sales reps are accounted for in the first query.       
       
SELECT s.id, s.name, count(*) no_acc
FROM sales_reps s
LEFT JOIN accounts a
		ON s.id = a.sales_rep_id
        group by 1,2
        order by 3 desc

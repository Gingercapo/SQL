
# How many of the sales reps have more than 5 accounts that they manage?
#and technically, we can get this using a SUBQUERY as shown below. This same logic can be used for the other queries, but this will not be shown.

SELECT s.id, s.name, COUNT(*) num_reps_above5
FROM sales_reps s
     LEFT JOIN accounts a
	      ON s.id = a.sales_rep_id
          GROUP BY 1,2
             HAVING COUNT(*) > 5
               ORDER BY 3 DESC
         

# OR
SELECT COUNT(*) num_reps_above5
FROM( SELECT 
          s.id, 
          s.name, 
          COUNT(*) num_accounts
       FROM accounts a
            JOIN sales_reps s
                ON s.id = a.sales_rep_id
                   GROUP BY s.id, s.name
                       HAVING COUNT(*) > 5
                          ORDER BY num_accounts) AS Table1;
			  
     
#How many accounts have more than 20 orders?
SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;

SELECT COUNT(count_order) acc_count 
FROM (SELECT a.name, COUNT(*) count_order
FROM accounts a 
   LEFT JOIN orders o
		ON a.id = o.account_id
         GROUP BY 1
         HAVING COUNT(*) > 20        
         ORDER BY 2) as t1

#Which account has the most orders?
SELECT
	a.id, 
	a.name,
	COUNT(*) num_orders
FROM accounts a
      JOIN orders o
	ON a.id = o.account_id
	   GROUP BY a.id, a.name
	     HAVING COUNT(*) > 68
	        ORDER BY num_orders DESC

#How many accounts spent more than 30,000 usd total across all orders?
SELECT COUNT(*) Acc_Greater_30000
FROM (SELECT SUM(o.total_amt_usd) usd_max, a.name, a.id
	FROM orders o
	LEFT JOIN accounts a
		ON o.account_id = a.id
	    GROUP BY a.name, a.id
	      HAVING SUM(o.total_amt_usd) > 30000
	        ORDER BY 1 ) t1


#How many accounts spent less than 1,000 usd total across all orders?
SELECT COUNT(*) Acc_Greater_30000
FROM (SELECT SUM(o.total_amt_usd) usd_max, a.name, a.id
	FROM orders o
	LEFT JOIN accounts a
		ON o.account_id = a.id
	    GROUP BY a.name, a.id
	      HAVING SUM(o.total_amt_usd) < 1000
	        ORDER BY 1 ) t1

#Which account has spent the most with us?
SELECT SUM(o.total_amt_usd) usd_max, a.name, a.id
FROM orders o
LEFT JOIN accounts a
	ON o.account_id = a.id
     GROUP BY a.name, a.id
       ORDER BY 1 desc
          LIMIT 1;
	       
#Which account has spent the least with us?
SELECT SUM(o.total_amt_usd) usd_min, a.name, a.id
FROM orders o
LEFT JOIN accounts a
	ON o.account_id = a.id
     GROUP BY a.name, a.id
       ORDER BY 1 
          LIMIT 1;


#Which accounts used facebook as a channel to contact customers more than 6 times?
SELECT a.id, a.name, w.channel, COUNT(*) channel_use
FROM accounts a
LEFT JOIN web_events w
	 ON a.id = w.account_id
     WHERE channel = 'facebook'
     GROUP BY 1,2,3
     HAVING COUNT(*) > 6
     ORDER BY 4 DESC;
     
     # OR
     
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
	ON a.id = w.account_id
	GROUP BY a.id, a.name, w.channel
	HAVING COUNT(*) > 6 AND w.channel = 'facebook'
	ORDER BY use_of_channel;


#Which account used facebook most as a channel?
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;
# Note: This query above only works if there are no ties for the account that used facebook the most. It is a best practice to use a larger limit number first such as 3 or 5 to see if there are ties before using LIMIT 1.

#Which channel was most frequently used by most accounts?
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;

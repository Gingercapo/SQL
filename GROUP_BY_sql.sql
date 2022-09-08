
Quiz: GROUP BY
#GROUP BY Note
#Now that you have been introduced to JOINs, GROUP BY, and aggregate functions, the real power of SQL starts to come to life. 
#Try some of the below to put your skills to the test!

#Questions: GROUP BY
#Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want to double check your solutions, my answers can be found at the top of the next concept.

#One part that can be difficult to recognize is when it might be easiest to use an aggregate or one of the other SQL functionalities.
#Try some of the below to see if you can differentiate to find the easiest solution.

#1. Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
select a.name, min(o.occurred_at) min_C
from accounts a
inner join orders o
      ON o.account_id = a.id
group by a.name, o.occurred_at
order by  o.occurred_at
limit 1


#2. Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.

#3. Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.

#4. Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.

#5. Who was the primary contact associated with the earliest web_event?

#6. What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.

#7. Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.

--Extracting unique customers by countries:

SELECT new_readers.date,
       new_readers.event,
       new_readers.country,
       new_readers.user_id,
       new_readers.source,
       new_readers.continent,
       customers.event,
       customers.payment
FROM new_readers
  RIGHT JOIN customers ON new_readers.user_id = customers.user_id;


--Extracting funnel analysis table:

SELECT new.date, new.source, new.country, new.continent, new.new, returnin.returnin, subscribers.subscribers, customers.customers
FROM
--Funnel New Readers
(SELECT date, source, country, continent, count(*) as new
FROM new_readers
GROUP BY date, source, country, continent
ORDER BY date) as new
LEFT JOIN
--Funnel Returning Users
(SELECT new_readers.date, new_readers.source, new_readers.country, new_readers.continent, count(distinct(returning_readers.user_id)) as returnin
FROM new_readers
JOIN returning_readers
ON new_readers.user_id=returning_readers.user_id
GROUP BY new_readers.date, new_readers.source, new_readers.country, new_readers.continent
ORDER BY new_readers.date) as returnin
ON new.date = returnin.date
   AND new.source = returnin.source
   AND new.country = returnin.country
   AND new.continent = returnin.continent
LEFT JOIN
--Funnel Subscribers
(SELECT new_readers.date, new_readers.source, new_readers.country, new_readers.continent, count(subscribers.user_id) as subscribers
FROM new_readers
JOIN subscribers
ON new_readers.user_id=subscribers.user_id
GROUP BY new_readers.date, new_readers.source, new_readers.country, new_readers.continent
ORDER BY new_readers.date) as subscribers
ON new.date = subscribers.date
   AND new.source = subscribers.source
   AND new.country = subscribers.country
   AND new.continent = subscribers.continent 
LEFT JOIN
--Funnel Customers
(SELECT new_readers.date, new_readers.source, new_readers.country, new_readers.continent, count(distinct(customers.user_id)) as customers
FROM new_readers
JOIN customers
ON new_readers.user_id=customers.user_id
GROUP BY new_readers.date, new_readers.source, new_readers.country, new_readers.continent
ORDER BY new_readers.date) as customers
ON new.date = customers.date
   AND new.source = customers.source
   AND new.country = customers.country
   AND new.continent = customers.continent;
   
   
--Finding microsegments that bring highest revenue:

SELECT new_readers.country,
       new_readers.source,
       new_readers.continent,
       SUM(customers.payment) AS revenue
FROM new_readers
  JOIN customers ON new_readers.user_id = customers.user_id
GROUP BY new_readers.country,
         new_readers.source,
         new_readers.continent
ORDER BY revenue DESC;

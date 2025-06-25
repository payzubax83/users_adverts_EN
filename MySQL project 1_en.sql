#Task #1
/*Create a new MySQL database users_adverts. Then create a table users in it (data is loaded into the table from the csv file
Users, make sure that the date column contains the correct data type). After creating the database and table, complete the following tasks:*/

CREATE DATABASE users_adverts;

USE users_adverts;

CREATE TABLE Users (
`date` DATE
, user_id CHAR(36)
, view_adverts INT
);

SELECT * 
FROM users;

#1.Write an SQL query that returns, as a single number, the number of unique users in this table between 2023-11-07 and 2023-11-15.
SELECT 
	COUNT(DISTINCT user_id) AS unique_users_count
FROM users
WHERE date BETWEEN '2023-11-07' AND '2023-11-15';

-- Result: The number of unique users in the period from 2023-11-07 to 2023-11-15 is 3199

#2.Identify the user who viewed the largest number of ads over the entire period.

SELECT 
	user_id
    , SUM(view_adverts) AS ads_viewed
FROM users
GROUP BY user_id
ORDER BY ads_viewed DESC
LIMIT 2;

/*Result: For the entire period, the largest number of ads were viewed by:
user_id: '3c2d27c0-4fd6-11eb-b89f-2ffb31b67dd6', ads_viewed: '354'
and user_id: '11f58880-8453-11ee-afb3-7bd5493ebb29', ads_viewed: '302' */

#3.	Determine the day with the highest average number of ad views per user, but only count days with more than 500 unique users.

SELECT date,
       COUNT(DISTINCT user_id) AS unique_users  -- Counting unique users per day
       , SUM(view_adverts) AS total_ad_views      -- We sum up all ad views per day.
       , SUM(view_adverts) / COUNT(DISTINCT user_id) AS avg_ad_views_per_user  -- We calculate the average number of views per person
FROM users                                       -- We take data from the users table.
GROUP BY `date`                                  -- We group the records by date to calculate statistics for each day separately
HAVING COUNT(DISTINCT user_id) > 500             -- Filter out days where there were > 500 users
ORDER BY avg_ad_views_per_user DESC              -- Sort days by average number of views from highest to lowest
LIMIT 1;                                         -- We display only one entry - the day with the maximum average

-- Result: Date:'2023-11-21', unique_users:'651', total_ad_views: '965', avg_ad_views_per_user: '1.4823'

/*4.Write a query that returns LT (the length of time a user has been on the site) for each user.
Sort LT in descending order.*/

SELECT user_id,
       MIN(date) AS first_visit  -- This is the first date of the user's visit.
       , MAX(date) AS last_visit   -- This is the last date of the user's visit.
       , TIMESTAMPDIFF(DAY, MIN(date), MAX(date)) AS LT_days  -- we calculate the difference in days between the first and last visit
       FROM users                 -- we take data from the users table.
GROUP BY user_id                  -- combine all visits of one user into one line
ORDER BY LT_days DESC;            -- sort from largest to smallest

-- Result: Returned 7639 rows, the duration of the user's stay on the site for each user, MAX is 29 days, MIN is 0 day

/*5. For each user, calculate the average number of ads viewed per day, and then find out who has the highest average 
among those who were active on at least 5 different days.*/

SELECT * 
FROM users;  -- First, let's check the table from where we will get the data for processing

SELECT 
	user_id
    , DATE(date) AS view_date
    , AVG(view_adverts) AS average_ads_per_day
FROM users
GROUP BY user_id 
		,view_date;

-- Result: Returned 16814 rows, 

SELECT 
	user_id
    , AVG(view_adverts) AS avg_ad_views  -- We calculate the average value from the view_adverts column for each group.
FROM users
GROUP BY user_id                   -- We group the data by user_id - we collect all views of each user together.
HAVING COUNT(DISTINCT date) >= 5   -- We check who had ≥ 5 different days of activity
ORDER BY avg_ad_views DESC         -- Sort by average views from highest to lowest
LIMIT 1;                           -- We take only one user with the highest score

-- Result: user_id: '11f58880-8453-11ee-afb3-7bd5493ebb29', avg_ad_views: '37.7500'


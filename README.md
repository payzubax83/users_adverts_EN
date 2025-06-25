# Users adverts data analysis (Data analysis using MySQL)
## Project Objective
Analysis of user activity and ad views. 

## Dataset used
- <a href="https://github.com/payzubax83/users_adverts_EN/blob/main/Users.csv">Dataset</a>

##  Questions (KPIs)
- Write a SQL query that returns, as a single number, the number of unique users in this table from 2023-11-07 to 2023-11-15
- Identify the user who viewed the most ads over the entire period
- Identify the day with the highest average number of ads viewed per user, but only count days with more than 500 unique users
- Write a query that returns the LT (the length of time the user has been on the site) for each user. Sort the LT in descending order
- For each user, calculate the average number of ads viewed per day, then find out who has the highest average among those who were active on at least 5 different days.

## Process
- Create a new MySQL database users_adverts. 
- Data cleaning via MS Excel using csv file”Users”. 
- Create a table users in it (data is loaded into(imported) the table from the csv file Users, make sure that the column date contains the correct data type). 
- After creating the database and table, complete the abovementioned queries one by one

## SQL script
- <a href="https://github.com/payzubax83/users_adverts_EN/blob/main/MySQL%20project%201_en.sql">SQL script</a>

## Project insight
- The number of unique users in the period from 2023-11-07 to 2023-11-15 is 3199
- For the entire period, the largest number of ads were viewed by: user_id: '3c2d27c0-4fd6-11eb-b89f-2ffb31b67dd6', ads_viewed: '354' and user_id: '11f58880-8453-11ee-afb3-7bd5493ebb29', ads_viewed: '302' ;
- Date:'2023-11-21', unique_users:'651', total_ad_views: '965', avg_ad_views_per_user: '1.4823'
- The duration of the user's stay on the site for each user, MAX is 29 days, MIN is 0 day, Returned 7639 rows,
- user_id: '11f58880-8453-11ee-afb3-7bd5493ebb29' who was active on at least 5 different days., avg_ad_views(average number of ads viewed per day): '37.7500'  

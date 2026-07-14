SELECT * FROM uber_dataset
/*Scenario: It is going to be a huge Saturday and there will need to be many more cars on the road than last week. In order to get drivers to go online, we're assessing the following two bonus options in terms of cost:

Option 1: $50 for each driver that is online at least 8 hours, accepts 90% of requests, completes 10 trips, and has a rating of 4.7 or better during the time frame;
Option 2: $4/trip for all drivers who complete 12 trips, and have a 4.7 or better rating.

Using the dataset provided and given Scenario 1, provide answers to the questions below:
*/

--How much would the total bonus payout be with Option 1?
SELECT COUNT(*) * 50  FROM uber_dataset
WHERE Trips_Completed >= 10 AND Acceptance_percentage >= 90 AND Supply_Hours >= 8 AND Rating >= 4.7

--How much would the total bonus payout be with Option 2?
SELECT SUM(trips_completed * 4) FROM uber_dataset
WHERE Trips_Completed >= 12 AND Rating >= 4.7

--How many drivers would qualify for a bonus under Option 1 but not under Option 2?
SELECT COUNT(*)  FROM uber_dataset
WHERE Trips_Completed >= 10 AND trips_Completed < 12 AND Acceptance_percentage >= 90 AND Supply_Hours >= 8 AND Rating >= 4.7

--What percentages of drivers online completed less than 10 trips, had an acceptance rate of less than 90%, and had a rating of 4.7 or higher?

SELECT ROUND((CAST((SELECT COUNT(*) FROM uber_dataset WHERE Trips_Completed < 10 AND Acceptance_percentage < 90 AND Rating >= 4.69)AS FLOAT) /CAST(COUNT(*) AS FLOAT)) * 100, 2) FROM uber_dataset 


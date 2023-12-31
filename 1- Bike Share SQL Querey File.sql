-- Merging data into one table
/* We can see that [Bike_Share_2022_Data] database contains 12 excel file (one file for each month), and we need to merge these tables 
   in one table so we executed these steps:  
	      1- we imported the file 202201 again and renamed it as '2022'.
		     (Now '2022' contains only the data for the first month).
		  2- INSERT INTO 2022
			 SELECT * FROM 202202; 
		     (Now 2022 contains the data for the first two months).
	      3- INSERT INTO 2022
             SELECT * FROM 202203 ;
             (Now 2022 contains the data for the first three months).
          ...
          ...
          ...
          12- INSERT INTO 2022
              SELECT * FROM 202212 ;
              (Now 2022 contains the data for all 2022 year).  
*/

--Showing total raw data
SELECT * FROM [dbo].[2022];


-- Cleaning data
/* We need to create a new table that contains only the data that we are going to use, and we will call it 'our_table'.
   1- We will add the columns (ride_id, rideable_type, start_station_name, end_station_name) to our_table.
   2- We noticed that the two columns (started_at, ended_at) are in a (datetime format), so we will make 3 columns from each one :
       * From the started at column we made : (1- started_date /date/ 2-started_time /time/ 3- started_hour /int/).
       * From the ended at column we made : (1- ended_date /date/ 2-ended_time /time/ 3- ended_hour /int/).
   3- We will make a new column called 'duration' contains the duration for every trip by minute.
   4- We will delete the rows that contains null values in the column (ride_id) because we can't benifit from it.
   5- We will delete the rows that contain 0 or negative values in the duration column.
*/
CREATE TABLE our_table
           (ride_id nvarchar(50), rideable_type nvarchar(50), start_station_name nvarchar(max), end_station_name nvarchar(max), started_date date,
		    ended_date date,started_time time, ended_time time, started_hour int, ended_hour int, duration int, membership nvarchar(50))   
INSERT INTO our_table
SELECT ride_id, rideable_type, start_station_name, end_station_name,
       CAST(started_at AS date), CAST(ended_at AS date),
       CAST(started_at AS time), CAST(ended_at AS time),
	   DATEPART(hour, started_at), DATEPART(hour, ended_at),
	   DATEDIFF(minute, started_at, ended_at) , member_casual
FROM [dbo].[2022]
WHERE (ride_id IS NOT NULL) AND (DATEDIFF(minute, started_at, ended_at)>0)

-- Showing our data that we are going to use
SELECT TOP 20 * FROM our_table;

          
-- Showing the NULL values percentage in the columns (start_station_name - end_station_name)
SELECT count(*) AS number_of_null_values_in_start_station_name_or_end_station_name_fields FROM our_table
WHERE (start_station_name IS NULL) OR (end_station_name IS NULL)
SELECT count(*) AS number_of_null_values_in_start_station_name_and_end_station_name_fields FROM our_table
WHERE (start_station_name IS NULL) AND (end_station_name IS NULL)

/* We can see that there are 1271642 trip without start_station_name or end_station_name (about 22.7%),
   and 410201 trip without the both (about 7.3%), which is a huge number.
*/

-- Showing (start_station_name + end_station_name) with the higher number of trips for casuals (top 15).
SELECT TOP 15 start_station_name , end_station_name, count(*) AS number_of_trips FROM our_table
WHERE (start_station_name IS NOT NULL) AND (end_station_name IS NOT NULL) and membership = 'casual'
GROUP BY start_station_name, end_station_name
ORDER BY number_of_trips DESC;
/* If we deleted the null values, We can see that the trip (From 'Streeter Dr & Grand Ave'  to  'Streeter Dr & Grand Ave')
   is the most frequent journey made by casuals and by a large margin than the rest. 
*/
-- Showing (start_station_name + end_station_name) with the higher number of trips for members (top 15).
SELECT TOP 15 start_station_name , end_station_name, count(*) AS number_of_trips FROM our_table
WHERE (start_station_name IS NOT NULL) AND (end_station_name IS NOT NULL) and membership = 'member'
GROUP BY start_station_name, end_station_name
ORDER BY number_of_trips DESC;
/* If we deleted null values, we can see that the trips: 1- From 'Ellis Ave & 60th St'  To  'University Ave & 57th St'.
                                                         2- From 'University Ave & 57th St'  To  'Ellis Ave & 60th St'.
						                            	 3- From 'Ellis Ave & 60th St'  To  'Ellis Ave & 55th St'.
						                            	 4- From 'Ellis Ave & 55th St'  To  'Ellis Ave & 60th St'.
   are the most frequent trips made by members.
*/


-- Total numbers for casuals vs members
SELECT membership ,  count(*) AS Total_trips, AVG(duration) AS average_trip_duration FROM our_table
GROUP BY membership
ORDER BY membership
/* We can see that member trips (3302300 trip) are more than casual trips(2294108 trip),
   but the average duration of the casual trip (29 minute) is more than the the average duration of the member trip which is (12 minute)
*/

-- Showing how the number of trips changes over the months of the year
-- 1- for casuals:
SELECT membership as casuals, EOMONTH(started_date) AS month, count(*) AS Total_trips_for_this_month FROM our_table
WHERE membership = 'casual'
GROUP BY EOMONTH(started_date), membership
ORDER BY EOMONTH(started_date)
-- 2- for members:
SELECT membership as members, EOMONTH(started_date) AS month, count(*) AS Total_trips_for_this_month FROM our_table
WHERE membership = 'member'
GROUP BY EOMONTH(started_date), membership
ORDER BY EOMONTH(started_date)

-- Showing the number of trips at every hour of the day for casuals and members
SELECT started_hour, COUNT(*) AS number_of_casual_trips_in_each_hour FROM our_table
WHERE membership = 'casual'
GROUP BY started_hour
ORDER BY started_hour;
SELECT started_hour, COUNT(*) AS number_of_member_trips_in_each_hour FROM our_table
WHERE membership = 'member'
GROUP BY started_hour
ORDER BY started_hour;
/* We notice the number of trips of members and casuals starts to increase from about 7 am and continues to increase until 5 pm, which is normal,
   and then the number of their trips begins to decline.
   However, we note that there is a noticeable increase in the number of members' trips between seven and eight in the morning, 
   which indicates that a large percentage of members are students or employees who have a fixed time.
*/
                  
-- Showing the statics for every bike type for casuals and members
SELECT rideable_type, COUNT(*) AS number_of_trips FROM our_table
WHERE membership = 'casual'
GROUP BY rideable_type;
SELECT rideable_type, COUNT(*) AS number_of_trips FROM our_table
WHERE membership = 'member'
GROUP BY rideable_type;
/* We note that the members use the classic bikes in the first place (which is a good indicator because it is more healthy),
   especially since the average trips of the members are few and most of the students and employees live next to their work 
   and therefore there will be no fatigue on the trip), followed by a slight difference in the e-bikes,
   but no case of using docked bikes was mentioned by the members, and the reason, as mentioned earlier, is that the members are
   mostly students and employees, which means that they cannot return the bike to dock it in the same place from which they took it.
   As for casuals, we note that there is a use of all types of bicycles, primarily e-bikes (the reason may be that the average casual trips are
   long and therefore trips by e-bikes are easier).
*/



                    /* Please visit: https://public.tableau.com/app/profile/haidar.abdo/viz/Bike_Share_2022_Portfolio_Project/Story1#1
                                 to see the tableau story we created from the results of the above queries.*/





<img src="https://th.bing.com/th/id/R.1f0550eb7e1693cbd9f622c6cb7f8c07?rik=zGahXwvmZa%2bZxg&pid=ImgRaw&r=0" width="100%" alt="Superstore cast">

# **Bike Share Portfolio project**

## **Introduction**
### This project is a case study for a bike rental company in the United States of America that includes a study of the differences between members and regular users (their number of trips - the times of increase and decrease in the number of these trips during the months of the year and also during the hours of the day - the preferred types of bikes for each of them - the stations they frequent most ).
### Finally, presenting the conclusions we drew from this study and advice to stakeholders to help management increase the number of members compared to regular users.

## **Some of the questions to answer will be:**
### How many trips are taken by members and casuals, and what is the average trip duration for each?
### What are the months in which there is an increase in the number of trips for members and casuals?
### What are the hours of the day when there is an increase in the number of trips for members and casuals?
### What are the members' and casuals' favorite types of bikes, and why?
### What are the most frequented stations by members and casuals?

## **Data Source:**
### The dataset to be used is from: **Google Data Analytics Certificate.**
### Performance Data Quality & Timeliness:
### This dataset contains data points that includes information about every single trip in 2022 such as start and end station name, rideable type, start datetime, end datetime and membership.
### Shwoing our raw data in SQL, after merging 12 months tables into one table called "2022":
###
![1- Showing our raw data](https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/assets/139217562/3a64265f-b366-4a9e-b626-26f72e967ce7)
###
![2- Showing our raw data](https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/assets/139217562/18017808-b917-4bc5-a734-1ac04bdc4262)
###
###
### We are going to build "our_table" form our raw data:
### We need to create a new table that contains only the data that we are going to use, and we will call it 'our_table'.
###    1- We will add the columns (ride_id, rideable_type, start_station_name, end_station_name) to our_table.
###    2- We noticed that the two columns (started_at, ended_at) are in a (datetime format), so we will make 3 columns from each one :
###        * From the started at column we made : (1- started_date /date/ 2-started_time /time/ 3- started_hour /int/).
###       * From the ended at column we made : (1- ended_date /date/ 2-ended_time /time/ 3- ended_hour /int/).
###    3- We will make a new column called 'duration' contains the duration for every trip by minute.
###    4- We will delete the rows that contains null values in the column (ride_id) because we can't benifit from it.
###    5- We will delete the rows that contain 0 or negative values in the duration column.
###
![3- adding data into our table](https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/assets/139217562/70a94fed-56b7-4ddd-a588-02d833b0b832)
###
###
## Data Exploration
### Showing total numbers for casuals vs members in SQL and Tableau:
![6- total numbers for casuals vs members](https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/assets/139217562/9db52714-75c4-438c-aa93-627001a7af7b)
###
![6- total numbers for casuals vs members in tableau](https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/assets/139217562/53bc38ea-8385-4b8d-83d2-2c70c43eded3)
### We can see that member trips (3302300 trip) are more than casual trips(2294108 trip),but the average duration of the casual trip (29 minute) is more than the the average duration of the member trip which is (12 minute).
###
###
### Showing the number of NULL values in the columns (start_station_name - end_station_name) in SQL and Tableau:
![4- Showing the number of null values in station names](https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/assets/139217562/26a8458f-0cf4-420c-949c-772c8e6ae3f3)
###
![4- Showing the number of null values in station names in tabelau](https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/assets/139217562/889f70f6-9ad5-41d3-8faa-d84d28fb7603)
### We can see that there are 1271642 trip without start_station_name or end_station_name (about 22.7%), and 410201 trip without the both (about 7.3%), which is a huge number.
###
###
### Showing (start_station_name + end_station_name) with the higher number of trips for casuals (top 15) in SQL and Tableau:
![5- Showing the top stations for casuals](https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/assets/139217562/c1704d95-db86-4adc-bf6a-a4e069d7931e)
###
![5- Showing the top stations for casuals in tableau](https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/assets/139217562/3aae8236-6be3-49cd-959d-a50dcad12898)
### If we deleted the null values, We can see that the trip (From 'Streeter Dr & Grand Ave'  to  'Streeter Dr & Grand Ave') is the most frequent journey made by casuals and by a large margin than the rest. 
###
###
### Showing how the number of trips changes over the months of the year for casuals and members in SQL and Tableau:









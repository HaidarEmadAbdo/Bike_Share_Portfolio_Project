<img src="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/bykeshare%20project%20image.jpg" width="100%" alt="Bike Share cast">

# **Bike Share Portfolio project**

## **Introduction**
### this project is a case study for a bike rental company in the united states of america that includes a study of the differences between members and regular users, their number of trips, the times of increase and decrease in the number of these trips during the months of the year and also during the hours of the day, the preferred types of bikes for each of them and the stations they frequent most.
### finally presenting the conclusions we drew from this study and advice to stakeholders to help management increase the number of members compared to regular users. 

## **Some of the questions to answer will be:**
### how many trips are taken by members and casuals and what is the average trip duration for each?
### what are the months in which there is an increase in the number of trips for members and casuals?
### what are the hours of the day when there is an increase in the number of trips for members and casuals?
### what are the members and casuals favorite types of bikes and why?
### what are the most frequented stations by members and casuals?

## **Data Source:**
### The dataset to be used is from (Google Data Analytics Certificate).
### Performance Data Quality & Timeliness: 
### This dataset contains data points that includes information about every single trip in 2022 such as start and end station name, rideable type, start datetime, end datetime and membership.
### Shwoing our raw data in SQL, after merging 12 months tables into one table called "2022":
###
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/1-%20Showing%20our%20raw%20data.png" width="100%" alt="Showing our row data 1">

<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/2-%20Showing%20our%20raw%20data.png" width="100%" alt="Showing our row data 2">

###
###
## **We are going to build "our_table" form our raw data:**
### We need to create a new table that contains only the data that we are going to use, and we will call it 'our_table'.
### 1- We will add the columns (ride_id, rideable_type, start_station_name, end_station_name) to our_table.
### 2- We noticed that the two columns (started_at, ended_at) are in a (datetime format), so we will make 3 columns from each one :
###    *From the started_at column we made : (1- started_date /date/ 2-started_time /time/ 3- started_hour /int/).
###    *From the ended_at column we made : (1- ended_date /date/ 2-ended_time /time/ 3- ended_hour /int/).
### 3- We will make a new column called 'duration' contains the duration for every trip by minute.
### 4- We will delete the rows that contains null values in the column (ride_id) because we can't benifit from them.
### 5- We will delete the rows that contain 0 or negative values in the duration column.
###
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/3-%20adding%20data%20into%20our%20table.png" width="100%" alt="Showing our row data 2">

## Data Exploration
###
###
## **Showing the NULL values percentage in the columns (start_station_name - end_station_name) in SQL and Tableau:**
###
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/4-%20Showing%20the%20number%20of%20null%20values%20in%20station%20names.png" width="100%" alt="Showing our row data 2">
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/4-%20Showing%20the%20number%20of%20null%20values%20in%20station%20names%20in%20tabelau.png" width="100%" alt="Showing our row data 2">

### We can see that there are 1,271,642 trip without start_station_name or end_station_name (about 22.7%), and 410,201 trip without the both (about 7.3%), which is a huge number.
###
###
## **Showing (start_station_name + end_station_name) with the higher number of trips for casuals in SQL and Tableau:**
###
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/5-%20Showing%20the%20top%20stations%20for%20casuals.png" width="100%" alt="Showing our row data 2">
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/5-%20Showing%20the%20top%20stations%20for%20casuals%20in%20tableau.png" alt="Showing our row data 2">

### If we deleted the null values, We can see that the trip (From 'Streeter Dr & Grand Ave'  to  'Streeter Dr & Grand Ave') is the most frequent journey made by casuals and by a large margin than the rest. 
###
###
## **Showing the total number for casual vs members in SQL and Tableau:**
###
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/6-%20total%20numbers%20for%20casuals%20vs%20members.png" width="100%" alt="Showing our row data 2">
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/6-%20total%20numbers%20for%20casuals%20vs%20members%20in%20tableau.png" alt="Showing our row data 2">

### We can see that member trips (3302300 trip) which represents 60% of the total trips are more than casual trips(2294108 trip) which represents 40% of the total , but the average duration of the casual trip (29 minute) is more than the the average duration of the member trip which is (12 minute).
### We do not have information about the per-minute cost of the member's trip and the casual trip, but 	we know that members always have discounts and therefore the per-minute cost of the member’s 		trip will definitely be less than the per-minute cost of the casual trip or at least equal to it, and if we 	do a quick calculation, we will see that the profits that come from the casuals are more than the 	profits that come from the 	members.
###
###
## **Showing how the number of trips changes over the months of the year for members and casuals in SQL and Tableau:**
###
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/7-%20showing%20the%20number%20of%20trips%20over%20months.png" width="100%" alt="Showing our row data 2">
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/7-%20showing%20the%20number%20of%20trips%20over%20months.%20in%20tableaupng.png" width="100%" alt="Showing our row data 2">

## **Showing the number of trips at every hour of the day for casuals and members in SQL and Tableau:**
###
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/8-%20showing%20the%20number%20of%20trips%20over%20hour%20of%20day.png" width="100%" alt="Showing our row data 2">
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/8-%20showing%20the%20number%20of%20trips%20over%20hour%20of%20day%20in%20tableau.png" width="100%" alt="Showing our row data 2">

### We note that the number of trips increases in the summer months for both members and casuals, which is normal, with preference for members in all months of the year except July, which is the height of summer when most people go on vacation trips. 
### We also notice that the number of trips of members and casuals starts to increase from about 7 am and continues to increase until 5 pm, which is normal, and then the number of their trips begins to decline.
### However, we note that there is a noticeable increase in the number of members' trips between seven and eight in the morning, which indicates that a large percentage of members are students or employees who have a fixed time.
###
###
## **Showing the statics for every bike type for casuals and members in SQL and Tableau:**
###
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/9-%20showing%20the%20rides%20typer%20for%20members%20and%20casuals.png" width="100%" alt="Showing our row data 2">
<img src ="https://github.com/HaidarEmadAbdo/Bike_Share_Portfolio_Project/blob/main/4-%20images%20for%20readme%20file/9-%20showing%20the%20rides%20typer%20for%20members%20and%20casuals%20in%20tableau.png" width="100%" alt="Showing our row data 2">

### We note that the members use the classic bikes in the first place (which is a good indicator because it is more healthy), especially since the average trips of the members are few and most of the students and employees live next to their work and therefore there will be no fatigue on the trip), followed by a slight difference in the e-bikes, but no case of using docked bikes was mentioned by the members, and the reason, as mentioned earlier, is that the members are mostly students and employees, which means that they cannot return the bike to dock it in the same place from which they took it.
### As for casuals, we note that there is a use of all types of bicycles, primarily e-bikes (the reason may be that the average casual trips are long and therefore trips by e-bikes are easier).
###
###
## Recommendations
### The main objective of our analysis is to know how to increase the number of members compared to casuals, but the management must be informed that the profits that come from casuals are more than the profits that come from members, and therefore the large number of casuals does not negatively affect the profits of the company.
### The administration should also be informed that there is a large amount of missing data in the names of the stations, and there is a percentage of 7.3% of the trips that do not know where they started from and where they ended. 
### Therefore, those responsible for collecting data must be informed to address this problem, and that the data be comprehensive.
### We now return to our main goal of how to increase the number of members compared to casuals, the administration must be informed to inform the discounts department so that they provide large discounts on membership to entice casuals to become members even if these discounts are temporary (e.g. in July) because there are a large number of casual trips at this time of year, and it must posting advertisements for these discounts in all stations, in addition to allocating the station "Streeter Dr & Grand Ave" with a larger amount of advertisements than others, because there is a large section of casuals who visit this station more frequently than other stations.
###
###
## Data Visualization
### Please visit: https://public.tableau.com/app/profile/haidar.abdo/viz/Bike_Share_2022_Portfolio_Project/Story1    
### to see the full Tableau story with the conclusions and recommendations using interactive dashboards.










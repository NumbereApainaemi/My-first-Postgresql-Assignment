-- 1. The Average number of trips on Saturday

select  "Week_Days", count("Avg_Trip_Distance") as "Avg_Trips"
from
(select avg("trip_distance") as "Avg_Trip_Distance", "tpep_dropoff_datetime", "Week_Days"
from
(select "trip_distance", "tpep_dropoff_datetime", to_char(tpep_dropoff_datetime, 'Day') as "Week_Days"
from "Yellow Cab") as "tab1"
group by "tpep_dropoff_datetime", "Week_Days"
order by "Avg_Trip_Distance" desc) as tab2
where "Week_Days" like 'Satur%'
group by "Week_Days";

-- 2. The Average fare(fare_amount) per trip on Saturdays
select avg("fare_amount") as "Avg_Fare_Amount", "Week_Days"
from
(select "fare_amount", to_char(tpep_dropoff_datetime, 'Day') as "Week_Days"
from "Yellow Cab") as tb3
where "Week_Days" like 'Satur%'
group by "Week_Days"
order by "Avg_Fare_Amount";

-- 3. The Average duration per trip on Saturday

select avg("Duration") as "Avg_Duration", "Week_Days"
from
(select "VendorID", "trip_distance", extract(minute from "time_diff") as "Duration", "Week_Days"
from
(select  "VendorID", "trip_distance", "time_diff", to_char(tpep_dropoff_datetime, 'Day') as "Week_Days"
from
(select "VendorID", "trip_distance", "tpep_dropoff_datetime", (tpep_dropoff_datetime - tpep_pickup_datetime) as time_diff
from "Yellow Cab") as tb4) as tb5
where "Week_Days" like 'Satu%') as tb6
group by 2
order by 1;

-- 4. Average number of trips on Sundays
select  "Week_Days", count("Avg_Trip_Distance") as "Avg_Trips"
from
(select avg("trip_distance") as "Avg_Trip_Distance", "tpep_dropoff_datetime", "Week_Days"
from
(select "trip_distance", "tpep_dropoff_datetime", to_char(tpep_dropoff_datetime, 'Day') as "Week_Days"
from "Yellow Cab") as "tb7"
group by "tpep_dropoff_datetime", "Week_Days"
order by "Avg_Trip_Distance" desc) as tb8
where "Week_Days" like 'Sun%'
group by "Week_Days";



-- 5. The Average fare(fare_amount) per trip on Sundays
select avg("fare_amount") as "Avg_Fare_Amount", "Week_Days"
from
(select "fare_amount", to_char(tpep_dropoff_datetime, 'Day') as "Week_Days"
from "Yellow Cab") as tb7
where "Week_Days" like 'Sun%'
group by 2
order by 1;


-- 6. The Average duration per trip on Sunday

select avg("Duration") as "Avg_Duration", "Week_Days"
from
(select "VendorID", "trip_distance", extract(minute from "time_diff") as "Duration", "Week_Days"
from
(select  "VendorID", "trip_distance", "time_diff", to_char(tpep_dropoff_datetime, 'Day') as "Week_Days"
from
(select "VendorID", "trip_distance", "tpep_dropoff_datetime", (tpep_dropoff_datetime - tpep_pickup_datetime) as time_diff
from "Yellow Cab") as tb8) as tb9
where "Week_Days" like 'Sun%') as tb10
group by 2
order by 1;

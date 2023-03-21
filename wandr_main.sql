-- Generate a list of hotels based on location.
SELECT 
	hotel_name, 
    location
FROM hotels
GROUP BY location;

-- Which hotels could the travelers included in this dataset have stayed at?
SELECT 
	hotel_name, 
	destination 
FROM traveler_trips
JOIN hotels ON hotels.location = traveler_trips.destination
GROUP BY traveler_trips.destination;

-- Which locations do not have hotels featured on the 2022 World's Best Hotel list?
SELECT 
	destination 
FROM traveler_trips
LEFT JOIN hotels ON hotels.location = traveler_trips.destination
WHERE
   hotels.hotel_name IS NULL;

-- People from what nationalities tend to take the longest vacations? 
SELECT
	traveler_nationality,
    AVG(duration) as avg_trip_duration
FROM traveler_trips
GROUP BY traveler_nationality
ORDER BY avg_trip_duration DESC
LIMIT 1;

-- Which destination is the most popular with American travelers included in this dataset?
SELECT 
	traveler_name,
    destination,
    traveler_nationality,
    COUNT(destination) OVER(PARTITION BY destination) as num_trips
FROM traveler_trips
WHERE traveler_nationality = 'American'
ORDER BY num_trips DESC;

-- Which destination is the most popular with women included in this dataset?
SELECT 
	traveler_name,
    destination,
    COUNT(destination) OVER(PARTITION BY destination) as num_trips
FROM traveler_trips
WHERE traveler_gender = 'Female'
ORDER BY num_trips DESC;

-- How many travelers whose name starts with the letter 'M' stayed in each accomodation type? 
SELECT
	traveler_name,
    destination,
    accomodation_type,
    COUNT(accomodation_type) OVER(PARTITION BY accomodation_type)
FROM traveler_trips
WHERE traveler_name LIKE 'M%';

-- Who had the longest stay? Which top hotel could that person have stayed at?
-- PART 1
SELECT 
	traveler_name,
    destination,
    duration
FROM traveler_trips
ORDER BY duration DESC
LIMIT 1;
-- PART 2
SELECT 
	location,
    hotel_name,
    company_name
FROM hotels
WHERE hotels.location = 'New York';

-- Rank destinations from most expensive to cheapest average trip cost. What was the total amount spent on trips to each destination?
SELECT
    destination,
    AVG(accomodation_cost + transportation_cost) AS avg_cost,
    COUNT(*) AS trip_count,
    SUM(accomodation_cost + transportation_cost) AS total_cost
FROM traveler_trips
GROUP BY destination
ORDER BY AVG(accomodation_cost + transportation_cost) DESC;
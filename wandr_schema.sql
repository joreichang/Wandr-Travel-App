CREATE DATABASE wandr;

CREATE SCHEMA data;
USE data;

CREATE TABLE traveler_trips (
	trip_id INT NOT NULL PRIMARY KEY,
    destination VARCHAR(50) NOT NULL,
    start_date DATETIME,
    end_date DATETIME,
    duration INT,
    traveler_name VARCHAR(50),
    traveler_age INT,
    traveler_gender VARCHAR(50),
    traveler_nationality VARCHAR(50),
    accomodation_type VARCHAR(50),
    accomodation_cost INT,
    transportation_type VARCHAR(50),
    transportation_cost INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\travel details dataset.csv'
INTO TABLE traveler_trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE hotels (
  id INT PRIMARY KEY AUTO_INCREMENT,
  hotel_name VARCHAR(100) NOT NULL,
  location VARCHAR(100),
  country VARCHAR(100),
  region VARCHAR(100),
  company_name VARCHAR(100),
  score DECIMAL(10,2),
  ranking INT,
  num_rooms INT,
  theme VARCHAR(50),
  year_opened INT,
  listed_2021 INT,
  past_ranking INT
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\hotel_100_2022.csv'
INTO TABLE hotels
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW TABLES


    
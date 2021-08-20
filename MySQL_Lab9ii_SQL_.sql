use sakila;

# find count of distinct actor' last names.
SELECT count(distinct(last_name)) as 'Distinct Last Names(count)' from sakila.actor;

# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, CASE 
WHEN DAYNAME(rental_date) IN ('Saturday', 'Sunday') THEN 'Weekend'
ELSE 'Weekday' 
END AS 'Day_Type'
FROM sakila.rental;

# Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film WHERE film.title LIKE '%ARMAGEDDON%';

# Get the 10 longest films.
SELECT * FROM sakila.film ORDER BY `length` DESC LIMIT 10;

# How many films include Behind the Scenes content?
SELECT COUNT(*) FROM sakila.film WHERE film.special_features LIKE "Behind the Scenes";

# Which kind of movies (rating) have a mean duration of more than two hours?
SELECT film.rating, round(AVG(film.`length`),2) AS 'Average duration' FROM sakila.film GROUP BY rating;

# Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT film.title, film.`length`, rank() over(order by film.`length` desc) AS 'rank' FROM sakila.film WHERE film.`length` IS NOT null OR film.`length` <> 0 ;



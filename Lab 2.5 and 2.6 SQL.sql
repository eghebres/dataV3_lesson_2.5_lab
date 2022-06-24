use sakila;
# 2.5 Lesson 
# 1 Select all actors with the first name Scarlett
SELECT * FROM actor;
SELECT * FROM actor WHERE first_name='Scarlett';

# 2 How many movies are available for rent, which are rented out
SELECT count(rental_date) FROM rental;
SELECT * FROM rental;

#3 shortest/longest movie duration
SELECT MAX(length) AS 'max(duration)'
FROM film;
SELECT MIN(length) AS 'min(duration)'
FROM film;

# 4 min/max movie duration in format(hrs, min)
# min(duration) of 46 in time format
SELECT SEC_TO_TIME(46);
# max(duration) of 185 in time format
SELECT SEC_TO_TIME(185);

# 5 average movie duration in format(hrs, min)
SELECT AVG (length) FROM film;
# average duration=115.2720 in format
SELECT SEC_TO_TIME(115.2720);

# all films that have ARMAGEDDON in the title
SELECT title FROM film WHERE title LIKE ('%ARMAGEDDON%');

# 10 longest films
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

# film titles that end with APOLLO
SELECT title FROM sakila.film WHERE title LIKE '%APOLLO';

#SELECT title FROM film
#WHERE instr(title, 'ARMAGEDDON') > 0;
# 9 release years

# release years
SELECT DISTINCT(release_year), title FROM film;

# 2.6
# actors whose last names are not repeated
SELECT last_name FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;

# which last names appear more than once
SELECT last_name, count(*) FROM sakila.actor
GROUP BY last_name
HAVING count(*) > 1;

SELECT staff_id, count(num_rentals);

# how many films were released each year
SELECT release_year, COUNT(*) AS num_films FROM sakila.film;

# for each rating how many films were there
SELECT rating, count(*) AS num_films FROM sakila.film
GROUP BY rating;

# what movies have mean duration of more than 2hrs (=120)
SELECT rating, ROUND/(AVG(length),2) AS avg_duration FROM sakila.film
GROUP BY rating 
HAVING avg_duration > 120
ORDER BY avg_duration ASC;

# rank films by length, only select title, length
SELECT title, length
from film
WHERE length != 0 AND length IS NOT NULL
ORDER BY length DESC;

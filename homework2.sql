-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT first_name, last_name, postal_code FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE postal_codev> 73301 AND postal_code < 88595
--Not sure how to get this to work properly--

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT amount, first_name, last_name FROM payment
LEFT JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

--Answer = 27 different results from 5 different customers. Douglas Graf, Mary Smith, alfredo Mcadams, Peter Menard, and Alvin Deloach--

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

--Answer = Mary Smith and Peter Menard. --

-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT first_name, last_name, city FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
WHERE city = 'Nepal';
SELECT city FROM city 
--NEPAL is not in the database --

-- 5. Which staff member had the most
-- transactions?

SELECT first_name, last_name, sum(amount) FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY first_name, last_name

--Answer = Mike Hillyer and Jon Stephens--

-- 6. How many movies of each rating are
-- there?

SELECT COUNT(film.rating) AS rating_count, film.rating
FROM film
INNER JOIN inventory ON film.film_id = inventory.film_id
GROUP BY film.rating;

--answer = NC-17 =940, G = 791, PG-13 = 1018, PG = 924, R = 908--

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
);


--Answer = Mary Smith, Peter Menard, Douglar Graf, Alvin Deloach, and Alfredo Mcadams--

--8 How many free rentals did our store give away?

SELECT rental_id, amount FROM payment
WHERE amount = 0 OR amount = null;

--Answer = none, negative values in the table but no free or null values for rentals--
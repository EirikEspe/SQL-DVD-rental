---- Select all table data from address ----
SELECT *
FROM address;

---- View the names of all clients ----
SELECT first_name, last_name
FROM customer;

---- How many clients do we have ----
SELECT COUNT (DISTINCT customer_id)
FROM customer;

----  What is their first and last name ----
SELECT DISTINCT first_name, last_name
FROM customer;

---- List all of the employees and their names ----
SELECT staff_id, first_name, last_name
FROM staff

---- Which days did client number 117 rent a DVD ----
SELECT rental_date, customer_id
FROM rental
WHERE customer_id = 117;


---- How much did customer 5 pay on average? ----
----	Use ROUND() to round the number ----
SELECT ROUND(AVG(amount), 2) AS "Rounded Avg."
FROM payment
WHERE customer_id = 5;

---- How many days did customer 117 rent a DVD ----
SELECT age(return_date, rental_date) AS "Days",
	    rental_date, return_date
FROM rental
WHERE customer_id=117;

---- Sum of days customer 117 rented a DVD ----
SELECT SUM(age(return_date, rental_date)) AS "Total days"
FROM rental
WHERE customer_id=117;

---- First 5 films from the film table ----
SELECT title
FROM film
LIMIT 5;

---- First five films ordered by release year ----
----				from old to new 									----
SELECT title, release_year
FROM film
ORDER BY release_year
LIMIT 5;

---- Rounded average amount of payment from ----
----		customer ID between 5 and 10 				----
SELECT ROUND(AVG(amount), 2) AS "Avg. payment"
FROM payment
WHERE customer_id BETWEEN 5 AND 10

---- Information about customers except ----
----				customer 1 and 2 						----
SELECT *
FROM customer
WHERE customer_id NOT IN(1, 2)

---- Number of titles from film where title ----
----					starts	with J								----
SELECT COUNT (DISTINCT title) AS "Number of titles J.."
FROM film
WHERE title LIKE 'J%'

---- Number of titles from film where title ----
----				does not start	with J					----
SELECT COUNT (DISTINCT title) AS "Number of titles other"
FROM film
WHERE title NOT LIKE 'J%'

---- Find the 10 clients that rented most times ----
SELECT customer_id, COUNT(rental_id) AS "# of rentals"
FROM rental
GROUP BY customer_id
ORDER BY "# of rentals" DESC
LIMIT 10;

---- Who are the clients that rent most DVDs ----
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (148, 526, 236, 144, 75,
					  197, 469, 468, 137, 178);

---- Which rating groups have an average ----
---- rental duration of more than 5 days ----
SELECT rating, rental_duration
FROM film
GROUP BY rating, rental_duration
HAVING AVG(rental_duration) > 5
ORDER BY rental_duration DESC;


---- Create a database in which you have the name ----
---- 	and surname of each person, their email, 		----
---- 	their address and the total cost of rentals ----
SELECT customer.customer_id, customer.first_name,
customer.last_name, customer.email, customer.address_id,
payment.customer_id, SUM(payment.amount) AS
"Total cost of rentals"
FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, payment.customer_id;
----- hhh-----

---- How many copies are there of each film in ----
----							store 1 										 ----
SELECT store.store_id, inventory.film_id, film.title,
COUNT(inventory.film_id) AS "Copies"
FROM store
LEFT JOIN inventory ON store.store_id = inventory.store_id
LEFT JOIN film ON inventory.film_id = film.film_id
GROUP BY inventory.film_id, store.store_id, film.title
HAVING store.store_id = 1
ORDER BY inventory.film_id;



---- 						Subqueries							----


---- What are the names of customers who have made ----
----			more than 40 payments										 ----
SELECT customer.customer_id, customer.first_name,
customer.last_name
FROM customer
WHERE customer.customer_id IN(
	SELECT payment.customer_id
	FROM payment
	GROUP BY payment.customer_id
	HAVING COUNT(payment.payment_id) >= 40
	ORDER BY payment.customer_id
);

---- Customer ID and number of payments ----
----	for customers that have made more ----
----		than 40 payments								----
SELECT payment.customer_id, COUNT(payment.payment_id) AS "# of payments"
FROM payment
GROUP BY payment.customer_id
HAVING COUNT(payment.payment_id) >= 40
ORDER BY payment.customer_id

---- List of films rented the first 15 days ----
---- 						of July 2005								----
SELECT inventory.film_id
FROM inventory
WHERE inventory.inventory_id IN (

	SELECT rental.inventory_id
	FROM rental
	WHERE rental.rental_date BETWEEN '2005-07-01'
								AND '2005-07-15'
);


---- Same query using LEFT JOIN and adding rental date ----
SELECT inventory.film_id, rental.rental_date
FROM inventory
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.rental_date BETWEEN '2005-07-01'
							  AND '2005-07-15'

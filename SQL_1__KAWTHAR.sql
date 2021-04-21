--1. Do we have actors in the actor table that share the full name and 
--if yes display those shared names.
SELECT * from actor;
SELECT COUNT(DISTINCT first_name || last_name) FROM actor;
--yes, one name is shared

SELECT first_name, last_name, COUNT(*) FROM actor
GROUP BY first_name, last_name
HAVING COUNT(*)>1;
-- Susan Davies is repeated twice 

--2. Return the customer IDs of customers who have spent at least $110 
--with the staff member who has an ID of 2.
SELECT * FROM payment;
SELECT SUM(amount), customer_id FROM payment 
WHERE staff_id =2 GROUP BY customer_id HAVING SUM (amount)>= 110;
-- The IDs are 187 and 148

--3.How many films begin with the letter J?
SELECT * from film;
SELECT title FROM film
WHERE title ILIKE 'J%';
-- 20 films

--4. What customer has the highest customer ID number whose name 
--starts with an 'E' and has an address ID lower than 500?
SELECT * FROM customer;
SELECT customer_id, first_name, last_name, address_id FROM customer
WHERE customer_id = (SELECT MAX (customer_id)FROM customer
					 WHERE customer_id<500 AND first_name ILIKE 'e%');
--Eddie Tomlin

--5. How many films have the word Truman somewhere in the title?
SELECT title FROM film
WHERE title ILIKE '%Truman%';
--5 films 

--6. Display the total amount payed by all customers in the payment table.
SELECT SUM(amount) FROM payment;
--The sum is 61312.04

--7. Display the total amount payed by each customer in the payment table.
SELECT SUM(amount) AS Total_payment,customer_id FROM payment
GROUP BY customer_id ORDER BY customer_id;
--Returns the details of 599 customers and the total amount paid by them, ordered 
--by the customer id's in ascending order.

--8. What is the highest total_payment done?
SELECT SUM(amount) AS Total_payment,customer_id FROM payment
GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 1;
--211.55 by customer_id 148

--9. Which customers have not rented any movies so far?
SELECT DISTINCT(customer_id) FROM customer
WHERE customer_id NOT IN
(SELECT DISTINCT(customer_id) FROM rental);
--No such customers

--10. How many payment transactions were greater than $5.00?
SELECT COUNT(amount)
FROM payment
WHERE amount > 5;
--3618
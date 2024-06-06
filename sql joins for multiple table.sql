-- 1.Write a query to display for each store its store ID, city, and country.
select* from store;
select* from address;
select* from city;
select* from country;
SELECT s.store_id, ci.city, co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
ORDER BY s.store_id;


 -- 2.Write a query to display how much business, in dollars, each store brought in.
 SELECT s.store_id, SUM(p.amount) AS total_sales
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id
ORDER BY s.store_id;

-- 3.What is the average running time of films by category?
SELECT c.name AS category, AVG(f.length) AS average_running_time
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY average_running_time DESC;

-- 4.Which film categories are longest?
select * from film;
select * from category;
SELECT c.name AS category, MAX(f.length) AS longest_film_length
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY longest_film_length DESC;
 
-- 5.Display the most frequently rented movies in descending order.
select * from rental;
select * from inventory;
select* from film;

SELECT f.title AS film_title, COUNT(i.film_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY rental_count DESC;

-- 6.List the top five genres in gross revenue in descending order.
select * from category;
select * from payment;
select * from inventory;
select * from film;

SELECT c.name AS genre, SUM(p.amount) AS gross_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY gross_revenue DESC
LIMIT 5;

-- 7.Is "Academy Dinosaur" available for rent from Store 1?
select * from store;
select * from inventory;
select * from film;

SELECT * 
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE f.title = 'Academy Dinosaur'
AND i.store_id = 1
order by return_date desc;



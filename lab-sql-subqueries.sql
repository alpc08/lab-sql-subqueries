USE sakila;
# 1 Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT ft.title, COUNT(i.film_id) AS Total_copies
FROM inventory i
JOIN 	(SELECT f.film_id, f.title
		FROM film f
		WHERE f.title =  "Hunchback Impossible") ft
	ON i.film_id = ft.film_id
GROUP BY i.film_id;
# 2 List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT title, length
FROM film f
WHERE f.length > (SELECT AVG(length) FROM film);
# 3 Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT CONCAT(a.first_name, " ", a.last_name) AS Actor_Name
FROM actor a
JOIN	(SELECT ft.title, fa.actor_id
		FROM film_actor fa
		JOIN 	(SELECT f.film_id, f.title
					FROM film f
					WHERE f.title = "Alone Trip") ft
		ON fa.film_id = ft.film_id) fta
ON a.actor_id = fta.actor_id
;


use sakila;

-- Lab | SQL Advanced queries

-- 1. List each pair of actors that have worked together.
select * from film_actor fa1
join film_actor fa2
on fa1.actor_id <> fa2.actor_id
and fa1.film_id = fa2.film_id
order by fa1.film_id, fa1.actor_id;


-- 2. For each film, list actor that has acted in more films.
SELECT f.title, fa.actor_id, a.first_name, a.last_name
FROM film f
JOIN film_actor fa
  ON f.film_id = fa.film_id
JOIN actor a
  ON fa.actor_id = a.actor_id
WHERE a.actor_id IN (
SELECT actor_id
FROM film_actor 
GROUP BY actor_id HAVING COUNT(*)>=2)
ORDER BY f.title, fa.actor_id;
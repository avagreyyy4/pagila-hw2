/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */


SELECT first_name || ' ' || last_name AS "Actor Name"
FROM actor 
WHERE first_name || ' ' || last_name IN (
    SELECT first_name || ' ' || last_name 
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    JOIN film f ON fa.film_id = f.film_id
    WHERE EXISTS (
        SELECT 1 FROM UNNEST(f.special_features) AS sf(feature) 
        WHERE feature = 'Trailers'  -- Filtering only for 'Trailers' special feature
    )
)
group by "Actor Name"
order by "Actor Name";


/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT title FROM film
WHERE title IN (
    SELECT title
    FROM (
        SELECT title, rating, UNNEST(special_features) AS feature
        FROM film
    ) t
    WHERE feature = 'Trailers' AND rating = 'G'
)
order by title asc;


/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

select film.title from film 
left join inventory as invent on film.film_id = invent.film_id
where invent.film_id is null;

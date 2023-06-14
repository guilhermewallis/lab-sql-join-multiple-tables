	-- 1.
select st.store_id, ci.city, co.country from store st
join address a using(address_id)
join city ci using(city_id)
join country co using(country_id);

	-- 2.
select st.store_id, sum(p.amount) 'total amount' from payment p
join staff s using(staff_id)
join store st on st.manager_staff_id = s.staff_id
group by st.store_id;

	-- 3.
select c.name category, avg(f.length) 'average runtime' from film f
join film_category fc using(film_id)
join category c using(category_id)
group by fc.category_id;

	-- 4.
    -- Which film categories are longest? = largest avg length in films from each category
select c.name category, avg(f.length) 'average runtime' from film f
join film_category fc using(film_id)
join category c using(category_id)
group by fc.category_id
order by avg(f.length) desc;

    -- Which film categories are longest? = longest films belong to which categories?
select c.name category, f.length film_length from film f
join film_category fc using(film_id)
join category c using(category_id)
order by length desc;

	-- 5.
select f.title, count(*) number_of_rentals from rental r
join inventory i using(inventory_id)
join film f using(film_id)
group by f.title
order by number_of_rentals desc;

	-- 6.
select c.name category, sum(p.amount) gross_revenue from payment p
join rental r using(rental_id)
join inventory i using(inventory_id)
join film_category fc using(film_id)
join category c using(category_id)
group by c.name
order by gross_revenue desc
limit 5;

	-- 7.
	-- all 4 copies of the film in store 1 have been returned therefore available to be rented
select f.title, i.inventory_id, r.rental_date, r.return_date from rental r
join inventory i  using(inventory_id)
join film f using(film_id)
join store st using(store_id)
where f.title = "ACADEMY DINOSAUR" and st.store_id = 1 and r.return_date is not null;

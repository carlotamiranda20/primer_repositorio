/*Ejercicio 2. Muestra los nombres de todas las películas con una clasificación por 
edades de ‘Rʼ.   */

select title
from film f 
where rating='R';


/* Ejercicio 3. Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 
y 40.*/


select concat("first_name", ' ', "last_name") as actores
from actor a
where actor_id between 30 and 40;


/*Ejercicio 4. Obtén las películas cuyo idioma coincide con el idioma original.*/

select title
from film f 
where language_id = original_language_id ;


/*no hay ninguna que coincida*/




/*Ejercicio 5. Ordena las películas por duración de forma ascendente*/

select title, length
from film 
order by "length" asc;


/*Ejercicio 6. Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su 
apellido*/

select first_name as nombre, last_name as apellido
from actor a 
where "last_name"='ALLEN';

/*Ejercicio 7. Encuentra la cantidad total de películas en cada clasificación de la tabla 
“filmˮ y muestra la clasificación junto con el recuento*/

select rating , count (*) as num_peliculas
from film f 
group by rating ;


/* Ejercicio 8. Encuentra el título de todas las películas que son ‘PG13ʼ o tienen una 
duración mayor a 3 horas en la tabla film*/

select title, rating, length 
from film 
where "rating"='PG-13' or "length">180;


/*Ejercicio 9.Encuentra la variabilidad de lo que costaría reemplazar las películas.*/

select variance(replacement_cost)
from film;


/*Ejercicio 10. Encuentra la mayor y menor duración de una película de nuestra BBDD.*/

select 
    max(length) as duracion_maxima,
    min(length) as duracion_minima
from film;

/*Ejercicio 11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.*/

select amount 
from payment 
order by payment_date desc
offset 2 limit 1;


/* Ejercicio 12. Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC-
17’ ni ‘G’ en cuanto a su clasificación.*/
select title , rating
from film 
where rating not in ('NC-17','G');


/*Ejercicio 13. Encuentra el promedio de duración de las películas para cada
clasificación de la tabla film y muestra la clasificación junto con el
promedio de duración.*/
select rating as clasificacion, avg(length) as duracion_promedio
from film
group by rating;

/*Ejercicio 14. Encuentra el título de todas las películas que tengan una duración mayor
a 180 minutos.*/

select title as titulo, length as duracion
from film 
where length>180;

/*Ejercicio 15. ¿Cuánto dinero ha generado en total la empresa?*/
select sum(amount) as total_generado
from payment;

/*Ejercicio 16. Muestra los 10 clientes con mayor valor de id.*/

select customer_id as id, first_name as nombre , last_name as apellido
from customer
order by customer_id desc
limit 10;


/*Ejercicio 17: Encuentra el nombre y apellido de los actores que aparecen en la
película con título ‘Egg Igby'*/

with actores as (
select a.first_name , a.last_name 
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
where f.title='EGG IGBY'
)
select *
from actores;

/* Ejercicio 18: Selecciona todos los nombres de las películas únicos.*/

select distinct title
from film;

/*Ejercicio 19. Encuentra el título de las películas que son comedias y tienen una
duración mayor a 180 minutos en la tabla “film”.*/

with categorias as (
select *
from film f 
join film_category fc on f.film_id=fc.film_id
join category c on fc.category_id=c.category_id)

select title
from categorias
where name='Comedy' and length>180;



/*Ejercicio 20. Encuentra las categorías de películas que tienen un promedio de
duración superior a 110 minutos y muestra el nombre de la categoría
junto con el promedio de duración.*/


with f_c as (
select *
from film f 
join film_category fc on f.film_id=fc.film_id
join category c on fc.category_id=c.category_id)

select name as categoria, avg(length) as promedio
from f_c
group by name
having avg(length)>110;


/*Ejercicio 21. Cuál es la media de duración del alquiler de las películas*/

select avg(rental_duration) as duracion_media_alquiler
from film;


/* Ejercicio 22. Crea una columna con el nombre y apellidos de todos los actores y
actrices.*/

select concat(first_name, ' ', last_name) as actores
from actor;

/*Ejercicio 23. Números de alquiler por día, ordenados por cantidad de alquiler de
forma descendente.*/
select date(rental_date) as dia_alquiler, count(*) as num_alquiler
from rental 
group by date(rental_date)
order by num_alquiler asc;


/* Ejercicio 24. Encuentra las películas con una duración superior al promedio*/

with duracion_media as(
select avg(length) as media
from film)

select title, length
from film, duracion_media
where length> media;


/*Ejercicio 25. Averigua el número de alquileres registrados por mes*/


select date_trunc('month', rental_date) as mes_alquiler, count(*) as num_alquiler_mes
from rental
group by mes_alquiler

/*Ejercicio 26: Encuentra el promedio, la desviación estándar y varianza del total
pagado.*/

select avg(amount) as promedio, stddev(amount) as desviacion_estandar, variance(amount) as varianza
from payment;


/*Ejercicio 27. ¿Qué películas se alquilan por encima del precio medio?*/
with precio_medio as (
select avg(rental_rate) as medio
from film )

select title as nombre, rental_rate as precio
from film, precio_medio
where rental_rate>precio_medio.medio;


/* Ejericio 28: Muestra el id de los actores que hayan participado en más de 40
películas.*/

select actor_id, count(film_id) as num_peliculas
from film_actor 
group by actor_id
having count(film_id)>40;


/*Ejercicio 29. Obtener todas las películas y, si están disponibles en el inventario,
mostrar la cantidad disponible.*/

select f.film_id, f.title as titulo, count(i.inventory_id) as num_disponible
from film f
join inventory i on f.film_id=i.film_id 
group by f.film_id;


/*Ejercicio 30. Obtener los actores y el número de películas en las que ha actuado.*/

select a.first_name as nombre, a.last_name as apellido, count(fa.film_id) as num_peliculas
from film_actor fa 
join actor a on fa.actor_id=a.actor_id 
group by fa.actor_id, a.first_name, a.last_name;


/* Ejercicio 31. Obtener todas las películas y mostrar los actores que han actuado en
ellas, incluso si algunas películas no tienen actores asociados.*/

select f.title, concat(a.first_name, ' ', a.last_name) as actor
from film f
full join film_actor fa on f.film_id=fa.film_id
full join actor a on a.actor_id=fa.actor_id
order by f.title;


/*Ejercicio 32.  Obtener todos los actores y mostrar las películas en las que han
actuado, incluso si algunos actores no han actuado en ninguna película.*/

select concat(a.first_name, ' ', a.last_name) as actor, f.title
from film f
full join film_actor fa on f.film_id=fa.film_id
full join actor a on a.actor_id=fa.actor_id
order by a.first_name;

/* Ejercicio 33. Obtener todas las películas que tenemos y todos los registros de
alquiler.*/

select f.title, r.rental_id, r.rental_date, r.return_date
from film f
full join inventory i on f.film_id = i.film_id
full join rental r on i.inventory_id = r.inventory_id;


/*Ejercicio 34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.*/

select c.customer_id, 
		concat (c.first_name, ' ', c.last_name) as cliente, 
		sum(p.amount) as dinero_gastado
from customer c 
join payment p on c.customer_id=p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by dinero_gastado
limit 5;


/*Ejercicio 35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.*/
select actor_id, first_name, last_name
from actor
where first_name = 'JOHNNY';

/*Ejercicio 36. Renombra la columna “first_name” como Nombre y “last_name” como
Apellido.*/

select first_name as nombre, last_name as apellido
from actor;


/*Ejercicio 37. Encuentra el ID del actor más bajo y más alto en la tabla actor.*/


select min(actor_id) as id_bajo, max(actor_id) as id_alto
from actor;


/*Ejercicio 38. Cuenta cuántos actores hay en la tabla “actor”.*/

select count(*) as num_actores
from actor;



/*Ejercicio 39. Selecciona todos los actores y ordénalos por apellido en orden
ascendente.*/

select actor_id, first_name, last_name
from actor
order by last_name asc;

/* Ejrecicio 40. Selecciona las primeras 5 películas de la tabla “film”.*/

select title
from film
limit 5;


/*Ejercicio 41 Agrupa los actores por su nombre y cuenta cuántos actores tienen el
mismo nombre. ¿Cuál es el nombre más repetido?*/

select first_name, count(*) as repeticiones
from actor
group by first_name 
order by repeticiones desc
limit 1;


/*Ejercicio 42 . Encuentra todos los alquileres y los nombres de los clientes que los
realizaron.*/

select r.rental_id, r.rental_date, r.return_date,
       c.first_name as nombre, c.last_name as apellido
from rental r
join customer c on r.customer_id = c.customer_id;


/*Ejercicio 43. Muestra todos los clientes y sus alquileres si existen, incluyendo
aquellos que no tienen alquileres.*/


select c.customer_id, c.first_name as nombre, c.last_name as apellido,
       r.rental_id, r.rental_date, r.return_date
from  customer c
left join rental r on c.customer_id = r.customer_id;



/*Ejercicio 44 . Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor
esta consulta? ¿Por qué? Deja después de la consulta la contestación.*/


select *
from film f
cross join  category c ;


/*Esta consulta no aporta valor directamente ya que hace todas las combinaciones posibles entre películas y categorias aunque no estén relacionadas.
 * La relación entre film y category están en la tabla intermedia film_category, un join con esa tabla nos podría aportar información suficiente si queremos saber algo en conceto que relacione ambas tablas.*/


/*Ejercicio 45. Encuentra los actores que han participado en películas de la categoría
'Action'.*/


select distinct a.actor_id, a.first_name, a.last_name
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where c.name = 'Action';


/*Ejercicio 46. Encuentra todos los actores que no han participado en películas.*/

select a.first_name, a.last_name 
from actor a
left join film_actor fa on a.actor_id = fa.actor_id
where fa.film_id is null;

/*Ejercicio 47. Selecciona el nombre de los actores y la cantidad de películas en las
que han participado.*/

select a.actor_id, a.first_name, a.last_name,count(fa.film_id) as num_peliculas
from actor a
join film_actor fa on a.actor_id = fa.actor_id
group by a.actor_id, a.first_name, a.last_name;


/*Ejercicio 48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres
de los actores y el número de películas en las que han participado.*/

create view actor_num_peliculas as
select a.first_name, a.last_name, count(fa.film_id) as num_peliculas
from actor a
join film_actor fa on a.actor_id = fa.actor_id
group by a.first_name, a.last_name;

select*
from actor_num_peliculas;

/*Ejercicio 49. Calcula el número total de alquileres realizados por cada cliente.*/

select c.first_name, c.last_name, count(r.rental_id) as num_alquileres
from rental r 
join customer c on r.customer_id = c.customer_id
group by c.first_name, c.last_name;


/*Ejercicio 50. Calcula la duración total de las películas en la categoría 'Action'.*/

select sum(f.length) as duracion_total
from film f
join film_category fc on f.film_id = fc.film_id 
join category c on fc.category_id= c.category_id
where c.name='Action';

/* Ejercicio 51. Crea una tabla temporal llamada “cliente_rentas_temporal” para
almacenar el total de alquileres por cliente.*/

create temporary table  cliente_rentas_temporal as
select c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_alquileres
from customer c
left join rental r on c.customer_id = r.customer_id
group by c.customer_id, c.first_name, c.last_name;

select* 
from cliente_rentas_temporal;


/*Ejercicio 52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las
películas que han sido alquiladas al menos 10 veces.*/

create temporary table peliculas_alquiladas as
select f.film_id, f.title, count(r.rental_id) as total_alquiladas
from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.film_id, f.title
having count(r.rental_id) >=10;

select* 
from peliculas_alquiladas;

/*Ejercicio 53. Encuentra el título de las películas que han sido alquiladas por el cliente
con el nombre ‘Tammy Sanders’ y que aún no se han devuelto. Ordena
los resultados alfabéticamente por título de película.*/
select f.title
from customer c 
join rental r on c.customer_id=r.customer_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id 
where c.first_name = 'TAMMY'
	and c.last_name = 'SANDERS'
	and r.return_date is null 
order by f.title;


/*Ejercicio 54. Encuentra los nombres de los actores que han actuado en al menos una
película que pertenece a la categoría ‘Sci-Fi’. Ordena los resultados
alfabéticamente por apellido.*/

select distinct a.first_name, a.last_name
from actor a 
join film_actor fa on a.actor_id = fa.actor_id
join film_category fc on fa.film_id=fc.film_id
join category c on fc.category_id=c.category_id
where c.name= 'Sci-Fi'
order by a.last_name;


/*Ejercicio 55 . Encuentra el nombre y apellido de los actores que han actuado en
películas que se alquilaron después de que la película ‘Spartacus
Cheaper’ se alquilara por primera vez. Ordena los resultados
alfabéticamente por apellido.*/

select distinct a.first_name, a.last_name
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join inventory i on fa.film_id=i.film_id
join rental r on i.inventory_id=r.inventory_id
where r.rental_date > (
	select min(r2.rental_date)
	from film f2
	join inventory i2 on f2.film_id=i2.film_id
	join rental r2 on i2.inventory_id=r2.inventory_id
	where f2.title='SPARTACUS CHEAPER'
	)
order by a.last_name, a.first_name;
	



/* Ejercicio 56. Encuentra el nombre y apellido de los actores que no han actuado en
ninguna película de la categoría ‘Music’.*/

select a.first_name, a.last_name
from actor a 
where a.actor_id not in (
	select fa.actor_id
	from film_actor fa
	join film_category fc on fa.film_id=fc.film_id 
	join category c on fc.category_id=c.category_id 
	where c.name='MUSIC'
	)
order by a.last_name , a.first_name;

/*Ejercicio57. Encuentra el título de todas las películas que fueron alquiladas por más
de 8 días.*/

select f.title
from rental r
join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
where r.return_date is not null
	and (r.return_date - r.rental_date) > interval '8 days';

/*Ejercicio 58. Encuentra el título de todas las películas que son de la misma categoría
que ‘Animation’.*/

select f.title
from film f
join film_category fc on f.film_id=fc.film_id
where fc.category_id =(
	select category_id
	from category c
	where name ='Animation');


/*Ejercicio 59. Encuentra los nombres de las películas que tienen la misma duración
que la película con el título ‘Dancing Fever’. Ordena los resultados
alfabéticamente por título de película.*/


select title
from film
where length=(
 	select length 
 	from film f 
 	where title ='DANCING FEVER'
   )
order by title;

/*Ejercicio 60. Encuentra los nombres de los clientes que han alquilado al menos 7
películas distintas. Ordena los resultados alfabéticamente por apellido*/


select  c.last_name, c.first_name
from customer c
join rental r on c.customer_id=r.customer_id
join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
group by c.customer_id, c.first_name, c.last_name
having count(distinct f.film_id)>=7
order by c.last_name, c.first_name;

/*Ejercicio 61. Encuentra la cantidad total de películas alquiladas por categoría y
muestra el nombre de la categoría junto con el recuento de alquileres.*/


select c.name as categoria, count(r.rental_id) as tot_alquileres
from category c 
join film_category fc on c.category_id=fc.category_id 
join film f on fc.film_id=f.film_id
join inventory i on f.film_id=i.film_id
join rental r on i.inventory_id=r.inventory_id
group by c.name;


/*Ejercicio 62. Encuentra el número de películas por categoría estrenadas en 2006.*/

select c.name as categoria, count(f.film_id) as num_peliculas
from category c
join film_category fc on c.category_id=fc.category_id
join film f on fc.film_id=f.film_id
where f.release_year=2006
group by c.name ;

/*Ejercicio 63. Obtén todas las combinaciones posibles de trabajadores con las tiendas
que tenemos.*/

select *
from staff s 
cross join store st;


/*Ejercicio 64. Encuentra la cantidad total de películas alquiladas por cada cliente y
muestra el ID del cliente, su nombre y apellido junto con la cantidad de
películas alquiladas.*/

select c.customer_id, c.first_name, c.last_name, count(r.rental_id) as peliculas_alquildas
from customer c
join rental r on c.customer_id=r.customer_id
group by c.customer_id, c.first_name, c.last_name;

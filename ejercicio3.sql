/* 3. Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 
y 40.*/


select concat("first_name", ' ', "last_name") as actores
from actor a
where actor_id between 30 and 40;

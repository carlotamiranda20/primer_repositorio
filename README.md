MEMORIA DE CONSULTAS SQL
Para el ejercicio 1, crear el esquema, una vez agregada la base de datos BBDD_proyecto, generamos el diagrama, y lo guardamos como jpeg.
Ejercicio 2: buscamos las películas donde la columna rating sea R. Mostramos una lista con los títulos de dichas películas.
Ejercicio 3: buscamos una lista de nombres de actores cuyo actor_id esté entre 30 y 40. Mostramos una lista que se llama "actores" donde aparecen el nombre y apellido de cada uno.
Ejercicio 4: buscamos los títulos de las películas donde los atributos language_id y original_language_id sean iguales. En nuestra base de datos ninguna película cumple esa condición, por tanto la sentencia devuelve una lista vacía.
Ejercicio 5: buscamos una lista donde se ordenen las películas por su duración de forma ascendente, para ello usamos un order by, indicando la key, "lenght" y el orden, asc. Para el resultado se muestran tanto el título como la duración de cada película.
Ejercicio 6: buscamos los actores con la condición de que su apellido, "last_name" sea ALLEN. Como resultado se muestra una tabla con el nombre y el apellido de aquellos que cumplen dicha condición.
Ejericio 7: buscamos las diferentes categorías de rating que existen con un group by, y mostramos el número de películas que tiene cada una sumando cada tipo con un count(*).
Ejercicio 8: buscamos el nombre de las películas que cumplan una de las dos condiciones: o que su ranting sea PG-13 o su duración, length sea mayor que 180. Como queremos que cumpla una de las dos usamos un OR. Como resultado mostramos el título de la película, su ranting y su duración.
Ejercicio 9: buscamos la variabilidad de lo que costaría reemplazar las películas, es decir de replacement_cost. Para ellos 

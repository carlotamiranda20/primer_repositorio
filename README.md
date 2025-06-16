MEMORIA DE CONSULTAS SQL
Para el ejercicio 1, crear el esquema, una vez agregada la base de datos BBDD_proyecto, generamos el diagrama, y lo guardamos como jpeg.
Ejercicio 2: buscamos las películas donde la columna rating sea R, dentro de la tabla film. Mostramos una lista con los títulos de dichas películas.
Ejercicio 3: buscamos una lista de nombres de actores, dentro de la tabla actors, cuyo actor_id esté entre 30 y 40. Mostramos una lista que se llama "actores" donde aparecen el nombre y apellido de cada uno.
Ejercicio 4: buscamos los títulos de las películas donde los atributos language_id y original_language_id sean iguales. En nuestra base de datos ninguna película cumple esa condición, por tanto la sentencia devuelve una lista vacía.
Ejercicio 5: buscamos una lista donde se ordenen las películas por su duración de forma ascendente, para ello usamos un order by, indicando la key, "lenght" y el orden, asc. Para el resultado se muestran tanto el título como la duración de cada película.
Ejercicio 6: buscamos los actores con la condición de que su apellido, "last_name" sea ALLEN. Como resultado se muestra una tabla con el nombre y el apellido de aquellos que cumplen dicha condición.
Ejericio 7: buscamos las diferentes categorías de rating que existen con un group by, y mostramos el número de películas que tiene cada una sumando cada tipo con un count(*).
Ejercicio 8: buscamos el nombre de las películas que cumplan una de las dos condiciones: o que su ranting sea PG-13 o su duración, length sea mayor que 180. Como queremos que cumpla una de las dos usamos un OR. Como resultado mostramos el título de la película, su ranting y su duración.
Ejercicio 9: buscamos la variabilidad de lo que costaría reemplazar las películas, es decir del atributo replacement_cost. Para ello utilizamos la función predefinida variance, que calcula el cuadrado de la desviación estándar.
Ejercicio 10: buscamos la mayor y menor duración de una película, es decir el máximo y el mínimo de la columna lenght dentro de la tabla film.

Ejercicio 12: buscamos las películas donde rating sea distinto de NC-17 y G. Para ello dentro de la tabla film utilizamos el comando where not in. En el resultado mostramos los nombres de las películas que cumplen esa condición y su atributo rating.
Ejercicio 13: dentro de la tabla film, buscamos el promedio de length mediante la función avg(length). Mostramos una tabla con los distintos tipos de clasificaciones y su duración promedio haciendo un group by rating.
Ejercicio 14: buscamos que la duración de las películas sea mayor que 180 minutos, para ello usamos la condición where length>180 dentro de la tabla film. Como resultado mostramos el título y la duración de cada película que cumple la condición.
Ejercicio 15: buscamos el total dinero generado, para ello sumamos la columna amount con la función sum, dentro de la tabla payment.
Ejercicio 16: buscamos los 10 primeros id de dichos clientes.


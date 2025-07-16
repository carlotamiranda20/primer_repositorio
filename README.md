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

Ejercicio 11: el antepenúltimo alquiler es el tercero más reciente, para ello seleccionamos la cantidad amount dentro de payment y ordenamos por fecha descendiente. Con offset y limit mostramos la antepenúltima cantidad

Ejercicio 12: buscamos las películas donde rating sea distinto de NC-17 y G. Para ello dentro de la tabla film utilizamos el comando where not in. En el resultado mostramos los nombres de las películas que cumplen esa condición y su atributo rating.

Ejercicio 13: dentro de la tabla film, buscamos el promedio de length mediante la función avg(length). Mostramos una tabla con los distintos tipos de clasificaciones y su duración promedio haciendo un group by rating.

Ejercicio 14: buscamos que la duración de las películas sea mayor que 180 minutos, para ello usamos la condición where length>180 dentro de la tabla film. Como resultado mostramos el título y la duración de cada película que cumple la condición.

Ejercicio 15: buscamos el total dinero generado, para ello sumamos la columna amount con la función sum, dentro de la tabla payment.

Ejercicio 16: buscamos los 10 clientes con mayor id, para ello ordenamos los customer_id con un order by de mayor a menor con desc y para seleccionar los 10 primeros usamos un limit 10.

Ejercicio 17: buscamos el nombre y apellidos de los actores que aparecen en una película. Por un lado tenemos el atributo del título de la película en la tabla film, y los nombres de los actores en la tabla actor. Ambas tablas se relacionan mediante film_id y actor_id , que están en la tabla film_actor. Por tanto para relacionar estas 3 tablas utilizamos dos inner joins donde unimos las tablas por las columnas que tienen en común. Del resultado de unir estas tablas, seleccionamos los nombres y apellidos que cumplan la condición de que el título que les corresponde sea el que se busca (con un where). Todo este comando lo metemos dentro de una tabla temporal para que sea más organizada la sintaxis , con un with() y finalmente mostramos el resultado de esta tabla temporal con el select principal. 

Ejercicio 18: buscamos los nombres de títulos únicos, para ello usamos el comando distint, que selecciona sólo valores únicos de la columna title, eliminando títulos repetidos (si los hubiera).

Ejercicio 19: buscamos los títulos de películas que sean comedias y que tengan cierta duración. El atributo de comedia está en la tabla category, que se relaciona con la tabla film mediante la tabla film_category. Para ello hacemos lo mismo que en el ejercicio 17, creamos una tabla temporal donde estén unidas las 3 tablas mediante joins. Después seleccionamos el título de las películas que cumplan las condiciones que imponemos con el where.

Ejercicio 20: de igual forma que en el ejercicio 19, necesitamos unir las tablas film y category, construyendo una tabla temporal. Una vez creada, agrupamos las diferentes categorías con un group by, y para calcular el promedio se debe usar having en lugar de where porque el comando avg() que usamos para el promedio es una función de agregación que no funciona con where. Por útilmo mostramos el nombre de la categoría y su promedio.

Ejercicio 21: para calcular la media de duración del alquier, aplicamos la función avg a la categoría rental_duration dentro de la tabla film.

Ejercicio 22: para unir los nombres y apellidos de los actores (columnas first_name y last_name de la tabla actor) utilizamos concat() colocando entre comillas simples un espacio en blanco para separar los caracteres.

Ejercicio 23: buscamos el número de alquiler por día. Para ello usamos la columna rental_date dentro de la tabla rental. Para seleccionar solo la fecha y no la hora, usamos la función date(). Con el group by agrupamos según la fecha, y con el count(*) contamos el número de veces que se repite la fecha (el número de alquileres por cada día). Por último ordenamos el número de alquileres con un desc para que sea de mayor a menor.

Ejercicio 24: buscamos las películas y su duración en la tabla film. Creamos una tabla temporal donde se almacene el valor promedio de la duración, avg(length). Luego esta tabla temporal la utilizamos para imponer la condición de que la duración de las películas sea mayor que el valor promedio. Mostramos una tabla con el título de la película y su duración.

Ejercicio 25: buscamos el número de alquileres por mes, que es un dado que se guarda en rental_date dentro de la tabla rental. Para coger solamente el mes, utilizamos la función date_trunc('unidad', columna) en este caso la unidad es 'month'. Hacemos un group by para agrupar los resultados por meses y por último un count(*) que cuenta el número de filas iguales para obtener el número de alquileres por mes. 

Ejercicio 26: el total pagado se encuentra en amount dentro de payment. Para calcular el promedio usamos avg(), para la desviación estándar, stddev(), y para la varianza, variance().

Ejercicio 27: buscamos el precio medio de las películas, para ello calculamos avg(rental_rate) dentro de la tabla film. Para poder ponerlo como una condición al ser una función de agregación  no podemos hacer un where directamente. Por eso creamos una tabla temporal donde se almacene este dato con with y luego lo usamos como condición al hacer el select principal.

Ejercicio 28: el id de los actores está en actor_id dentro de film_actor. Primero agrupamos las filas que tienen el mismo actor_id con un group by. Imponemos la condición de que el número de film_id que corresponden a cada actor_id sea mayor que 40 con having, ya que count es una función de agregación. Mostramos el actor_id y el número de películas en la que ha participado.

Ejercicio 29: para relacionar las películas con el inventario necesitamos hacer un left join entre las tablas inventory y film, a través de film_id, para que aparezcan las películas sin registro, es decir cuando su valor sea NULL. Para obtener la cantidad disponible usamos count(i.inventory_id) y previamente para utilizar el count como es una función de agregación hacemos un group by . Mostramos el film_id, el nombre de la película y la cantiad disponible en el inventario.

Ejercicio 30: buscamos relacionar los nombres de los actores con el número de películas, para ello tenemos que unir las tablas film_actor y actor con un join a través del actor_id. Para contar las películas primero usamos un group by y luego hacemos un count(f.film_id). Para mostrar también el nombre y el apellido hay que hacer un group by con dichas columnas.

Ejercicio 31: en este caso para relacionar los nombres de las películas con los actores tenemos que unir las tablas film, actor_film y actor. Como se pide mostrar todas las películas aunque no tengan actores asociados, hacemos un left join. Mostramos el título y el nombre de los actores. 

Ejercicio 32: exactamente igual que el ejercicio anterior solo que como ahora nos interesan los actores ordenamos por nombre de los actores en lugar de nombre de películas (para mejorar la legibilidad ya que la tabla está formada por las mismas filas). Hacemos los left join en sentido contrario al ejercicio anterior.

Ejercicio 33: para obtener todas las películas y todos los registros de alquiler necesitamos unir las tablas film y rental mediante la tabla intermedia inventory. Como queremos todas las películas aunque no tengan un registro asociado, y todos los registros aunque no tengan una película asociada utilizamos el full join. (suponemos que registro incluye rental_id, rental_date  return_date).

Ejercicio 34: necesitamos relacionar las tablas customer (con la información de los clientes) con payment (con la información de los pagos) mediante customer_id. Para calcular el total del dinero gastado de cada cliente utilizamos la función sum(p.amount). Hacemos un group by para agrupar los clientes y ordenamos de mayor a menor cantidad de dinero gastada. Para mostrar los 5 primeros hacemos limit 5.


Ejercicio 35: buscamos los nombres (first_name) en la tabla actor que cumplan la condición mediante un where.

Ejercicio 36: para renombrar las columnas utilizamos el comando as (alias)

Ejercicio 37: para encontrar el id más bajo y el id más alto utilizamos los comandos min y max.

Ejercicio 38: para contar el número de actores utilizamos el comando count(*) que cuenta el número de filas que hay en la tabla actor.

Ejercicio 39: seleccionamos las columnas de la tabla actor (actor_id,first_name y last_name)y para ordenarlos de forma ascedente con el apellido utilizamos un order by last_name asc.

Ejercicio 40: para mostrar las 5 primeras películas seleccionamos la columna (title) y la tabla (film) y hacemos un limit 5.

Ejercicio 41: para agrupar los actores por su nombre utilizmos un group by first_name y para contar cuántos tienen el mismo nombre hacemos un count(*). Como se pide el nombre más repetido primero ordenamos por número de veces que aparece el nombre de forma descendiente (de mayor a menor) y hacemos un limit 1 para que solo aparezca el mayor.

Ejercicio 42: para obtener todos los alquileres y los nombres de los clientes que los realizaron debemos juntar las tablas rental (información sobre los alquileres ) y customer (información sobre los clientes) mediante un join que las une a través de la columna común que es el customer_id.


Ejercicio 43: de nuevo necesitamos unir las tablas rental y customer pero de forma distinta al ejercicio anterior. Se piden que aparezcan todos los clientes aunque no tengan alquileres, para ello hacemos un left join desde la tabla customer hasta la rental. Así, aparecen todos los clientes aunque no tengan alquileres asociados y en ese caso los campos rental serán nulos. 


Ejercicio 44: hacemos un cross join y mostramos como resultado todas las combinaciones posibles entre ambas tablas. Como respuesta a si esta consulta aporta algo : Esta consulta no aporta valor directamente ya que hace todas las combinaciones posibles entre películas y categorias aunque no estén relacionadas. La relación entre film y category están en la tabla intermedia film_category, un join con esa tabla nos podría aportar información suficiente si queremos saber algo en conceto que relacione ambas tablas.


Ejercicio 45: para esta consulta hay que unir varias tablas (actor, film_actor, film, film_category y category) asi que realizamos join entre ellas a través de la columna que tengan en común. Commo resultado mostramos el actor_id y el nombre de aquellos actores que cumplan la condición, que imponemos con un where.

Ejercicio 46: para buscar actores que no hayan participado en películas hacemos un left join entre las tablas actor y film_actor, buscando aquellos aquellos actores cuyo film_id sea nulo. Observamos que no hay ninguno.

Ejercicio 47: para encontrar el número de películas que ha hecho cada actor hacemos un join entre la tabla film_actor y actor. Agrupamos por nombres y apellido y contamos el número de veces que se repite el film_id para cada actor.

Ejercicio 48: para crear la vista usamos el créate view actor_num_peliculas as y usamos la consulta idéntica a la del ejercicio anterior. Para mostrar la vista hacemos un select* , de forma análoga a como se haría con una tabla

Ejercicio 49: para relaciones el nombre de los clientes con los alquileres unimos las tablas rental y customer mediante un join. Agrupamos por nombres y apellidos con un group by y contamos el nu´mero de aluqieres con count.

Ejercicio 50: para calcular la duración total de las peliculas necesitamos unir las tablas film_category, category y film. Luego imponemos la condición de que la categoría sea Action y sumamos la duración total de todas las películas q la cumplan con un sum(f.length).

Ejercicio 51: creamos una tabla temporal con créate temporary table as. Para hacer la consulta unimos las tablas customer y rental con un left join, que incluye los clientes que no han alqulado nada. Hacemos un group by y luego contamos el total con un count(). Seleccionamos la tabla temporal con un select*

Ejercicio 52: creamos una tabla temporal con créate temporary table. Para hacer la consulta tenemos que unir las tablas film, inventory y rental con un join on. Como queremos usar un count para contar el número de veces que han sido alquiladas tenemos que hacer un group by y imponer la condición con el having. Para mostrar la tabla hacemos un select* .

Ejercicio 53: para relacionar el título de las películas, con el nombre de la persona que las alquila y la devolución del alquiler,necesitamos unir las tablas customer, rental, inventory y film. Las unimos mediante varios join on y luego imponemos la condición de que el nombre y apellidos sean los requeridos, y que no exista fecha de devolución del alquiler. Por útilmo ordenamos alfabeticame con Order by . 


Ejercicio 54: para relacionar los actores con las categorías unimos las tablas actor, film_actor, film_category y category. Imponemos la condición de que el nombre de la categoría sea el escogido y ordenamos alfabéticamente con un Order by. Seleccionamos los nombres y apellidos mostrados en la tabla y usamos el distinct para que no se muestren nombres y apellidos repetidos. 

Ejercicio 55: como tenemos que hacer cumplir dos condiciones utilizamos una subconsulta usando un where dentro de otro. Primero unimos las tablas inventory, rental y actor, e imponemos a condición de que la fecha de alquiler sea mayor que la de la subconsulta. En la subconsulta buscamos la condición de que el titulo de la pelicula sea Spartacus Cheaper y que tenga el mínimo valor de fecha de alquiler. Por último ordenamos alfabéticamente por apellido. 

Ejercicio 56: para buscar actores que no hayan actuado en ninguna pelicula hacemos otra subconsulta. En la subconsulta buscamos aquellas películas que pertenezcan a la categoría music, uniendo las tablas film_actor, film_category y category. Y luego imponemos la condición de que el actor_id del actor que buscamos no cumpla la subconsulta, es decir no pertenezca a la categoría music mediante un not in. Por último ordenamos alfabéticamente por apellido con un Order by.

Ejercicio 57: buscamos que las películas cumplan una condición con respecto a sus fechas, para ello imponemos que la fecha de devolución exista mediante is not null y luego restamos la fecha de devolución y la de alquiler haciendo que ese intervalo sea mayor que 8 días.

Ejercicio 58: primero buscamos el category_id correspondiente a 'Animation' y luego seleccionamos las películas que pertenezcan a esa categoría, haciendo uso de una subconsulta.

Ejercicio 59: hacemos una subconsulta para obtener la duración de 'DANCING FEVER' y luego la consulta principal selecciona las películas con esa duración.

Ejercicio 60:para hacer esta consulta tenemos que relacionar las tablas customer, rental, inventory y film. Agrupamos por cilente con un group by y contamos con un count(distinct) para contar  el número de películas distintas que ha alquilado cada uno. Imponemos la condición de que sean 7 o más, y por último ordenamos alfabéticamente por apellido.

Ejercicio 61: hay que unir las tablas category, film_category,film,inventory y rental para relacionar las categorías de las películas con los alquileres.

Ejercicio 62: hay que relacionar las categorías con los nombres de las películas y el año que fueron estrenadas, es decir con la tabla film. Imponemos la condición de que el año de estreno sea 2006 y agrupamos por categoría con un group by.

Ejercicio 63: para generar todas las combinaciones posibles utilizmaos un cross join entre las tablas staff y store.

Ejercicio 64: unimos las tablas customer con rental para saber qué clientes han alquilado películas y hacemos un count(rental_id) para contar cuántos alquileres hizo cada cliente. Para mostrarlo hacemos un gropu by con el ID, nombre y apellido de cada cliente.

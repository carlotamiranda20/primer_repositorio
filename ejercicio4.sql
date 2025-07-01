/*Obtén las películas cuyo idioma coincide con el idioma original.*/

select title
from film f 
where language_id = original_language_id ;


/*no hay ninguna que coincida*/

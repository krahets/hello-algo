# Límites de la búsqueda binaria

## Encontrar el límite izquierdo

!!! question

    Dado un arreglo ordenado `nums` de longitud $n$, que puede contener elementos duplicados, devuelva el índice del elemento `target` más a la izquierda. Si el elemento no está presente en el arreglo, devuelva $-1$.

Recordando el método de búsqueda binaria para un punto de inserción, una vez finalizada la búsqueda, el índice $i$ apuntará a la ocurrencia más a la izquierda de `target`. Por lo tanto, **buscar el punto de inserción es esencialmente lo mismo que encontrar el índice del `target` más a la izquierda**.

Podemos usar la función para encontrar un punto de inserción para encontrar el límite izquierdo de `target`. Tenga en cuenta que el arreglo podría no contener `target`, lo que podría llevar a los siguientes dos resultados:

-   El índice $i$ del punto de inserción está fuera de los límites.
-   El elemento `nums[i]` no es igual a `target`.

En estos casos, simplemente devuelva $-1$. El código es el siguiente:

```src
[file]{binary_search_edge}-[class]{}-[func]{binary_search_left_edge}
```

## Encontrar el límite derecho

¿Cómo encontramos la ocurrencia más a la derecha de `target`? La forma más sencilla es modificar la lógica de búsqueda binaria tradicional cambiando la forma en que ajustamos los límites de búsqueda en el caso de `nums[m] == target`. El código se omite aquí. Si está interesado, intente implementar el código por su cuenta.

A continuación, presentaremos dos métodos más ingeniosos.

### Reutilizar la búsqueda del límite izquierdo

Para encontrar la ocurrencia más a la derecha de `target`, podemos reutilizar la función utilizada para localizar el `target` más a la izquierda. Específicamente, transformamos la búsqueda del `target` más a la derecha en una búsqueda del `target + 1` más a la izquierda.

Como se muestra en la figura a continuación, una vez finalizada la búsqueda, el puntero $i$ apuntará al `target + 1` más a la izquierda (si existe), mientras que el puntero $j$ apuntará a la ocurrencia más a la derecha de `target`. Por lo tanto, devolver $j$ nos dará el límite derecho.

![Transformando la búsqueda del límite derecho en la búsqueda del límite izquierdo](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png)

Tenga en cuenta que el punto de inserción devuelto es $i$, por lo tanto, debe restarse $1$ para obtener $j$:

```src
[file]{binary_search_edge}-[class]{}-[func]{binary_search_right_edge}
```

### Transformar en una búsqueda de elementos

Cuando el arreglo no contiene `target`, $i$ y $j$ eventualmente apuntarán al primer elemento mayor y menor que `target` respectivamente.

Así, como se muestra en la figura a continuación, podemos construir un elemento que no existe en el arreglo, para buscar los límites izquierdo y derecho.

-   Para encontrar el `target` más a la izquierda: se puede transformar en buscar `target - 0.5`, y devolver el puntero $i$.
-   Para encontrar el `target` más a la derecha: se puede transformar en buscar `target + 0.5`, y devolver el puntero $j$.

![Transformando la búsqueda de límites en la búsqueda de un elemento](binary_search_edge.assets/binary_search_edge_by_element.png)

El código se omite aquí, pero hay dos puntos importantes a tener en cuenta sobre este enfoque.

-   El arreglo dado `nums` no contiene decimales, por lo que el manejo de casos iguales no es una preocupación.
-   Sin embargo, la introducción de decimales en este enfoque requiere modificar la variable `target` a un tipo de punto flotante (no se necesita ningún cambio en Python).

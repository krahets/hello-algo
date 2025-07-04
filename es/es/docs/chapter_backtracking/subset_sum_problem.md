# Problema de la suma de subconjuntos

## Caso sin elementos duplicados

!!! question

    Dado un arreglo de enteros positivos `nums` y un entero positivo objetivo `target`, encuentre todas las combinaciones posibles tales que la suma de los elementos en la combinación sea igual a `target`. El arreglo dado no tiene elementos duplicados, y cada elemento puede elegirse varias veces. Devuelva estas combinaciones como una lista, que no debe contener combinaciones duplicadas.

Por ejemplo, para el conjunto de entrada $\{3, 4, 5\}$ y el entero objetivo $9$, las soluciones son $\{3, 3, 3\}, \{4, 5\}$. Tenga en cuenta los siguientes dos puntos.

-   Los elementos del conjunto de entrada se pueden elegir un número ilimitado de veces.
-   Los subconjuntos no distinguen el orden de los elementos, por ejemplo, $\{4, 5\}$ y $\{5, 4\}$ son el mismo subconjunto.

### Solución de permutación de referencia

Similar al problema de la permutación, podemos imaginar la generación de subconjuntos como una serie de elecciones, actualizando la "suma de elementos" en tiempo real durante el proceso de elección. Cuando la suma de elementos es igual a `target`, el subconjunto se registra en la lista de resultados.

A diferencia del problema de la permutación, **los elementos en este problema se pueden elegir un número ilimitado de veces**, por lo que no es necesario usar una lista booleana `selected` para registrar si un elemento ha sido elegido. Podemos hacer pequeñas modificaciones al código de permutación para resolver inicialmente el problema:

```src
[file]{subset_sum_i_naive}-[class]{}-[func]{subset_sum_i_naive}
```

Al ingresar el arreglo $[3, 4, 5]$ y el elemento objetivo $9$ en el código anterior, se obtienen los resultados $[3, 3, 3], [4, 5], [5, 4]$. **Aunque encuentra con éxito todos los subconjuntos con una suma de $9$, incluye el subconjunto duplicado $[4, 5]$ y $[5, 4]$**.

Esto se debe a que el proceso de búsqueda distingue el orden de las elecciones; sin embargo, los subconjuntos no distinguen el orden de las elecciones. Como se muestra en la figura a continuación, elegir $4$ antes de $5$ y elegir $5$ antes de $4$ son ramas diferentes, pero corresponden al mismo subconjunto.

![Búsqueda de subconjuntos y poda fuera de límites](subset_sum_problem.assets/subset_sum_i_naive.png)

Para eliminar subconjuntos duplicados, **una idea sencilla es eliminar los duplicados de la lista de resultados**. Sin embargo, este método es muy ineficiente por dos razones.

-   Cuando hay muchos elementos en el arreglo, especialmente cuando `target` es grande, el proceso de búsqueda produce un gran número de subconjuntos duplicados.
-   Comparar subconjuntos (arreglos) en busca de diferencias consume mucho tiempo, lo que requiere que los arreglos se ordenen primero y luego se comparen las diferencias de cada elemento en los arreglos.

### Poda de subconjuntos duplicados

**Consideramos la eliminación de duplicados durante el proceso de búsqueda mediante la poda**. Observando la figura a continuación, se generan subconjuntos duplicados al elegir elementos del arreglo en diferentes órdenes, por ejemplo, en las siguientes situaciones.

1.  Cuando se elige $3$ en la primera ronda y $4$ en la segunda ronda, se generan todos los subconjuntos que contienen estos dos elementos, denotados como $[3, 4, \dots]$.
2.  Más tarde, cuando se elige $4$ en la primera ronda, **la segunda ronda debe omitir $3$** porque el subconjunto $[4, 3, \dots]$ generado por esta elección duplica completamente el subconjunto del paso `1.`.

En el proceso de búsqueda, las elecciones de cada capa se prueban una por una de izquierda a derecha, por lo que cuanto más a la derecha esté una rama, más se podará.

1.  Las dos primeras rondas eligen $3$ y $5$, generando el subconjunto $[3, 5, \dots]$.
2.  Las dos primeras rondas eligen $4$ y $5$, generando el subconjunto $[4, 5, \dots]$.
3.  Si se elige $5$ en la primera ronda, **entonces la segunda ronda debe omitir $3$ y $4$** ya que los subconjuntos $[5, 3, \dots]$ y $[5, 4, \dots]$ duplican completamente los subconjuntos descritos en los pasos `1.` y `2.`.

![Diferentes órdenes de elección que conducen a subconjuntos duplicados](subset_sum_problem.assets/subset_sum_i_pruning.png)

En resumen, dado el arreglo de entrada $[x_1, x_2, \dots, x_n]$, la secuencia de elección en el proceso de búsqueda debe ser $[x_{i_1}, x_{i_2}, \dots, x_{i_m}]$, que debe satisfacer $i_1 \leq i_2 \leq \dots \leq i_m$. **Cualquier secuencia de elección que no cumpla esta condición causará duplicados y debe podarse**.

### Implementación del código

Para implementar esta poda, inicializamos la variable `start`, que indica el punto de partida para el recorrido. **Después de hacer la elección $x_{i}$, establezca la siguiente ronda para que comience desde el índice $i$**. Esto asegurará que la secuencia de elección satisfaga $i_1 \leq i_2 \leq \dots \leq i_m$, asegurando así la unicidad de los subconjuntos.

Además, hemos realizado las siguientes dos optimizaciones en el código.

-   Antes de iniciar la búsqueda, ordene el arreglo `nums`. En el recorrido de todas las opciones, **finalice el bucle directamente cuando la suma del subconjunto exceda `target`**, ya que los elementos posteriores son más grandes y su suma de subconjuntos definitivamente excederá `target`.
-   Elimine la variable de suma de elementos `total`, **realizando una resta en `target` para contar la suma de elementos**. Cuando `target` sea igual a $0$, registre la solución.

```src
[file]{subset_sum_i}-[class]{}-[func]{subset_sum_i}
```

La figura a continuación muestra el proceso general de backtracking después de ingresar el arreglo $[3, 4, 5]$ y el elemento objetivo $9$ en el código anterior.

![Suma de subconjuntos I proceso de backtracking](subset_sum_problem.assets/subset_sum_i.png)

## Considerando casos con elementos duplicados

!!! question

    Dado un arreglo de enteros positivos `nums` y un entero positivo objetivo `target`, encuentre todas las combinaciones posibles tales que la suma de los elementos en la combinación sea igual a `target`. **El arreglo dado puede contener elementos duplicados, y cada elemento solo se puede elegir una vez**. Devuelva estas combinaciones como una lista, que no debe contener combinaciones duplicadas.

En comparación con la pregunta anterior, **el arreglo de entrada de esta pregunta puede contener elementos duplicados**, lo que introduce nuevos problemas. Por ejemplo, dado el arreglo $[4, \hat{4}, 5]$ y el elemento objetivo $9$, los resultados de salida del código existente son $[4, 5], [\hat{4}, 5]$, lo que resulta en subconjuntos duplicados.

**La razón de esta duplicación es que los elementos iguales se eligen varias veces en una determinada ronda**. En la figura a continuación, la primera ronda tiene tres opciones, dos de las cuales son $4$, generando dos ramas de búsqueda duplicadas, lo que produce subconjuntos duplicados; de manera similar, los dos $4$ en la segunda ronda también producen subconjuntos duplicados.

![Subconjuntos duplicados causados por elementos iguales](subset_sum_problem.assets/subset_sum_ii_repeat.png)

### Poda de elementos iguales

Para resolver este problema, **necesitamos limitar los elementos iguales a que se elijan solo una vez por ronda**. La implementación es bastante inteligente: dado que el arreglo está ordenado, los elementos iguales son adyacentes. Esto significa que en una determinada ronda de elecciones, si el elemento actual es igual a su elemento de la izquierda, significa que ya ha sido elegido, por lo que se omite el elemento actual directamente.

Al mismo tiempo, **esta pregunta estipula que cada elemento del arreglo solo se puede elegir una vez**. Afortunadamente, también podemos usar la variable `start` para cumplir con esta restricción: después de hacer la elección $x_{i}$, establezca la siguiente ronda para que comience desde el índice $i + 1$. Esto no solo elimina los subconjuntos duplicados, sino que también evita la selección repetida de elementos.

### Implementación del código

```src
[file]{subset_sum_ii}-[class]{}-[func]{subset_sum_ii}
```

La figura a continuación muestra el proceso de backtracking para el arreglo $[4, 4, 5]$ y el elemento objetivo $9$, incluyendo cuatro tipos de operaciones de poda. Combine la ilustración con los comentarios del código para comprender todo el proceso de búsqueda y cómo funciona cada tipo de operación de poda.

![Suma de subconjuntos II proceso de backtracking](subset_sum_problem.assets/subset_sum_ii.png)

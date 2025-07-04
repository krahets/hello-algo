# Estrategia de búsqueda de divide y vencerás

Hemos aprendido que los algoritmos de búsqueda se dividen en dos categorías principales.

-   **Búsqueda por fuerza bruta**: Se implementa recorriendo la estructura de datos, con una complejidad temporal de $O(n)$.
-   **Búsqueda adaptativa**: Utiliza una forma de organización de datos única o información previa, y su complejidad temporal puede alcanzar $O(\log n)$ o incluso $O(1)$.

De hecho, **los algoritmos de búsqueda con una complejidad temporal de $O(\log n)$ suelen basarse en la estrategia de divide y vencerás**, como la búsqueda binaria y los árboles.

-   Cada paso de la búsqueda binaria divide el problema (buscar un elemento objetivo en un arreglo) en un problema más pequeño (buscar el elemento objetivo en la mitad del arreglo), continuando hasta que el arreglo esté vacío o se encuentre el elemento objetivo.
-   Los árboles representan la idea de divide y vencerás, donde en estructuras de datos como árboles de búsqueda binaria, árboles AVL y montículos, la complejidad temporal de varias operaciones es $O(\log n)$.

La estrategia de divide y vencerás de la búsqueda binaria es la siguiente.

-   **El problema se puede dividir**: La búsqueda binaria divide recursivamente el problema original (buscar en un arreglo) en subproblemas (buscar en la mitad del arreglo), lo que se logra comparando el elemento central con el elemento objetivo.
-   **Los subproblemas son independientes**: En la búsqueda binaria, cada ronda maneja un subproblema, sin verse afectado por otros subproblemas.
-   **Las soluciones de los subproblemas no necesitan fusionarse**: La búsqueda binaria tiene como objetivo encontrar un elemento específico, por lo que no es necesario fusionar las soluciones de los subproblemas. Cuando se resuelve un subproblema, el problema original también se resuelve.

Divide y vencerás puede mejorar la eficiencia de la búsqueda porque la búsqueda por fuerza bruta solo puede eliminar una opción por ronda, **mientras que divide y vencerás puede eliminar la mitad de las opciones**.

### Implementación de la búsqueda binaria basada en divide y vencerás

En capítulos anteriores, la búsqueda binaria se implementó basándose en la iteración. Ahora, la implementamos basándose en divide y vencerás (recursión).

!!! question

    Dado un arreglo ordenado `nums` de longitud $n$, donde todos los elementos son únicos, encuentre el elemento `target`.

Desde una perspectiva de divide y vencerás, denotamos el subproblema correspondiente al intervalo de búsqueda $[i, j]$ como $f(i, j)$.

Comenzando desde el problema original $f(0, n-1)$, realice la búsqueda binaria a través de los siguientes pasos.

1.  Calcule el punto medio $m$ del intervalo de búsqueda $[i, j]$, y úselo para eliminar la mitad del intervalo de búsqueda.
2.  Resuelva recursivamente el subproblema reducido a la mitad en tamaño, que podría ser $f(i, m-1)$ o $f(m+1, j)$.
3.  Repita los pasos `1.` y `2.`, hasta que se encuentre `target` o el intervalo esté vacío y regrese.

La figura a continuación muestra el proceso de divide y vencerás de la búsqueda binaria para el elemento $6$ en un arreglo.

![El proceso de divide y vencerás de la búsqueda binaria](binary_search_recur.assets/binary_search_recur.png)

En el código de implementación, declaramos una función recursiva `dfs()` para resolver el problema $f(i, j)$:

```src
[file]{binary_search_recur}-[class]{}-[func]{binary_search}
```

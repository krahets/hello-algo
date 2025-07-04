# Ordenamiento por inserción

El <u>ordenamiento por inserción</u> es un algoritmo de ordenamiento simple que funciona de manera muy similar al proceso de ordenar manualmente una baraja de cartas.

Específicamente, seleccionamos un elemento base del intervalo no ordenado, lo comparamos con los elementos del intervalo ordenado a su izquierda e insertamos el elemento en la posición correcta.

La figura a continuación ilustra cómo se inserta un elemento en el arreglo. Suponiendo que el elemento base es `base`, necesitamos desplazar todos los elementos desde el índice objetivo hasta `base` una posición a la derecha, luego asignar `base` al índice objetivo.

![Operación de inserción única](insertion_sort.assets/insertion_operation.png)

## Proceso del algoritmo

El proceso general del ordenamiento por inserción se muestra en la figura a continuación.

1.  Considere el primer elemento del arreglo como ordenado.
2.  Seleccione el segundo elemento como `base`, insértelo en su posición correcta, **dejando los dos primeros elementos ordenados**.
3.  Seleccione el tercer elemento como `base`, insértelo en su posición correcta, **dejando los tres primeros elementos ordenados**.
4.  Continuando de esta manera, en la iteración final, el último elemento se toma como `base`, y después de insertarlo en la posición correcta, **todos los elementos están ordenados**.

![Proceso de ordenamiento por inserción](insertion_sort.assets/insertion_sort_overview.png)

El código de ejemplo es el siguiente:

```src
[file]{insertion_sort}-[class]{}-[func]{insertion_sort}
```

## Características del algoritmo

-   **La complejidad temporal es $O(n^2)$, ordenamiento adaptativo**: En el peor de los casos, cada operación de inserción requiere $n - 1$, $n-2$, ..., $2$, $1$ bucles, sumando un total de $(n - 1) n / 2$, por lo tanto, la complejidad temporal es $O(n^2)$. En el caso de datos ordenados, la operación de inserción terminará temprano. Cuando el arreglo de entrada está completamente ordenado, el ordenamiento por inserción logra la mejor complejidad temporal de $O(n)$.
-   **La complejidad espacial es $O(1)$, ordenamiento in situ**: Los punteros $i$ y $j$ utilizan una cantidad constante de espacio extra.
-   **Ordenamiento estable**: Durante la operación de inserción, insertamos elementos a la derecha de elementos iguales, sin cambiar su orden.

## Ventajas del ordenamiento por inserción

La complejidad temporal del ordenamiento por inserción es $O(n^2)$, mientras que la complejidad temporal del ordenamiento rápido, que estudiaremos a continuación, es $O(n \log n)$. Aunque el ordenamiento por inserción tiene una complejidad temporal mayor, **suele ser más rápido en tamaños de entrada pequeños**.

Esta conclusión es similar a la de la búsqueda lineal y binaria. Los algoritmos como el ordenamiento rápido que tienen una complejidad temporal de $O(n \log n)$ y se basan en la estrategia de divide y vencerás a menudo implican más operaciones unitarias. Para tamaños de entrada pequeños, los valores numéricos de $n^2$ y $n \log n$ son cercanos, y la complejidad no domina, con el número de operaciones unitarias por ronda jugando un papel decisivo.

De hecho, muchos lenguajes de programación (como Java) utilizan el ordenamiento por inserción dentro de sus funciones de ordenamiento incorporadas. El enfoque general es: para arreglos largos, usar algoritmos de ordenamiento basados en estrategias de divide y vencerás, como el ordenamiento rápido; para arreglos cortos, usar directamente el ordenamiento por inserción.

Aunque el ordenamiento de burbuja, el ordenamiento por selección y el ordenamiento por inserción tienen una complejidad temporal de $O(n^2)$, en la práctica, **el ordenamiento por inserción se usa comúnmente más que el ordenamiento de burbuja y el ordenamiento por selección**, principalmente por las siguientes razones.

-   El ordenamiento de burbuja se basa en el intercambio de elementos, lo que requiere el uso de una variable temporal, lo que implica 3 operaciones unitarias; el ordenamiento por inserción se basa en la asignación de elementos, lo que requiere solo 1 operación unitaria. Por lo tanto, **la sobrecarga computacional del ordenamiento de burbuja es generalmente mayor que la del ordenamiento por inserción**.
-   La complejidad temporal del ordenamiento por selección siempre es $O(n^2)$. **Dado un conjunto de datos parcialmente ordenados, el ordenamiento por inserción suele ser más eficiente que el ordenamiento por selección**.
-   El ordenamiento por selección es inestable y no se puede aplicar al ordenamiento multinivel.

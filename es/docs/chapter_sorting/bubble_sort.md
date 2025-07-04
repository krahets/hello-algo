# Ordenamiento de burbuja

El <u>ordenamiento de burbuja</u> funciona comparando e intercambiando continuamente elementos adyacentes. Este proceso es como burbujas que suben de abajo hacia arriba, de ahí el nombre "ordenamiento de burbuja".

Como se muestra en la figura a continuación, el proceso de burbujeo se puede simular utilizando intercambios de elementos: comience desde el extremo izquierdo del arreglo y muévase hacia la derecha, comparando cada par de elementos adyacentes. Si el elemento izquierdo es mayor que el derecho, intercámbielos. Después del recorrido, el elemento más grande habrá subido al extremo derecho del arreglo.

=== "<1>"
    ![Simulación del proceso de burbujeo mediante el intercambio de elementos](bubble_sort.assets/bubble_operation_step1.png)

=== "<2>"
    ![bubble_operation_step2](bubble_sort.assets/bubble_operation_step2.png)

=== "<3>"
    ![bubble_operation_step3](bubble_sort.assets/bubble_operation_step3.png)

=== "<4>"
    ![bubble_operation_step4](bubble_sort.assets/bubble_operation_step4.png)

=== "<5>"
    ![bubble_operation_step5](bubble_sort.assets/bubble_operation_step5.png)

=== "<6>"
    ![bubble_operation_step6](bubble_sort.assets/bubble_operation_step6.png)

=== "<7>"
    ![bubble_operation_step7](bubble_sort.assets/bubble_operation_step7.png)

## Proceso del algoritmo

Supongamos que el arreglo tiene longitud $n$. Los pasos del ordenamiento de burbuja se muestran en la figura a continuación:

1.  Primero, realice una pasada de "burbujeo" en $n$ elementos, **intercambiando el elemento más grande a su posición correcta**.
2.  A continuación, realice una pasada de "burbujeo" en los $n - 1$ elementos restantes, **intercambiando el segundo elemento más grande a su posición correcta**.
3.  Continúe de esta manera; después de $n - 1$ pasadas, **los $n - 1$ elementos más grandes se habrán movido a sus posiciones correctas**.
4.  El único elemento restante **debe** ser el más pequeño, por lo que **no** se requiere más ordenamiento. En este punto, el arreglo está ordenado.

![Proceso de ordenamiento de burbuja](bubble_sort.assets/bubble_sort_overview.png)

El código de ejemplo es el siguiente:

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort}
```

## Optimización de la eficiencia

Si no se producen intercambios durante una ronda de "burbujeo", el arreglo ya está ordenado, por lo que podemos regresar inmediatamente. Para detectar esto, podemos agregar una variable `flag`; cada vez que no se realicen intercambios en una pasada, establecemos la bandera y regresamos temprano.

Incluso con esta optimización, la complejidad temporal en el peor de los casos y la complejidad temporal promedio del ordenamiento de burbuja siguen siendo $O(n^2)$. Sin embargo, si el arreglo de entrada ya está ordenado, la complejidad temporal en el mejor de los casos puede ser tan baja como $O(n)$.

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort_with_flag}
```

## Características del algoritmo

-   **Complejidad temporal de $O(n^2)$, ordenamiento adaptativo.** Hay $n - 1$ iteraciones en el bucle externo, con la longitud de la sección no ordenada comenzando en $n$ en la primera iteración y disminuyendo a $2$ en la última iteración, lo que suma $(n - 1) n / 2$. Con una optimización `flag`, la complejidad temporal en el mejor de los casos puede alcanzar $O(n)$ cuando el arreglo ya está ordenado.
-   **Complejidad espacial de $O(1)$, ordenamiento in situ.** Solo se utiliza una cantidad constante de espacio extra por los punteros $i$ y $j$.
-   **Ordenamiento estable.** Debido a que los elementos iguales no se intercambian durante el "burbujeo", su orden original se conserva, lo que lo convierte en un ordenamiento estable.

# Ordenamiento por mezcla

El <u>ordenamiento por mezcla</u> es un algoritmo de ordenamiento basado en la estrategia de divide y vencerás, que involucra las fases de "dividir" y "mezclar" que se muestran en la figura a continuación.

1.  **Fase de división**: Divida recursivamente el arreglo desde el punto medio, transformando el problema de ordenamiento de un arreglo largo en arreglos más cortos.
2.  **Fase de mezcla**: Deje de dividir cuando la longitud del subarreglo sea 1, y luego comience a mezclar. Los dos arreglos ordenados más cortos se mezclan continuamente en un arreglo ordenado más largo hasta que el proceso se completa.

![Las fases de división y mezcla del ordenamiento por mezcla](merge_sort.assets/merge_sort_overview.png)

## Flujo de trabajo del algoritmo

Como se muestra en la figura a continuación, la "fase de división" divide recursivamente el arreglo desde el punto medio en dos subarreglos de arriba a abajo.

1.  Calcule el punto medio `mid`, divida recursivamente el subarreglo izquierdo (intervalo `[left, mid]`) y el subarreglo derecho (intervalo `[mid + 1, right]`).
2.  Continúe con el paso `1.` recursivamente hasta que la longitud del subarreglo sea 1, luego se detiene.

La "fase de mezcla" combina los subarreglos izquierdo y derecho en un arreglo ordenado de abajo hacia arriba. Es importante tener en cuenta que la mezcla comienza con subarreglos de longitud 1, y cada subarreglo se ordena durante la fase de mezcla.

=== "<1>"
    ![Proceso de ordenamiento por mezcla](merge_sort.assets/merge_sort_step1.png)

=== "<2>"
    ![merge_sort_step2](merge_sort.assets/merge_sort_step2.png)

=== "<3>"
    ![merge_sort_step3](merge_sort.assets/merge_sort_step3.png)

=== "<4>"
    ![merge_sort_step4](merge_sort.assets/merge_sort_step4.png)

=== "<5>"
    ![merge_sort_step5](merge_sort.assets/merge_sort_step5.png)

=== "<6>"
    ![merge_sort_step6](merge_sort.assets/merge_sort_step6.png)

=== "<7>"
    ![merge_sort_step7](merge_sort.assets/merge_sort_step7.png)

=== "<8>"
    ![merge_sort_step8](merge_sort.assets/merge_sort_step8.png)

=== "<9>"
    ![merge_sort_step9](merge_sort.assets/merge_sort_step9.png)

=== "<10>"
    ![merge_sort_step10](merge_sort.assets/merge_sort_step10.png)

Se puede observar que el orden de recursión en el ordenamiento por mezcla es consistente con el recorrido en postorden de un árbol binario.

-   **Recorrido en postorden**: Primero recorre recursivamente el subárbol izquierdo, luego el subárbol derecho y finalmente procesa el nodo raíz.
-   **Ordenamiento por mezcla**: Primero procesa recursivamente el subarreglo izquierdo, luego el subarreglo derecho y finalmente realiza la mezcla.

La implementación del ordenamiento por mezcla se muestra en el siguiente código. Tenga en cuenta que el intervalo a mezclar en `nums` es `[left, right]`, mientras que el intervalo correspondiente en `tmp` es `[0, right - left]`.

```src
[file]{merge_sort}-[class]{}-[func]{merge_sort}
```

## Características del algoritmo

-   **Complejidad temporal de $O(n \log n)$, ordenamiento no adaptativo**: La división crea un árbol de recursión de altura $\log n$, con cada capa fusionando un total de $n$ operaciones, lo que resulta en una complejidad temporal general de $O(n \log n)$.
-   **Complejidad espacial de $O(n)$, ordenamiento no in situ**: La profundidad de recursión es $\log n$, utilizando $O(\log n)$ de espacio de marco de pila. La operación de fusión requiere arreglos auxiliares, utilizando un espacio adicional de $O(n)$.
-   **Ordenamiento estable**: Durante el proceso de fusión, el orden de los elementos iguales permanece sin cambios.

## Ordenamiento de listas enlazadas

Para las listas enlazadas, el ordenamiento por mezcla tiene ventajas significativas sobre otros algoritmos de ordenamiento. **Puede optimizar la complejidad espacial de la tarea de ordenamiento de listas enlazadas a $O(1)$**.

-   **Fase de división**: Se puede usar la "iteración" en lugar de la "recursión" para realizar el trabajo de división de la lista enlazada, lo que ahorra el espacio de marco de pila utilizado por la recursión.
-   **Fase de mezcla**: En las listas enlazadas, las operaciones de inserción y eliminación de nodos se pueden lograr cambiando las referencias (punteros), por lo que no es necesario crear listas adicionales durante la fase de mezcla (combinando dos listas ordenadas cortas en una lista ordenada larga).

Los detalles de implementación son relativamente complejos, y los lectores interesados pueden consultar materiales relacionados para aprender.

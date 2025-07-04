# Ordenamiento por montículos

!!! tip

    Antes de leer esta sección, asegúrese de haber completado el capítulo "Montículo".

El <u>ordenamiento por montículos</u> es un algoritmo de ordenamiento eficiente basado en la estructura de datos de montículo. Podemos implementar el ordenamiento por montículos utilizando las operaciones de "creación de montículo" y "extracción de elementos" que ya hemos aprendido.

1.  Introduzca el arreglo y construya un montículo mínimo, donde el elemento más pequeño está en la parte superior del montículo.
2.  Realice continuamente la operación de extracción, registre los elementos extraídos secuencialmente para obtener una lista ordenada de menor a mayor.

Aunque el método anterior es factible, requiere un arreglo adicional para almacenar los elementos extraídos, lo que consume algo de espacio. En la práctica, solemos utilizar una implementación más elegante.

## Flujo del algoritmo

Supongamos que la longitud del arreglo es $n$, el proceso de ordenamiento por montículos es el siguiente.

1.  Introduzca el arreglo y establezca un montículo máximo. Después de este paso, el elemento más grande se posiciona en la parte superior del montículo.
2.  Intercambie el elemento superior del montículo (el primer elemento) con el elemento inferior del montículo (el último elemento). Después de este intercambio, reduzca la longitud del montículo en $1$ y aumente el recuento de elementos ordenados en $1$.
3.  Comenzando desde la parte superior del montículo, realice la operación de tamizado hacia abajo de arriba a abajo. Después del tamizado hacia abajo, la propiedad del montículo se restaura.
4.  Repita los pasos `2.` y `3.` en un bucle durante $n - 1$ rondas para completar el ordenamiento del arreglo.

!!! tip

    De hecho, la operación de extracción de elementos también incluye los pasos `2.` y `3.`, con un paso adicional para sacar (eliminar) el elemento extraído del montículo.

=== "<1>"
    ![Proceso de ordenamiento por montículos](heap_sort.assets/heap_sort_step1.png)

=== "<2>"
    ![heap_sort_step2](heap_sort.assets/heap_sort_step2.png)

=== "<3>"
    ![heap_sort_step3](heap_sort.assets/heap_sort_step3.png)

=== "<4>"
    ![heap_sort_step4](heap_sort.assets/heap_sort_step4.png)

=== "<5>"
    ![heap_sort_step5](heap_sort.assets/heap_sort_step5.png)

=== "<6>"
    ![heap_sort_step6](heap_sort.assets/heap_sort_step6.png)

=== "<7>"
    ![heap_sort_step7](heap_sort.assets/heap_sort_step7.png)

=== "<8>"
    ![heap_sort_step8](heap_sort.assets/heap_sort_step8.png)

=== "<9>"
    ![heap_sort_step9](heap_sort.assets/heap_sort_step9.png)

=== "<10>"
    ![heap_sort_step10](heap_sort.assets/heap_sort_step10.png)

=== "<11>"
    ![heap_sort_step11](heap_sort.assets/heap_sort_step11.png)

=== "<12>"
    ![heap_sort_step12](heap_sort.assets/heap_sort_step12.png)

En la implementación del código, utilizamos la función de tamizado hacia abajo `sift_down()` del capítulo "Montículo". Es importante tener en cuenta que, dado que la longitud del montículo disminuye a medida que se extrae el elemento máximo, necesitamos agregar un parámetro de longitud $n$ a la función `sift_down()` para especificar la longitud efectiva actual del montículo. El código se muestra a continuación:

```src
[file]{heap_sort}-[class]{}-[func]{heap_sort}
```

## Características del algoritmo

-   **Complejidad temporal de $O(n \log n)$, ordenamiento no adaptativo**: La creación del montículo utiliza tiempo $O(n)$. La extracción del elemento más grande del montículo toma tiempo $O(\log n)$, en un bucle de $n - 1$ rondas.
-   **Complejidad espacial de $O(1)$, ordenamiento in situ**: Unas pocas variables de puntero utilizan espacio $O(1)$. Las operaciones de intercambio de elementos y heapificación se realizan en el arreglo original.
-   **Ordenamiento no estable**: Las posiciones relativas de los elementos iguales pueden cambiar durante el intercambio de los elementos superior e inferior del montículo.

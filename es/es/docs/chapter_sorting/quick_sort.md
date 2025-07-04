# Ordenamiento rápido

El <u>ordenamiento rápido</u> es un algoritmo de ordenamiento basado en la estrategia de divide y vencerás, conocido por su eficiencia y amplia aplicación.

La operación central del ordenamiento rápido es el "particionamiento del pivote", que tiene como objetivo seleccionar un elemento del arreglo como "pivote" y mover todos los elementos menores que el pivote a su lado izquierdo, mientras que mueve todos los elementos mayores que el pivote a su lado derecho. Específicamente, el proceso de particionamiento del pivote se ilustra en la figura a continuación.

1.  Seleccione el elemento más a la izquierda del arreglo como pivote, e inicialice dos punteros `i` y `j` para que apunten a los dos extremos del arreglo respectivamente.
2.  Establezca un bucle donde cada ronda use `i` (`j`) para buscar el primer elemento mayor (menor) que el pivote, luego intercambie estos dos elementos.
3.  Repita el paso `2.` hasta que `i` y `j` se encuentren, finalmente intercambie el pivote al límite entre los dos subarreglos.

=== "<1>"
    ![Proceso de división del pivote](quick_sort.assets/pivot_division_step1.png)

=== "<2>"
    ![pivot_division_step2](quick_sort.assets/pivot_division_step2.png)

=== "<3>"
    ![pivot_division_step3](quick_sort.assets/pivot_division_step3.png)

=== "<4>"
    ![pivot_division_step4](quick_sort.assets/pivot_division_step4.png)

=== "<5>"
    ![pivot_division_step5](quick_sort.assets/pivot_division_step5.png)

=== "<6>"
    ![pivot_division_step6](quick_sort.assets/pivot_division_step6.png)

=== "<7>"
    ![pivot_division_step7](quick_sort.assets/pivot_division_step7.png)

=== "<8>"
    ![pivot_division_step8](quick_sort.assets/pivot_division_step8.png)

=== "<9>"
    ![pivot_division_step9](quick_sort.assets/pivot_division_step9.png)

Después del particionamiento del pivote, el arreglo original se divide en tres partes: subarreglo izquierdo, pivote y subarreglo derecho, satisfaciendo "cualquier elemento en el subarreglo izquierdo $\leq$ pivote $\leq$ cualquier elemento en el subarreglo derecho". Por lo tanto, solo necesitamos ordenar estos dos subarreglos.

!!! note "Estrategia de divide y vencerás para el ordenamiento rápido"

    La esencia del particionamiento del pivote es simplificar el problema de ordenamiento de un arreglo más largo en dos arreglos más cortos.

```src
[file]{quick_sort}-[class]{quick_sort}-[func]{partition}
```

## Proceso del algoritmo

El proceso general del ordenamiento rápido se muestra en la figura a continuación.

1.  Primero, realice un "particionamiento del pivote" en el arreglo original para obtener los subarreglos izquierdo y derecho sin ordenar.
2.  Luego, realice recursivamente un "particionamiento del pivote" en los subarreglos izquierdo y derecho por separado.
3.  Continúe recursivamente hasta que la longitud del subarreglo sea 1, completando así el ordenamiento de todo el arreglo.

![Proceso de ordenamiento rápido](quick_sort.assets/quick_sort_overview.png)

```src
[file]{quick_sort}-[class]{quick_sort}-[func]{quick_sort}
```

## Características del algoritmo

-   **Complejidad temporal de $O(n \log n)$, ordenamiento no adaptativo**: En casos promedio, los niveles recursivos de particionamiento del pivote son $\log n$, y el número total de bucles por nivel es $n$, utilizando $O(n \log n)$ tiempo en total. En el peor de los casos, cada ronda de particionamiento del pivote divide un arreglo de longitud $n$ en dos subarreglos de longitudes $0$ y $n - 1$, cuando el número de niveles recursivos alcanza $n$, el número de bucles en cada nivel es $n$, y el tiempo total utilizado es $O(n^2)$.
-   **Complejidad espacial de $O(n)$, ordenamiento in situ**: En el caso de que el arreglo de entrada esté completamente invertido, la profundidad recursiva en el peor de los casos alcanza $n$, utilizando $O(n)$ de espacio de marco de pila. La operación de ordenamiento se realiza en el arreglo original sin la ayuda de arreglos adicionales.
-   **Ordenamiento no estable**: En el paso final del particionamiento del pivote, el pivote puede intercambiarse a la derecha de elementos iguales.

## ¿Por qué el ordenamiento rápido es rápido?

Como su nombre indica, el ordenamiento rápido debe tener ciertas ventajas en términos de eficiencia. Aunque la complejidad temporal promedio del ordenamiento rápido es la misma que la del "ordenamiento por fusión" y el "ordenamiento por montículos", generalmente es más eficiente por las siguientes razones.

-   **Baja probabilidad de escenarios en el peor de los casos**: Aunque la complejidad temporal en el peor de los casos del ordenamiento rápido es $O(n^2)$, menos estable que el ordenamiento por fusión, en la mayoría de los casos, el ordenamiento rápido puede operar con una complejidad temporal de $O(n \log n)$.
-   **Alta utilización de la caché**: Durante la operación de particionamiento del pivote, el sistema puede cargar todo el subarreglo en la caché, lo que permite un acceso más eficiente a los elementos. En contraste, algoritmos como el "ordenamiento por montículos" necesitan acceder a los elementos de forma discontinua, careciendo de esta característica.
-   **Pequeño coeficiente constante de complejidad**: Entre los tres algoritmos mencionados anteriormente, el ordenamiento rápido tiene el menor número total de operaciones como comparaciones, asignaciones e intercambios. Esto es similar a por qué el "ordenamiento por inserción" es más rápido que el "ordenamiento de burbuja".

## Optimización del pivote

**La eficiencia temporal del ordenamiento rápido puede degradarse con ciertas entradas**. Por ejemplo, si el arreglo de entrada está completamente invertido, dado que seleccionamos el elemento más a la izquierda como pivote, después del particionamiento del pivote, el pivote se intercambia al extremo derecho del arreglo, lo que hace que la longitud del subarreglo izquierdo sea $0$ y la longitud del subarreglo derecho sea $n - 1$. Continuando de esta manera, cada ronda de particionamiento del pivote tendrá una longitud de subarreglo de $0$, y la estrategia de divide y vencerás falla, degradando el ordenamiento rápido a una forma similar al "ordenamiento de burbuja".

Para evitar esta situación, **podemos optimizar la estrategia de selección del pivote en el particionamiento del pivote**. Por ejemplo, podemos seleccionar aleatoriamente un elemento como pivote. Sin embargo, si la suerte no está de nuestro lado y seleccionamos pivotes subóptimos de forma consistente, la eficiencia sigue sin ser satisfactoria.

Es importante tener en cuenta que los lenguajes de programación suelen generar "números pseudoaleatorios". Si construimos un caso de prueba específico para una secuencia de números pseudoaleatorios, la eficiencia del ordenamiento rápido aún puede degradarse.

Para una mejora adicional, podemos seleccionar tres elementos candidatos (generalmente el primer, último y el elemento central del arreglo), **y usar la mediana de estos tres elementos candidatos como pivote**. De esta manera, la probabilidad de que el pivote "no sea ni demasiado pequeño ni demasiado grande" aumentará considerablemente. Por supuesto, también podemos seleccionar más elementos candidatos para mejorar aún más la robustez del algoritmo. Con este método, la probabilidad de que la complejidad temporal se degrade a $O(n^2)$ se reduce en gran medida.

El código de ejemplo es el siguiente:

```src
[file]{quick_sort}-[class]{quick_sort_median}-[func]{partition}
```

## Optimización de la recursión de cola

**Con ciertas entradas, el ordenamiento rápido puede ocupar más espacio**. Por ejemplo, considere un arreglo de entrada completamente ordenado. Sea $m$ la longitud del subarreglo en la recursión. En cada ronda de particionamiento del pivote, se producen un subarreglo izquierdo de longitud $0$ y un subarreglo derecho de longitud $m - 1$. Esto significa que el tamaño del problema se reduce en un solo elemento por cada llamada recursiva, lo que resulta en una reducción muy pequeña en cada nivel de recursión.
Como resultado, la altura del árbol de recursión puede alcanzar $n - 1$, lo que requiere $O(n)$ de espacio de marco de pila.

Para evitar la acumulación de espacio de marco de pila, podemos comparar las longitudes de los dos subarreglos después de cada ronda de ordenamiento del pivote, **y solo ordenar recursivamente el subarreglo más corto**. Dado que la longitud del subarreglo más corto no excederá $n / 2$, este método asegura que la profundidad de la recursión no exceda $\log n$, optimizando así la complejidad espacial en el peor de los casos a $O(\log n)$. El código es el siguiente:

```src
[file]{quick_sort}-[class]{quick_sort_tail_call}-[func]{quick_sort}
```

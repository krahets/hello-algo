# Algoritmos de divide y vencerás

<u>Divide y vencerás</u> es una estrategia algorítmica importante y popular. Como su nombre indica, el algoritmo se implementa típicamente de forma recursiva y consta de dos pasos: "dividir" y "vencer".

1.  **Dividir (fase de partición)**: Descomponer recursivamente el problema original en dos o más subproblemas más pequeños hasta que se alcance el subproblema más pequeño.
2.  **Vencer (fase de fusión)**: Comenzando desde el subproblema más pequeño con solución conocida, construimos la solución al problema original fusionando las soluciones de los subproblemas de abajo hacia arriba.

Como se muestra en la figura a continuación, el "ordenamiento por mezcla" es una de las aplicaciones típicas de la estrategia de divide y vencerás.

1.  **Dividir**: Dividir recursivamente el arreglo original (problema original) en dos subarreglos (subproblemas), hasta que el subarreglo tenga solo un elemento (subproblema más pequeño).
2.  **Vencer**: Fusionar los subarreglos ordenados (soluciones a los subproblemas) de abajo hacia arriba para obtener un arreglo original ordenado (solución al problema original).

![Estrategia de divide y vencerás del ordenamiento por mezcla](divide_and_conquer.assets/divide_and_conquer_merge_sort.png)

## Cómo identificar problemas de divide y vencerás

Si un problema es adecuado para una solución de divide y vencerás generalmente se puede decidir basándose en los siguientes criterios.

1.  **El problema se puede dividir en otros más pequeños**: El problema original se puede dividir en subproblemas más pequeños y similares, y dicho proceso se puede realizar recursivamente de la misma manera.
2.  **Los subproblemas son independientes**: No hay superposición entre los subproblemas, y son independientes y se pueden resolver por separado.
3.  **Las soluciones a los subproblemas se pueden fusionar**: La solución al problema original se deriva combinando las soluciones de los subproblemas.

Claramente, el ordenamiento por mezcla cumple estos tres criterios.

1.  **El problema se puede dividir en otros más pequeños**: Dividir recursivamente el arreglo (problema original) en dos subarreglos (subproblemas).
2.  **Los subproblemas son independientes**: Cada subarreglo se puede ordenar de forma independiente (los subproblemas se pueden resolver de forma independiente).
3.  **Las soluciones a los subproblemas se pueden fusionar**: Dos subarreglos ordenados (soluciones a los subproblemas) se pueden fusionar en un arreglo ordenado (solución al problema original).

## Mejorar la eficiencia a través de divide y vencerás

La **estrategia de divide y vencerás no solo resuelve eficazmente los problemas algorítmicos, sino que también a menudo mejora la eficiencia**. En los algoritmos de ordenamiento, el ordenamiento rápido, el ordenamiento por mezcla y el ordenamiento por montículos son más rápidos que el ordenamiento por selección, el ordenamiento de burbuja y el ordenamiento por inserción porque aplican la estrategia de divide y vencerás.

Podemos tener una pregunta en mente: **¿Por qué divide y vencerás puede mejorar la eficiencia del algoritmo, y cuál es la lógica subyacente?** En otras palabras, ¿por qué dividir un problema en subproblemas, resolverlos y combinar sus soluciones para abordar el problema original ofrece más eficiencia que resolver directamente el problema original? Esta pregunta se puede analizar desde dos aspectos: recuento de operaciones y computación paralela.

### Optimización del recuento de operaciones

Tomando el "ordenamiento de burbuja" como ejemplo, requiere $O(n^2)$ tiempo para procesar un arreglo de longitud $n$. Supongamos que dividimos el arreglo desde el punto medio en dos subarreglos como se muestra en la figura a continuación, dicha división requiere $O(n)$ tiempo. Ordenar cada subarreglo requiere $O((n / 2)^2)$ tiempo. Y fusionar los dos subarreglos requiere $O(n)$ tiempo. Por lo tanto, la complejidad temporal general es:

$$
O(n + (\frac{n}{2})^2 \times 2 + n) = O(\frac{n^2}{2} + 2n)
$$

![Ordenamiento de burbuja antes y después de la partición del arreglo](divide_and_conquer.assets/divide_and_conquer_bubble_sort.png)

Calculemos la siguiente desigualdad, donde el lado izquierdo representa el número total de operaciones antes de la división y el lado derecho representa el número total de operaciones después de la división, respectivamente:

$$
\begin{aligned}
n^2 & > \frac{n^2}{2} + 2n \\
n^2 - \frac{n^2}{2} - 2n & > 0 \\
n(n - 4) & > 0
\end{aligned}
$$

**Esto significa que cuando $n > 4$, el número de operaciones después de la partición es menor, lo que lleva a un mejor rendimiento**. Tenga en cuenta que la complejidad temporal después de la partición sigue siendo cuadrática $O(n^2)$, pero el factor constante en la complejidad ha disminuido.

Podemos ir aún más lejos. **¿Qué tal si seguimos dividiendo los subarreglos desde sus puntos medios en dos subarreglos** hasta que los subarreglos tengan solo un elemento? Esta idea es en realidad el "ordenamiento por mezcla", con una complejidad temporal de $O(n \log n)$.

Intentemos algo un poco diferente de nuevo. **¿Qué tal si dividimos en más particiones en lugar de solo dos?** Por ejemplo, ¿dividimos uniformemente el arreglo original en $k$ subarreglos? Este enfoque es muy similar al "ordenamiento por cubetas", que es muy adecuado para ordenar datos masivos. Teóricamente, la complejidad temporal puede alcanzar $O(n + k)$.

### Optimización a través de la computación paralela

Sabemos que los subproblemas generados por divide y vencerás son independientes entre sí, **lo que significa que pueden resolverse en paralelo.** Como resultado, divide y vencerás no solo reduce la complejidad temporal del algoritmo, **sino que también facilita la optimización paralela por parte de los sistemas operativos modernos.**

La optimización paralela es particularmente efectiva en entornos con múltiples núcleos o procesadores. Como el sistema puede procesar múltiples subproblemas simultáneamente, utilizando plenamente los recursos informáticos, el tiempo de ejecución general se reduce significativamente.

Por ejemplo, en el "ordenamiento por cubetas" que se muestra en la figura a continuación, dividimos datos masivos uniformemente en varias cubetas. Los trabajos de ordenar cada cubeta se pueden asignar a las unidades de computación disponibles. Una vez que todos los trabajos están hechos, todas las cubetas ordenadas se fusionan para producir el resultado final.

![Computación paralela del ordenamiento por cubetas](divide_and_conquer.assets/divide_and_conquer_parallel_computing.png)

## Aplicaciones comunes de divide y vencerás

Divide y vencerás se puede utilizar para resolver muchos problemas algorítmicos clásicos.

-   **Encontrar el par de puntos más cercano**: Este algoritmo funciona dividiendo el conjunto de puntos en dos mitades. Luego, encuentra recursivamente el par más cercano en cada mitad. Finalmente, considera los pares que abarcan las dos mitades para encontrar el par más cercano en general.
-   **Multiplicación de enteros grandes**: Un algoritmo se llama Karatsuba. Descompone la multiplicación de enteros grandes en varias multiplicaciones y sumas de enteros más pequeños.
-   **Multiplicación de matrices**: Un ejemplo es el algoritmo de Strassen. Descompone una multiplicación de matrices grandes en múltiples multiplicaciones y sumas de matrices pequeñas.
-   **Problema de las Torres de Hanói**: El problema de las Torres de Hanói se puede resolver recursivamente, una aplicación típica de la estrategia de divide y vencerás.
-   **Resolución de pares de inversión**: En una secuencia, si un número precedente es mayor que un número siguiente, entonces estos dos números constituyen un par de inversión. La resolución del problema de pares de inversión puede utilizar la idea de divide y vencerás, con la ayuda del ordenamiento por mezcla.

Divide y vencerás también se aplica ampliamente en el diseño de algoritmos y estructuras de datos.

-   **Búsqueda binaria**: La búsqueda binaria divide un arreglo ordenado en dos mitades desde el índice del punto medio. Y luego, basándose en el resultado de la comparación entre el valor objetivo y el valor del elemento central, se descarta una mitad. La búsqueda continúa en la mitad restante con el mismo proceso hasta que se encuentra el objetivo o no queda ningún elemento.
-   **Ordenamiento por mezcla**: Ya se introdujo al principio de esta sección, no se necesita más elaboración.
-   **Ordenamiento rápido**: El ordenamiento rápido elige un valor pivote para dividir el arreglo en dos subarreglos, uno con elementos más pequeños que el pivote y el otro con elementos más grandes que el pivote. Dicho proceso continúa contra cada uno de estos dos subarreglos hasta que solo contienen un elemento.
-   **Ordenamiento por cubetas**: La idea básica del ordenamiento por cubetas es distribuir los datos en múltiples cubetas. Después de ordenar los elementos dentro de cada cubeta, recuperar los elementos de las cubetas en orden para obtener un arreglo ordenado.
-   **Árboles**: Por ejemplo, árboles de búsqueda binaria, árboles AVL, árboles rojo-negro, árboles B y árboles B+, etc. Sus operaciones, como búsqueda, inserción y eliminación, pueden considerarse aplicaciones de la estrategia de divide y vencerás.
-   **Montículo**: Un montículo es un tipo especial de árbol binario completo. Sus diversas operaciones, como inserción, eliminación y heapify, en realidad implican la idea de divide y vencerás.
-   **Tabla hash**: Aunque las tablas hash no aplican directamente divide y vencerás, algunas soluciones de resolución de colisiones hash aplican indirectamente la estrategia. Por ejemplo, las listas largas en el direccionamiento encadenado pueden convertirse en árboles rojo-negro para mejorar la eficiencia de la consulta.

Se puede ver que **divide y vencerás es una idea algorítmica sutilmente omnipresente**, incrustada en varios algoritmos y estructuras de datos.

# Los algoritmos están en todas partes

Cuando escuchamos la palabra "algoritmo", naturalmente pensamos en las matemáticas. Sin embargo, muchos algoritmos no involucran matemáticas complejas, sino que se basan más en la lógica básica, que se puede ver en todas partes en nuestra vida diaria.

Antes de discutir formalmente los algoritmos, vale la pena compartir un hecho interesante: **ya ha aprendido inconscientemente muchos algoritmos y se ha acostumbrado a aplicarlos en su vida diaria**. Aquí, daré algunos ejemplos específicos para probar este punto.

**Ejemplo 1: Consultar un diccionario**. En un diccionario de inglés, las palabras se enumeran alfabéticamente. Supongamos que estamos buscando una palabra que comienza con la letra $r$. Esto generalmente se hace de la siguiente manera:

1. Abra el diccionario aproximadamente a la mitad y verifique la primera letra de la página, digamos que la letra es $m$.
2. Dado que $r$ viene después de $m$ en el alfabeto, podemos ignorar la primera mitad del diccionario y centrarnos en la segunda mitad.
3. Repita los pasos `1.` y `2.` hasta que encuentre la página donde la palabra comienza con $r$.

=== "<1>"
    ![Proceso de consulta de un diccionario](algorithms_are_everywhere.assets/binary_search_dictionary_step1.png)

=== "<2>"
    ![Búsqueda binaria en el diccionario, paso 2](algorithms_are_everywhere.assets/binary_search_dictionary_step2.png)

=== "<3>"
    ![Búsqueda binaria en el diccionario, paso 3](algorithms_are_everywhere.assets/binary_search_dictionary_step3.png)

=== "<4>"
    ![Búsqueda binaria en el diccionario, paso 4](algorithms_are_everywhere.assets/binary_search_dictionary_step4.png)

=== "<5>"
    ![Búsqueda binaria en el diccionario, paso 5](algorithms_are_everywhere.assets/binary_search_dictionary_step5.png)

Esta habilidad esencial para los estudiantes de primaria, consultar un diccionario, es en realidad el famoso algoritmo de "búsqueda binaria". Desde la perspectiva de la estructura de datos, podemos considerar el diccionario como un "arreglo" ordenado; desde una perspectiva algorítmica, la serie de acciones tomadas para buscar una palabra en el diccionario se puede ver como una "búsqueda binaria".

**Ejemplo 2: Organizar las cartas de juego**. Cuando jugamos a las cartas, necesitamos organizar las cartas en nuestra mano en orden ascendente, como se muestra en el siguiente proceso.

1. Divida las cartas de juego en secciones "ordenadas" y "desordenadas", asumiendo que inicialmente la carta del extremo izquierdo ya está en orden.
2. Saque una carta de la sección desordenada e insértela en la posición correcta en la sección ordenada; después de esto, las dos cartas del extremo izquierdo están en orden.
3. Continúe repitiendo el paso `2.` hasta que todas las cartas estén en orden.

![Proceso de clasificación de cartas de juego](algorithms_are_everywhere.assets/playing_cards_sorting.png)

El método anterior de organizar las cartas de juego es esencialmente el algoritmo de "ordenamiento por inserción", que es muy eficiente para conjuntos de datos pequeños. Las funciones de ordenación de muchos lenguajes de programación incluyen el ordenamiento por inserción.

**Ejemplo 3: Dar cambio**. Supongamos que compramos productos por valor de $69$ yuanes en un supermercado y le damos al cajero $100$ yuanes, entonces el cajero necesita darnos $31$ yuanes de cambio. Naturalmente, completarían el proceso de pensamiento como se muestra en la figura a continuación.

1. Las opciones son monedas más pequeñas que $31$, incluidas $1$, $5$, $10$ y $20$.
2. Saque el $20$ más grande de las opciones, dejando $31 - 20 = 11$.
3. Saque el $10$ más grande de las opciones restantes, dejando $11 - 10 = 1$.
4. Saque el $1$ más grande de las opciones restantes, dejando $1 - 1 = 0$.
5. Complete el proceso de dar cambio, con la solución siendo $20 + 10 + 1 = 31$.

![Proceso de dar cambio](algorithms_are_everywhere.assets/greedy_change.png)

En los pasos anteriores, tomamos la mejor decisión en cada paso (usando la denominación más grande posible), lo que finalmente da como resultado un plan factible para dar cambio. Desde la perspectiva de las estructuras de datos y los algoritmos, este método es esencialmente un algoritmo "codicioso".

Desde cocinar una comida hasta los viajes interestelares, casi toda la resolución de problemas involucra algoritmos. El advenimiento de las computadoras nos permite almacenar estructuras de datos en la memoria y escribir código para llamar a la CPU y la GPU para ejecutar algoritmos. De esta manera, podemos transferir problemas de la vida real a las computadoras, resolviendo varios problemas complejos de manera más eficiente.

!!! tip

    Si conceptos como estructuras de datos, algoritmos, arreglos y búsqueda binaria todavía le parecen algo oscuros, le animo a que siga leyendo. Este libro lo guiará suavemente al ámbito de la comprensión de las estructuras de datos y los algoritmos.

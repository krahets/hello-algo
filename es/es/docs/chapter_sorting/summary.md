# Resumen

### Revisión clave

- El ordenamiento de burbuja funciona intercambiando elementos adyacentes. Al agregar una bandera para permitir el retorno temprano, podemos optimizar la complejidad temporal en el mejor de los casos del ordenamiento de burbuja a $O(n)$.
- El ordenamiento por inserción ordena cada ronda insertando elementos del intervalo no ordenado en la posición correcta en el intervalo ordenado. Aunque la complejidad temporal del ordenamiento por inserción es $O(n^2)$, es muy popular para ordenar pequeñas cantidades de datos debido a un número relativamente menor de operaciones por unidad.
- El ordenamiento rápido se basa en operaciones de particionamiento de centinela. En el particionamiento de centinela, es posible elegir siempre el peor pivote, lo que lleva a una degradación de la complejidad temporal a $O(n^2)$. La introducción de pivotes medianos o aleatorios puede reducir la probabilidad de tal degradación. La recursión de cola reduce eficazmente la profundidad de la recursión, optimizando la complejidad espacial a $O(\log n)$.
- El ordenamiento por mezcla incluye dos fases: división y mezcla, que típicamente encarnan la estrategia de divide y vencerás. En el ordenamiento por mezcla, ordenar un arreglo requiere crear arreglos auxiliares, lo que resulta en una complejidad espacial de $O(n)$; sin embargo, la complejidad espacial para ordenar una lista se puede optimizar a $O(1)$.
- El ordenamiento por cubetas consta de tres pasos: distribuir los datos en cubetas, ordenar dentro de cada cubeta y fusionar los resultados en el orden de las cubetas. También encarna la estrategia de divide y vencerás, adecuada para conjuntos de datos muy grandes. La clave del ordenamiento por cubetas es la distribución uniforme de los datos.
- El ordenamiento por conteo es una variante del ordenamiento por cubetas, que ordena contando las ocurrencias de cada punto de datos. El ordenamiento por conteo es adecuado para grandes conjuntos de datos con un rango limitado de datos y requiere la conversión de datos a enteros positivos.
- El ordenamiento por radix procesa los datos ordenándolos dígito por dígito, lo que requiere que los datos se representen como números de longitud fija.
- En general, buscamos un algoritmo de ordenamiento que tenga alta eficiencia, estabilidad, operación in situ y adaptabilidad. Sin embargo, al igual que otras estructuras de datos y algoritmos, ningún algoritmo de ordenamiento puede cumplir todas estas condiciones simultáneamente. En aplicaciones prácticas, necesitamos elegir el algoritmo de ordenamiento apropiado basándonos en las características de los datos.
- La siguiente figura compara los algoritmos de ordenamiento principales en términos de eficiencia, estabilidad, naturaleza in situ y adaptabilidad.

![Comparación de algoritmos de ordenamiento](summary.assets/sorting_algorithms_comparison.png)

### Preguntas y respuestas

**P**: ¿Cuándo es necesaria la estabilidad de los algoritmos de ordenamiento?

En realidad, podríamos ordenar basándonos en un atributo de un objeto. Por ejemplo, los estudiantes tienen nombres y alturas como atributos, y nuestro objetivo es implementar un ordenamiento multinivel: primero por nombre para obtener `(A, 180) (B, 185) (C, 170) (D, 170)`; luego por altura. Debido a que el algoritmo de ordenamiento es inestable, podríamos terminar con `(D, 170) (C, 170) (A, 180) (B, 185)`.

Se puede ver que las posiciones de los estudiantes D y C se han intercambiado, alterando el orden de los nombres, lo cual es indeseable.

**P**: ¿Se puede intercambiar el orden de "búsqueda de derecha a izquierda" y "búsqueda de izquierda a derecha" en el particionamiento de centinela?

No, cuando se utiliza el elemento más a la izquierda como pivote, primero debemos "buscar de derecha a izquierda" y luego "buscar de izquierda a derecha". Esta conclusión es algo contraintuitiva, así que analicemos la razón.

El último paso de la partición de centinela `partition()` es intercambiar `nums[left]` y `nums[i]`. Después del intercambio, los elementos a la izquierda del pivote son todos `<=` el pivote, **lo que requiere que `nums[left] >= nums[i]` debe cumplirse antes del último intercambio**. Supongamos que primero "buscamos de izquierda a derecha", y si no se encuentra ningún elemento mayor que el pivote, **saldremos del bucle cuando `i == j`, posiblemente con `nums[j] == nums[i] > nums[left]`**. En otras palabras, la operación de intercambio final intercambiará un elemento mayor que el pivote al extremo izquierdo del arreglo, lo que hará que la partición de centinela falle.

Por ejemplo, dado el arreglo `[0, 0, 0, 0, 1]`, si primero "buscamos de izquierda a derecha", el arreglo después de la partición de centinela es `[1, 0, 0, 0, 0]`, lo cual es incorrecto.

Si consideramos más a fondo, si elegimos `nums[right]` como pivote, entonces, exactamente lo contrario, primero debemos "buscar de izquierda a derecha".

**P**: Con respecto a la optimización de la recursión de cola, ¿por qué elegir el arreglo más corto asegura que la profundidad de la recursión no exceda $\log n$?

La profundidad de la recursión es el número de métodos recursivos actualmente no devueltos. Cada ronda de partición de centinela divide el arreglo original en dos subarreglos. Con la optimización de la recursión de cola, la longitud del subarreglo a seguir recursivamente es como máximo la mitad de la longitud del arreglo original. Suponiendo que el peor caso siempre reduce la longitud a la mitad, la profundidad final de la recursión será $\log n$.

Revisando el ordenamiento rápido original, podríamos procesar recursivamente arreglos más grandes de forma continua, en el peor de los casos de $n$, $n - 1$, ..., $2$, $1$, con una profundidad de recursión de $n$. La optimización de la recursión de cola puede evitar este escenario.

**P**: Cuando todos los elementos del arreglo son iguales, ¿la complejidad temporal del ordenamiento rápido es $O(n^2)$? ¿Cómo se debe manejar este caso degenerado?

Sí. Para esta situación, considere usar el particionamiento de centinela para dividir el arreglo en tres partes: menor que, igual a y mayor que el pivote. Solo proceda recursivamente con las partes menor que y mayor que. En este método, un arreglo donde todos los elementos de entrada son iguales se puede ordenar en solo una ronda de particionamiento de centinela.

**P**: ¿Por qué la complejidad temporal en el peor de los casos del ordenamiento por cubetas es $O(n^2)$?

En el peor de los casos, todos los elementos se colocan en la misma cubeta. Si usamos un algoritmo $O(n^2)$ para ordenar estos elementos, la complejidad temporal será $O(n^2)$.

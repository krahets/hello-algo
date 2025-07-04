# Ordenamiento por conteo

El <u>ordenamiento por conteo</u> logra el ordenamiento contando el número de elementos, generalmente aplicado a arreglos de enteros.

## Implementación simple

Comencemos con un ejemplo simple. Dado un arreglo `nums` de longitud $n$, donde todos los elementos son "enteros no negativos", el proceso general del ordenamiento por conteo se muestra en la figura a continuación.

1.  Recorra el arreglo para encontrar el número máximo, denotado como $m$, luego cree un arreglo auxiliar `counter` de longitud $m + 1$.
2.  **Use `counter` para contar la ocurrencia de cada número en `nums`**, donde `counter[num]` corresponde a la ocurrencia del número `num`. El método de conteo es simple, solo recorra `nums` (suponga que el número actual es `num`), y aumente `counter[num]` en $1$ en cada ronda.
3.  **Dado que los índices de `counter` están naturalmente ordenados, todos los números ya están esencialmente ordenados**. A continuación, recorremos `counter` y rellenamos `nums` en orden ascendente de ocurrencia.

![Proceso de ordenamiento por conteo](counting_sort.assets/counting_sort_overview.png)

El código se muestra a continuación:

```src
[file]{counting_sort}-[class]{}-[func]{counting_sort_naive}
```

!!! note "Conexión entre el ordenamiento por conteo y el ordenamiento por cubetas"

    Desde la perspectiva del ordenamiento por cubetas, podemos considerar cada índice del arreglo de conteo `counter` en el ordenamiento por conteo como una cubeta, y el proceso de conteo como la distribución de elementos en las cubetas correspondientes. Esencialmente, el ordenamiento por conteo es un caso especial del ordenamiento por cubetas para datos enteros.

## Implementación completa

Los lectores observadores podrían notar que, **si los datos de entrada son un objeto, el paso `3.` anterior no es válido**. Supongamos que los datos de entrada son un objeto de producto, queremos ordenar los productos por el precio (una variable miembro de la clase), pero el algoritmo anterior solo puede dar el precio ordenado como resultado.

Entonces, ¿cómo podemos obtener el resultado de ordenamiento para los datos originales? Primero, calculamos la "suma de prefijos" de `counter`. Como su nombre indica, la suma de prefijos en el índice `i`, `prefix[i]`, es igual a la suma de los primeros `i` elementos del arreglo:

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**La suma de prefijos tiene un significado claro, `prefix[num] - 1` representa el índice de la última ocurrencia del elemento `num` en el arreglo de resultados `res`**. Esta información es crucial, ya que nos dice dónde debe aparecer cada elemento en el arreglo de resultados. A continuación, recorremos cada elemento `num` del arreglo original `nums` en orden inverso, realizando los siguientes dos pasos en cada iteración.

1.  Rellene `num` en el arreglo `res` en el índice `prefix[num] - 1`.
2.  Disminuya la suma de prefijos `prefix[num]` en $1$ para obtener el siguiente índice donde colocar `num`.

Después del recorrido, el arreglo `res` contiene el resultado ordenado, y finalmente, `res` reemplaza el arreglo original `nums`. El proceso completo de ordenamiento por conteo se muestra en la figura a continuación.

=== "<1>"
    ![Proceso de ordenamiento por conteo](counting_sort.assets/counting_sort_step1.png)

=== "<2>"
    ![counting_sort_step2](counting_sort.assets/counting_sort_step2.png)

=== "<3>"
    ![counting_sort_step3](counting_sort.assets/counting_sort_step3.png)

=== "<4>"
    ![counting_sort_step4](counting_sort.assets/counting_sort_step4.png)

=== "<5>"
    ![counting_sort_step5](counting_sort.assets/counting_sort_step5.png)

=== "<6>"
    ![counting_sort_step6](counting_sort.assets/counting_sort_step6.png)

=== "<7>"
    ![counting_sort_step7](counting_sort.assets/counting_sort_step7.png)

=== "<8>"
    ![counting_sort_step8](counting_sort.assets/counting_sort_step8.png)

El código de implementación del ordenamiento por conteo se muestra a continuación:

```src
[file]{counting_sort}-[class]{}-[func]{counting_sort}
```

## Características del algoritmo

-   **La complejidad temporal es $O(n + m)$, ordenamiento no adaptativo**: Implica recorrer `nums` y `counter`, ambos utilizando tiempo lineal. Generalmente, $n \gg m$, y la complejidad temporal tiende a $O(n)$.
-   **La complejidad espacial es $O(n + m)$, ordenamiento no in situ**: Utiliza un arreglo `res` de longitud $n$ y un arreglo `counter` de longitud $m$ respectivamente.
-   **Ordenamiento estable**: Dado que los elementos se rellenan en `res` en un orden "de derecha a izquierda", invertir el recorrido de `nums` puede evitar cambiar la posición relativa entre elementos iguales, logrando así un ordenamiento estable. En realidad, recorrer `nums` en orden también puede producir el resultado de ordenamiento correcto, pero el resultado es inestable.

## Limitaciones

Para este momento, es posible que encuentre el ordenamiento por conteo muy inteligente, ya que puede lograr un ordenamiento eficiente simplemente contando cantidades. Sin embargo, los requisitos previos para usar el ordenamiento por conteo son relativamente estrictos.

**El ordenamiento por conteo solo es adecuado para enteros no negativos**. Si desea aplicarlo a otros tipos de datos, debe asegurarse de que estos datos se puedan convertir a enteros no negativos sin cambiar el orden original de los elementos. Por ejemplo, para un arreglo que contenga enteros negativos, primero puede agregar una constante a todos los números, convirtiéndolos todos en números positivos, y luego convertirlos de nuevo después de que el ordenamiento se complete.

**El ordenamiento por conteo es adecuado para grandes conjuntos de datos con un rango pequeño de valores**. Por ejemplo, en el ejemplo anterior, $m$ no debe ser demasiado grande, de lo contrario, ocupará demasiado espacio. Y cuando $n \ll m$, el ordenamiento por conteo utiliza tiempo $O(m)$, lo que puede ser más lento que los algoritmos de ordenamiento $O(n \log n)$.

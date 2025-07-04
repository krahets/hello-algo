# Problema de la distancia de edición

La distancia de edición, también conocida como distancia de Levenshtein, se refiere al número mínimo de modificaciones necesarias para transformar una cadena en otra, comúnmente utilizada en la recuperación de información y el procesamiento del lenguaje natural para medir la similitud entre dos secuencias.

!!! question

    Dadas dos cadenas $s$ y $t$, devuelva el número mínimo de ediciones necesarias para transformar $s$ en $t$.

    Puede realizar tres tipos de ediciones en una cadena: insertar un carácter, eliminar un carácter o reemplazar un carácter por cualquier otro carácter.

Como se muestra en la figura a continuación, transformar `kitten` en `sitting` requiere 3 ediciones, incluyendo 2 reemplazos y 1 inserción; transformar `hello` en `algo` requiere 3 pasos, incluyendo 2 reemplazos y 1 eliminación.

![Datos de ejemplo de distancia de edición](edit_distance_problem.assets/edit_distance_example.png)

**El problema de la distancia de edición se puede explicar naturalmente con un modelo de árbol de decisión**. Las cadenas corresponden a nodos de árbol, y una ronda de decisión (una operación de edición) corresponde a una arista del árbol.

Como se muestra en la figura a continuación, con operaciones sin restricciones, cada nodo puede derivar muchas aristas, cada una correspondiente a una operación, lo que significa que hay muchos caminos posibles para transformar `hello` en `algo`.

Desde la perspectiva del árbol de decisión, el objetivo de este problema es encontrar el camino más corto entre el nodo `hello` y el nodo `algo`.

![Problema de la distancia de edición representado basándose en el modelo de árbol de decisión](edit_distance_problem.assets/edit_distance_decision_tree.png)

### Enfoque de programación dinámica

**Paso uno: Piense en cada ronda de decisión, defina el estado, obteniendo así la tabla $dp$**

Cada ronda de decisión implica realizar una operación de edición en la cadena $s$.

Nuestro objetivo es reducir gradualmente el tamaño del problema durante el proceso de edición, lo que nos permite construir subproblemas. Sean las longitudes de las cadenas $s$ y $t$ $n$ y $m$, respectivamente. Primero consideramos los caracteres finales de ambas cadenas $s[n-1]$ y $t[m-1]$.

-   Si $s[n-1]$ y $t[m-1]$ son iguales, podemos omitirlos y considerar directamente $s[n-2]$ y $t[m-2]$.
-   Si $s[n-1]$ y $t[m-1]$ son diferentes, necesitamos realizar una edición en $s$ (insertar, eliminar, reemplazar) para que los caracteres finales de las dos cadenas coincidan, lo que nos permite omitirlos y considerar un problema de menor escala.

Así, cada ronda de decisión (operación de edición) en la cadena $s$ cambia los caracteres restantes en $s$ y $t$ a ser emparejados. Por lo tanto, el estado es el carácter $i$-ésimo y $j$-ésimo actualmente considerado en $s$ y $t$, denotado como $[i, j]$.

El estado $[i, j]$ corresponde al subproblema: **El número mínimo de ediciones necesarias para cambiar los primeros $i$ caracteres de $s$ en los primeros $j$ caracteres de $t$**.

De esto, obtenemos una tabla $dp$ bidimensional de tamaño $(i+1) \times (j+1)$.

**Paso dos: Identificar la subestructura óptima y luego derivar la ecuación de transición de estado**

Considere el subproblema $dp[i, j]$, cuyos caracteres finales correspondientes de las dos cadenas son $s[i-1]$ y $t[j-1]$, que se pueden dividir en tres escenarios como se muestra en la figura a continuación.

1.  Agregue $t[j-1]$ después de $s[i-1]$, entonces el subproblema restante es $dp[i, j-1]$.
2.  Elimine $s[i-1]$, entonces el subproblema restante es $dp[i-1, j]$.
3.  Reemplace $s[i-1]$ con $t[j-1]$, entonces el subproblema restante es $dp[i-1, j-1]$.

![Transición de estado de la distancia de edición](edit_distance_problem.assets/edit_distance_state_transfer.png)

Basándonos en el análisis anterior, podemos determinar la subestructura óptima: El número mínimo de ediciones para $dp[i, j]$ es el mínimo entre $dp[i, j-1]$, $dp[i-1, j]$ y $dp[i-1, j-1]$, más el paso de edición $1$. La ecuación de transición de estado correspondiente es:

$$
dp[i, j] = \min(dp[i, j-1], dp[i-1, j], dp[i-1, j-1]) + 1
$$

Tenga en cuenta que, **cuando $s[i-1]$ y $t[j-1]$ son iguales, no se requiere ninguna edición para el carácter actual**, en cuyo caso la ecuación de transición de estado es:

$$
dp[i, j] = dp[i-1, j-1]
$$

**Paso tres: Determinar las condiciones de contorno y el orden de las transiciones de estado**

Cuando ambas cadenas están vacías, el número de ediciones es $0$, es decir, $dp[0, 0] = 0$. Cuando $s$ está vacía pero $t$ no, el número mínimo de ediciones es igual a la longitud de $t$, es decir, la primera fila $dp[0, j] = j$. Cuando $s$ no está vacía pero $t$ sí, el número mínimo de ediciones es igual a la longitud de $s$, es decir, la primera columna $dp[i, 0] = i$.

Observando la ecuación de transición de estado, resolver $dp[i, j]$ depende de las soluciones de la izquierda, arriba y arriba a la izquierda, por lo que se puede usar un bucle doble para recorrer toda la tabla $dp$ en el orden correcto.

### Implementación del código

```src
[file]{edit_distance}-[class]{}-[func]{edit_distance_dp}
```

Como se muestra en la figura a continuación, el proceso de transición de estado en el problema de la distancia de edición es muy similar al del problema de la mochila, que se puede ver como rellenar una cuadrícula bidimensional.

=== "<1>"
    ![Proceso de programación dinámica de la distancia de edición](edit_distance_problem.assets/edit_distance_dp_step1.png)

=== "<2>"
    ![edit_distance_dp_step2](edit_distance_problem.assets/edit_distance_dp_step2.png)

=== "<3>"
    ![edit_distance_dp_step3](edit_distance_problem.assets/edit_distance_dp_step3.png)

=== "<4>"
    ![edit_distance_dp_step4](edit_distance_problem.assets/edit_distance_dp_step4.png)

=== "<5>"
    ![edit_distance_dp_step5](edit_distance_problem.assets/edit_distance_dp_step5.png)

=== "<6>"
    ![edit_distance_dp_step6](edit_distance_problem.assets/edit_distance_dp_step6.png)

=== "<7>"
    ![edit_distance_dp_step7](edit_distance_problem.assets/edit_distance_dp_step7.png)

=== "<8>"
    ![edit_distance_dp_step8](edit_distance_problem.assets/edit_distance_dp_step8.png)

=== "<9>"
    ![edit_distance_dp_step9](edit_distance_problem.assets/edit_distance_dp_step9.png)

=== "<10>"
    ![edit_distance_dp_step10](edit_distance_problem.assets/edit_distance_dp_step10.png)

=== "<11>"
    ![edit_distance_dp_step11](edit_distance_problem.assets/edit_distance_dp_step11.png)

=== "<12>"
    ![edit_distance_dp_step12](edit_distance_problem.assets/edit_distance_dp_step12.png)

=== "<13>"
    ![edit_distance_dp_step13](edit_distance_problem.assets/edit_distance_dp_step13.png)

=== "<14>"
    ![edit_distance_dp_step14](edit_distance_problem.assets/edit_distance_dp_step14.png)

=== "<15>"
    ![edit_distance_dp_step15](edit_distance_problem.assets/edit_distance_dp_step15.png)

### Optimización del espacio

Dado que $dp[i, j]$ se deriva de las soluciones de arriba $dp[i-1, j]$, a la izquierda $dp[i, j-1]$ y arriba a la izquierda $dp[i-1, j-1]$, y el recorrido directo perderá la solución de arriba a la izquierda $dp[i-1, j-1]$, y el recorrido inverso no puede construir $dp[i, j-1]$ de antemano, por lo tanto, ambos órdenes de recorrido no son factibles.

Por esta razón, podemos usar una variable `leftup` para almacenar temporalmente la solución de arriba a la izquierda $dp[i-1, j-1]$, por lo que solo necesitamos considerar las soluciones de la izquierda y de arriba. Esta situación es similar al problema de la mochila ilimitada, lo que permite un recorrido directo. El código es el siguiente:

```src
[file]{edit_distance}-[class]{}-[func]{edit_distance_dp_comp}
```

# Problema de la mochila 0-1

El problema de la mochila es un excelente problema introductorio para la programación dinámica y es el tipo de problema más común en la programación dinámica. Tiene muchas variantes, como el problema de la mochila 0-1, el problema de la mochila ilimitada y el problema de la mochila múltiple, etc.

En esta sección, resolveremos primero el problema de la mochila 0-1 más común.

!!! question

    Dados $n$ artículos, el peso del $i$-ésimo artículo es $wgt[i-1]$ y su valor es $val[i-1]$, y una mochila con una capacidad de $cap$. Cada artículo se puede elegir solo una vez. ¿Cuál es el valor máximo de los artículos que se pueden colocar en la mochila bajo el límite de capacidad?

Observe la figura a continuación, dado que el número de artículo $i$ comienza a contar desde 1, y el índice del arreglo comienza desde 0, el peso del artículo $i$ corresponde a $wgt[i-1]$ y el valor corresponde a $val[i-1]$.

![Datos de ejemplo de la mochila 0-1](knapsack_problem.assets/knapsack_example.png)

Podemos considerar el problema de la mochila 0-1 como un proceso que consta de $n$ rondas de decisiones, donde para cada artículo hay dos decisiones: no ponerlo o ponerlo, por lo que el problema se ajusta al modelo de árbol de decisión.

El objetivo de este problema es "maximizar el valor de los artículos que se pueden colocar en la mochila bajo la capacidad limitada", por lo que es más probable que sea un problema de programación dinámica.

**Primer paso: Piense en cada ronda de decisiones, defina los estados, obteniendo así la tabla $dp$**

Para cada artículo, si no se coloca en la mochila, la capacidad permanece sin cambios; si se coloca, la capacidad se reduce. De esto, se puede obtener la definición de estado: el número de artículo actual $i$ y la capacidad de la mochila $c$, denotado como $[i, c]$.

El estado $[i, c]$ corresponde al subproblema: **el valor máximo de los primeros $i$ artículos en una mochila de capacidad $c$**, denotado como $dp[i, c]$.

La solución que buscamos es $dp[n, cap]$, por lo que necesitamos una tabla $dp$ bidimensional de tamaño $(n+1) \times (cap+1)$.

**Segundo paso: Identificar la subestructura óptima, luego derivar la ecuación de transición de estado**

Después de tomar la decisión para el artículo $i$, lo que queda es el subproblema de las decisiones para los primeros $i-1$ artículos, que se puede dividir en dos casos.

-   **No poner el artículo $i$**: La capacidad de la mochila permanece sin cambios, el estado cambia a $[i-1, c]$.
-   **Poner el artículo $i$**: La capacidad de la mochila disminuye en $wgt[i-1]$, y el valor aumenta en $val[i-1]$, el estado cambia a $[i-1, c-wgt[i-1]]$.

El análisis anterior revela la subestructura óptima de este problema: **el valor máximo $dp[i, c]$ es igual al valor mayor de los dos esquemas de no poner el artículo $i$ y poner el artículo $i$**. De esto, se puede derivar la ecuación de transición de estado:

$$
dp[i, c] = \max(dp[i-1, c], dp[i-1, c - wgt[i-1]] + val[i-1])
$$

Es importante tener en cuenta que si el peso del artículo actual $wgt[i - 1]$ excede la capacidad restante de la mochila $c$, entonces la única opción es no ponerlo en la mochila.

**Tercer paso: Determinar las condiciones de contorno y el orden de las transiciones de estado**

Cuando no hay artículos o la capacidad de la mochila es $0$, el valor máximo es $0$, es decir, la primera columna $dp[i, 0]$ y la primera fila $dp[0, c]$ son ambas iguales a $0$.

El estado actual $[i, c]$ transita desde el estado directamente superior $[i-1, c]$ y el estado superior izquierdo $[i-1, c-wgt[i-1]]$, por lo tanto, toda la tabla $dp$ se recorre en orden a través de dos capas de bucles.

Siguiendo el análisis anterior, a continuación implementaremos las soluciones en el orden de búsqueda por fuerza bruta, búsqueda memorizada y programación dinámica.

### Método uno: Búsqueda por fuerza bruta

El código de búsqueda incluye los siguientes elementos.

-   **Parámetros recursivos**: Estado $[i, c]$.
-   **Valor de retorno**: Solución del subproblema $dp[i, c]$.
-   **Condición de terminación**: Cuando el número de artículo está fuera de los límites $i = 0$ o la capacidad restante de la mochila es $0$, termine la recursión y devuelva el valor $0$.
-   **Poda**: Si el peso del artículo actual excede la capacidad restante de la mochila, la única opción es no ponerlo en la mochila.

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs}
```

Como se muestra en la figura a continuación, dado que cada artículo genera dos ramas de búsqueda de no seleccionar y seleccionar, la complejidad temporal es $O(2^n)$.

Observando el árbol recursivo, es fácil ver que hay subproblemas superpuestos, como $dp[1, 10]$, etc. Cuando hay muchos artículos y la capacidad de la mochila es grande, especialmente cuando hay muchos artículos del mismo peso, el número de subproblemas superpuestos aumentará significativamente.

![El árbol recursivo de búsqueda por fuerza bruta del problema de la mochila 0-1](knapsack_problem.assets/knapsack_dfs.png)

### Método dos: Búsqueda memorizada

Para asegurar que los subproblemas superpuestos se calculen solo una vez, usamos una lista de memorización `mem` para registrar las soluciones a los subproblemas, donde `mem[i][c]` corresponde a $dp[i, c]$.

Después de introducir la memorización, **la complejidad temporal depende del número de subproblemas**, que es $O(n \times cap)$. El código de implementación es el siguiente:

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dfs_mem}
```

La figura a continuación muestra las ramas de búsqueda que se podan en la búsqueda memorizada.

![El árbol recursivo de búsqueda memorizada del problema de la mochila 0-1](knapsack_problem.assets/knapsack_dfs_mem.png)

### Método tres: Programación dinámica

La programación dinámica esencialmente implica rellenar la tabla $dp$ durante la transición de estado, el código se muestra en la figura a continuación:

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp}
```

Como se muestra en la figura a continuación, tanto la complejidad temporal como la espacial están determinadas por el tamaño del arreglo `dp`, es decir, $O(n \times cap)$.

=== "<1>"
    ![El proceso de programación dinámica del problema de la mochila 0-1](knapsack_problem.assets/knapsack_dp_step1.png)

=== "<2>"
    ![knapsack_dp_step2](knapsack_problem.assets/knapsack_dp_step2.png)

=== "<3>"
    ![knapsack_dp_step3](knapsack_problem.assets/knapsack_dp_step3.png)

=== "<4>"
    ![knapsack_dp_step4](knapsack_problem.assets/knapsack_dp_step4.png)

=== "<5>"
    ![knapsack_dp_step5](knapsack_problem.assets/knapsack_dp_step5.png)

=== "<6>"
    ![knapsack_dp_step6](knapsack_problem.assets/knapsack_dp_step6.png)

=== "<7>"
    ![knapsack_dp_step7](knapsack_problem.assets/knapsack_dp_step7.png)

=== "<8>"
    ![knapsack_dp_step8](knapsack_problem.assets/knapsack_dp_step8.png)

=== "<9>"
    ![knapsack_dp_step9](knapsack_problem.assets/knapsack_dp_step9.png)

=== "<10>"
    ![knapsack_dp_step10](knapsack_problem.assets/knapsack_dp_step10.png)

=== "<11>"
    ![knapsack_dp_step11](knapsack_problem.assets/knapsack_dp_step11.png)

=== "<12>"
    ![knapsack_dp_step12](knapsack_problem.assets/knapsack_dp_step12.png)

=== "<13>"
    ![knapsack_dp_step13](knapsack_problem.assets/knapsack_dp_step13.png)

=== "<14>"
    ![knapsack_dp_step14](knapsack_problem.assets/knapsack_dp_step14.png)

### Optimización del espacio

Dado que cada estado solo está relacionado con el estado de la fila superior, podemos usar dos arreglos para avanzar, reduciendo la complejidad espacial de $O(n^2)$ a $O(n)$.

Pensando más a fondo, ¿podemos usar solo un arreglo para lograr la optimización del espacio? Se puede observar que cada estado se transfiere desde la celda directamente superior o desde la celda superior izquierda. Si solo hay un arreglo, al comenzar a recorrer la fila $i$-ésima, ese arreglo todavía almacena el estado de la fila $i-1$.

-   Si se utiliza un recorrido en orden normal, al recorrer $dp[i, j]$, los valores de la parte superior izquierda $dp[i-1, 1]$ ~ $dp[i-1, j-1]$ pueden haber sido sobrescritos, por lo que no se puede obtener el resultado correcto de la transición de estado.
-   Si se utiliza un recorrido en orden inverso, no habrá problema de sobrescritura, y la transición de estado se puede realizar correctamente.

Las figuras a continuación muestran el proceso de transición de la fila $i = 1$ a la fila $i = 2$ en un solo arreglo. Piense en las diferencias entre el recorrido en orden normal y el recorrido en orden inverso.

=== "<1>"
    ![El proceso de programación dinámica optimizado en espacio de la mochila 0-1](knapsack_problem.assets/knapsack_dp_comp_step1.png)

=== "<2>"
    ![knapsack_dp_comp_step2](knapsack_problem.assets/knapsack_dp_comp_step2.png)

=== "<3>"
    ![knapsack_dp_comp_step3](knapsack_problem.assets/knapsack_dp_comp_step3.png)

=== "<4>"
    ![knapsack_dp_comp_step4](knapsack_problem.assets/knapsack_dp_comp_step4.png)

=== "<5>"
    ![knapsack_dp_comp_step5](knapsack_problem.assets/knapsack_dp_comp_step5.png)

=== "<6>"
    ![knapsack_dp_comp_step6](knapsack_problem.assets/knapsack_dp_comp_step6.png)

En la implementación del código, solo necesitamos eliminar la primera dimensión $i$ del arreglo `dp` y cambiar el bucle interno a recorrido inverso:

```src
[file]{knapsack}-[class]{}-[func]{knapsack_dp_comp}
```
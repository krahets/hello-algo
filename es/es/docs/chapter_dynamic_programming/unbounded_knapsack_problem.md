# Problema de la mochila ilimitada

En esta sección, primero resolvemos otro problema común de la mochila: la mochila ilimitada, y luego exploramos un caso especial de ella: el problema del cambio de monedas.

## Problema de la mochila ilimitada

!!! question

    Dados $n$ artículos, donde el peso del $i$-ésimo artículo es $wgt[i-1]$ y su valor es $val[i-1]$, y una mochila con una capacidad de $cap$. **Cada artículo se puede seleccionar varias veces**. ¿Cuál es el valor máximo de los artículos que se pueden colocar en la mochila sin exceder su capacidad? Vea el ejemplo a continuación.

![Datos de ejemplo para el problema de la mochila ilimitada](unbounded_knapsack_problem.assets/unbounded_knapsack_example.png)

### Enfoque de programación dinámica

El problema de la mochila ilimitada es muy similar al problema de la mochila 0-1, **la única diferencia es que no hay límite en el número de veces que se puede elegir un artículo**.

-   En el problema de la mochila 0-1, solo hay uno de cada artículo, por lo que después de colocar el artículo $i$ en la mochila, solo puede elegir entre los $i-1$ artículos anteriores.
-   En el problema de la mochila ilimitada, la cantidad de cada artículo es ilimitada, por lo que después de colocar el artículo $i$ en la mochila, **todavía puede elegir entre los $i$ artículos anteriores**.

Bajo las reglas del problema de la mochila ilimitada, el estado $[i, c]$ puede cambiar de dos maneras.

-   **No poner el artículo $i$**: Al igual que con el problema de la mochila 0-1, la transición es a $[i-1, c]$.
-   **Poner el artículo $i$**: A diferencia del problema de la mochila 0-1, la transición es a $[i, c-wgt[i-1]]$.

La ecuación de transición de estado, por lo tanto, se convierte en:

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### Implementación del código

Comparando el código para los dos problemas, la transición de estado cambia de $i-1$ a $i$, el resto es completamente idéntico:

```src
[file]{unbounded_knapsack}-[class]{}-[func]{unbounded_knapsack_dp}
```

### Optimización del espacio

Dado que el estado actual proviene del estado a la izquierda y arriba, **la solución optimizada en espacio debe realizar un recorrido hacia adelante para cada fila en la tabla $dp$**.

Este orden de recorrido es opuesto al del problema de la mochila 0-1. Consulte la figura a continuación para comprender la diferencia.

=== "<1>"
    ![Proceso de programación dinámica para el problema de la mochila ilimitada después de la optimización del espacio](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.png)

=== "<2>"
    ![unbounded_knapsack_dp_comp_step2](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.png)

=== "<3>"
    ![unbounded_knapsack_dp_comp_step3](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.png)

=== "<4>"
    ![unbounded_knapsack_dp_comp_step4](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.png)

=== "<5>"
    ![unbounded_knapsack_dp_comp_step5](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.png)

=== "<6>"
    ![unbounded_knapsack_dp_comp_step6](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.png)

La implementación del código es bastante simple, solo elimine la primera dimensión del arreglo `dp`:

```src
[file]{unbounded_knapsack}-[class]{}-[func]{unbounded_knapsack_dp_comp}
```

## Problema del cambio de monedas

El problema de la mochila es un representante de una gran clase de problemas de programación dinámica y tiene muchas variantes, como el problema del cambio de monedas.

!!! question

    Dadas $n$ tipos de monedas, donde la denominación del $i$-ésimo tipo de moneda es $coins[i - 1]$, y la cantidad objetivo es $amt$. **Cada tipo de moneda se puede seleccionar varias veces**. ¿Cuál es el número mínimo de monedas necesarias para alcanzar la cantidad objetivo? Si es imposible alcanzar la cantidad objetivo, devuelva $-1$. Vea el ejemplo a continuación.

![Datos de ejemplo para el problema del cambio de monedas](unbounded_knapsack_problem.assets/coin_change_example.png)

### Enfoque de programación dinámica

**El cambio de monedas se puede ver como un caso especial del problema de la mochila ilimitada**, compartiendo las siguientes similitudes y diferencias.

-   Los dos problemas se pueden convertir entre sí: "artículo" corresponde a "moneda", "peso del artículo" corresponde a "denominación de la moneda" y "capacidad de la mochila" corresponde a "cantidad objetivo".
-   Los objetivos de optimización son opuestos: el problema de la mochila ilimitada tiene como objetivo maximizar el valor de los artículos, mientras que el problema del cambio de monedas tiene como objetivo minimizar el número de monedas.
-   El problema de la mochila ilimitada busca soluciones que "no excedan" la capacidad de la mochila, mientras que el cambio de monedas busca soluciones que "exactamente" alcancen la cantidad objetivo.

**Primer paso: Piense en la toma de decisiones de cada ronda, defina el estado y, por lo tanto, derive la tabla $dp$**

El estado $[i, a]$ corresponde al subproblema: **el número mínimo de monedas que pueden formar la cantidad $a$ utilizando los primeros $i$ tipos de monedas**, denotado como $dp[i, a]$.

La tabla $dp$ bidimensional es de tamaño $(n+1) \times (amt+1)$.

**Segundo paso: Identificar la subestructura óptima y derivar la ecuación de transición de estado**

Este problema difiere del problema de la mochila ilimitada en dos aspectos de la ecuación de transición de estado.

-   Este problema busca el mínimo, por lo que el operador $\max()$ debe cambiarse a $\min()$.
-   La optimización se centra en el número de monedas, por lo que simplemente se agrega $+1$ cuando se elige una moneda.

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**Tercer paso: Definir las condiciones de contorno y el orden de transición de estado**

Cuando la cantidad objetivo es $0$, el número mínimo de monedas necesarias para alcanzarla es $0$, por lo que todos los $dp[i, 0]$ en la primera columna son $0$.

Cuando no hay monedas, **es imposible alcanzar cualquier cantidad >0**, lo cual es una solución inválida. Para permitir que la función $\min()$ en la ecuación de transición de estado reconozca y filtre las soluciones inválidas, considere usar $+\infty$ para representarlas, es decir, establezca todos los $dp[0, a]$ en la primera fila en $+\infty$.

### Implementación del código

La mayoría de los lenguajes de programación no proporcionan una variable $+\infty$, solo se puede usar el valor máximo de un entero `int` como sustituto. Esto puede provocar un desbordamiento: la operación $+1$ en la ecuación de transición de estado puede desbordarse.

Por esta razón, usamos el número $amt + 1$ para representar una solución inválida, porque el número máximo de monedas necesarias para alcanzar $amt$ es como máximo $amt$. Antes de devolver el resultado, verifique si $dp[n, amt]$ es igual a $amt + 1$, y si es así, devuelva $-1$, lo que indica que la cantidad objetivo no se puede alcanzar. El código es el siguiente:

```src
[file]{coin_change}-[class]{}-[func]{coin_change_dp}
```

La figura a continuación muestra el proceso de programación dinámica para el problema del cambio de monedas, que es muy similar al problema de la mochila ilimitada.

=== "<1>"
    ![Proceso de programación dinámica para el problema del cambio de monedas](unbounded_knapsack_problem.assets/coin_change_dp_step1.png)

=== "<2>"
    ![coin_change_dp_step2](unbounded_knapsack_problem.assets/coin_change_dp_step2.png)

=== "<3>"
    ![coin_change_dp_step3](unbounded_knapsack_problem.assets/coin_change_dp_step3.png)

=== "<4>"
    ![coin_change_dp_step4](unbounded_knapsack_problem.assets/coin_change_dp_step4.png)

=== "<5>"
    ![coin_change_dp_step5](unbounded_knapsack_problem.assets/coin_change_dp_step5.png)

=== "<6>"
    ![coin_change_dp_step6](unbounded_knapsack_problem.assets/coin_change_dp_step6.png)

=== "<7>"
    ![coin_change_dp_step7](unbounded_knapsack_problem.assets/coin_change_dp_step7.png)

=== "<8>"
    ![coin_change_dp_step8](unbounded_knapsack_problem.assets/coin_change_dp_step8.png)

=== "<9>"
    ![coin_change_dp_step9](unbounded_knapsack_problem.assets/coin_change_dp_step9.png)

=== "<10>"
    ![coin_change_dp_step10](unbounded_knapsack_problem.assets/coin_change_dp_step10.png)

=== "<11>"
    ![coin_change_dp_step11](unbounded_knapsack_problem.assets/coin_change_dp_step11.png)

=== "<12>"
    ![coin_change_dp_step12](unbounded_knapsack_problem.assets/coin_change_dp_step12.png)

=== "<13>"
    ![coin_change_dp_step13](unbounded_knapsack_problem.assets/coin_change_dp_step13.png)

=== "<14>"
    ![coin_change_dp_step14](unbounded_knapsack_problem.assets/coin_change_dp_step14.png)

=== "<15>"
    ![coin_change_dp_step15](unbounded_knapsack_problem.assets/coin_change_dp_step15.png)

### Optimización del espacio

La optimización del espacio para el problema del cambio de monedas se maneja de la misma manera que para el problema de la mochila ilimitada:

```src
[file]{coin_change}-[class]{}-[func]{coin_change_dp_comp}
```

## Problema del cambio de monedas II

!!! question

    Dadas $n$ tipos de monedas, donde la denominación del $i$-ésimo tipo de moneda es $coins[i - 1]$, y la cantidad objetivo es $amt$. Cada tipo de moneda se puede seleccionar varias veces, **pregunte cuántas combinaciones de monedas pueden formar la cantidad objetivo**. Vea el ejemplo a continuación.

![Datos de ejemplo para el problema del cambio de monedas II](unbounded_knapsack_problem.assets/coin_change_ii_example.png)

### Enfoque de programación dinámica

En comparación con el problema anterior, el objetivo de este problema es determinar el número de combinaciones, por lo que el subproblema se convierte en: **el número de combinaciones que pueden formar la cantidad $a$ utilizando los primeros $i$ tipos de monedas**. La tabla $dp$ sigue siendo una matriz bidimensional de tamaño $(n+1) \times (amt + 1)$.

El número de combinaciones para el estado actual es la suma de las combinaciones de no seleccionar la moneda actual y seleccionar la moneda actual. La ecuación de transición de estado es:

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

Cuando la cantidad objetivo es $0$, no se necesitan monedas para formar la cantidad objetivo, por lo que todos los $dp[i, 0]$ en la primera columna deben inicializarse a $1$. Cuando no hay monedas, es imposible formar cualquier cantidad >0, por lo que todos los $dp[0, a]$ en la primera fila deben establecerse en $0$.

### Implementación del código

```src
[file]{coin_change_ii}-[class]{}-[func]{coin_change_ii_dp}
```

### Optimización del espacio

El enfoque de optimización del espacio es el mismo, solo elimine la dimensión de la moneda:

```src
[file]{coin_change_ii}-[class]{}-[func]{coin_change_ii_dp_comp}
```
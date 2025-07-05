# Enfoque de Solución en Programación Dinámica

En las dos secciones anteriores, introdujimos las características principales de los problemas de programación dinámica. A continuación, exploraremos dos preguntas más prácticas.

1. ¿Cómo determinar si un problema es un problema de programación dinámica?
2. ¿Por dónde empezar a resolver un problema de programación dinámica y cuáles son los pasos completos?

## Determinación del Problema

En general, si un problema contiene subproblemas superpuestos, subestructura óptima y satisface la propiedad de no tener efectos posteriores, entonces suele ser adecuado para resolverlo con programación dinámica. Sin embargo, es difícil extraer directamente estas características de la descripción del problema. Por lo tanto, solemos relajar las condiciones y **primero observar si el problema es adecuado para resolverlo mediante backtracking (enumeración exhaustiva)**.

**Los problemas adecuados para resolver con backtracking suelen satisfacer el "modelo de árbol de decisión"**. Este tipo de problema se puede describir utilizando una estructura de árbol, donde cada nodo representa una decisión y cada ruta representa una secuencia de decisiones.

En otras palabras, si el problema contiene un concepto claro de decisión y la solución se produce a través de una serie de decisiones, entonces satisface el modelo de árbol de decisión y, por lo general, se puede resolver mediante backtracking.

Sobre esta base, los problemas de programación dinámica también tienen algunos "puntos a favor" para su identificación.

- El problema incluye descripciones de optimización como máximo (mínimo) o más (menos).
- El estado del problema se puede representar mediante una lista, una matriz multidimensional o un árbol, y existe una relación recurrente entre un estado y sus estados circundantes.

Correspondientemente, también existen algunos "puntos en contra".

- El objetivo del problema es encontrar todas las soluciones posibles, en lugar de encontrar la solución óptima.
- La descripción del problema tiene características obvias de permutaciones y combinaciones, y requiere devolver múltiples soluciones específicas.

Si un problema satisface el modelo de árbol de decisión y tiene "puntos a favor" relativamente obvios, podemos asumir que es un problema de programación dinámica y verificarlo durante el proceso de solución.

## Pasos para la Solución del Problema

El proceso de resolución de problemas de programación dinámica variará según la naturaleza y la dificultad del problema, pero generalmente sigue estos pasos: describir la decisión, definir el estado, establecer la tabla $dp$, derivar la ecuación de transición de estado, determinar las condiciones de contorno, etc.

Para ilustrar los pasos de resolución de problemas de manera más vívida, utilizaremos un problema clásico: "suma mínima de ruta".

!!! question

    Dado un grid bidimensional de $n \times m$ `grid`, cada celda de la cuadrícula contiene un entero no negativo que representa el costo de esa celda. Un robot comienza en la celda superior izquierda y solo puede moverse hacia abajo o hacia la derecha en cada paso, hasta llegar a la celda inferior derecha. Devuelve la suma mínima de la ruta desde la esquina superior izquierda hasta la esquina inferior derecha.

La siguiente figura muestra un ejemplo; la suma mínima de la ruta para la cuadrícula dada es $13$.

![Datos de ejemplo de suma mínima de ruta](dp_solution_pipeline.assets/min_path_sum_example.png)

**Primer paso: Considerar la decisión en cada ronda, definir el estado y así obtener la tabla $dp$**

La decisión en cada ronda de este problema es moverse hacia abajo o hacia la derecha desde la celda actual. Supongamos que los índices de fila y columna de la celda actual son $[i, j]$. Entonces, después de moverse hacia abajo o hacia la derecha, los índices se convierten en $[i+1, j]$ o $[i, j+1]$. Por lo tanto, el estado debe incluir dos variables: el índice de la fila y el índice de la columna, denotados como $[i, j]$.

El subproblema correspondiente al estado $[i, j]$ es: la suma mínima de la ruta desde el punto de partida $[0, 0]$ hasta $[i, j]$, y la solución se denota como $dp[i, j]$.

Con esto, hemos obtenido la matriz $dp$ bidimensional que se muestra en la siguiente figura, cuyas dimensiones son las mismas que las de la cuadrícula de entrada $grid$.

![Definición de estado y tabla dp](dp_solution_pipeline.assets/min_path_sum_solution_state_definition.png)

!!! note

    El proceso de programación dinámica y backtracking se puede describir como una secuencia de decisiones, y el estado está constituido por todas las variables de decisión. Debe contener todas las variables que describen el progreso de la solución y tener suficiente información para derivar el siguiente estado.

    Cada estado corresponde a un subproblema, y definiremos una tabla $dp$ para almacenar las soluciones a todos los subproblemas. Cada variable independiente del estado es una dimensión de la tabla $dp$. Esencialmente, la tabla $dp$ es un mapeo entre los estados y las soluciones de los subproblemas.

**Segundo paso: Encontrar la subestructura óptima y luego derivar la ecuación de transición de estado**

Para el estado $[i, j]$, solo se puede alcanzar desde la celda superior $[i-1, j]$ o la celda izquierda $[i, j-1]$. Por lo tanto, la subestructura óptima es: la suma mínima de la ruta para llegar a $[i, j]$ está determinada por la menor de las sumas mínimas de las rutas a $[i, j-1]$ y $[i-1, j]$.

Según el análisis anterior, podemos derivar la ecuación de transición de estado que se muestra en la siguiente figura:

$$
dp[i, j] = \min(dp[i-1, j], dp[i, j-1]) + grid[i, j]
$$

![Subestructura óptima y ecuación de transición de estado](dp_solution_pipeline.assets/min_path_sum_solution_state_transition.png)

!!! note

    Con base en la tabla $dp$ definida, considera la relación entre el problema original y los subproblemas. Encuentra un método para construir la solución óptima del problema original utilizando las soluciones óptimas de los subproblemas; esto es la subestructura óptima.

    Una vez que encontramos la subestructura óptima, podemos usarla para construir la ecuación de transición de estado.

**Tercer paso: Determinar las condiciones de contorno y el orden de transición de estado**

En este problema, los estados en la primera fila solo se pueden alcanzar desde sus estados a la izquierda, y los estados en la primera columna solo se pueden alcanzar desde sus estados superiores. Por lo tanto, la primera fila $i = 0$ y la primera columna $j = 0$ son las condiciones de contorno.

Como se muestra en la siguiente figura, dado que cada celda se alcanza desde su celda izquierda y su celda superior, usamos bucles para recorrer la matriz: el bucle exterior recorre las filas y el bucle interior recorre las columnas.

![Condiciones de contorno y orden de transición de estado](dp_solution_pipeline.assets/min_path_sum_solution_initial_state.png)

!!! note

    Las condiciones de contorno se utilizan en programación dinámica para inicializar la tabla $dp$ y en la búsqueda para la poda.

    El núcleo del orden de transición de estado es garantizar que cuando se calcula la solución al problema actual, ya se hayan calculado correctamente todas las soluciones a los subproblemas más pequeños de los que depende.

Según el análisis anterior, podemos escribir directamente el código de programación dinámica. Sin embargo, la descomposición de subproblemas es una idea de arriba hacia abajo, por lo que implementarla en el orden "búsqueda exhaustiva $\rightarrow$ búsqueda con memorización $\rightarrow$ programación dinámica" está más en línea con los hábitos de pensamiento.

### Método uno: Búsqueda Exhaustiva

Comenzando la búsqueda desde el estado $[i, j]$, se descompone continuamente en estados más pequeños $[i-1, j]$ y $[i, j-1]$. La función recursiva incluye los siguientes elementos.

- **Parámetros recursivos**: Estado $[i, j]$.
- **Valor de retorno**: La suma mínima de la ruta desde $[0, 0]$ hasta $[i, j]$, $dp[i, j]$.
- **Condición de terminación**: Cuando $i = 0$ y $j = 0$, devuelve el costo $grid[0, 0]$.
- **Poda**: Cuando $i < 0$ o $j < 0$, el índice está fuera de los límites. En este caso, devuelve un costo de $+\infty$, que representa la inviabilidad.

El código de implementación es el siguiente:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dfs}
```

La siguiente figura muestra el árbol de recursión con $dp[2, 1]$ como nodo raíz. Contiene algunos subproblemas superpuestos, cuyo número aumentará drásticamente a medida que aumente el tamaño de la cuadrícula `grid`.

Esencialmente, la razón de los subproblemas superpuestos es que **existen múltiples rutas desde la esquina superior izquierda hasta una celda determinada**.

![Árbol de recursión de búsqueda exhaustiva](dp_solution_pipeline.assets/min_path_sum_dfs.png)

Cada estado tiene dos opciones: hacia abajo o hacia la derecha. Se necesitan un total de $m + n - 2$ pasos para ir desde la esquina superior izquierda hasta la esquina inferior derecha. Por lo tanto, la complejidad de tiempo en el peor de los casos es $O(2^{m + n})$, donde $n$ y $m$ son el número de filas y columnas de la cuadrícula, respectivamente. Ten en cuenta que este método de cálculo no considera la situación cerca de los bordes de la cuadrícula; cuando se alcanza un borde de la cuadrícula, solo queda una opción, por lo que el número real de rutas será menor.

### Método dos: Búsqueda con Memorización

Introducimos una lista de memorización `mem` del mismo tamaño que la cuadrícula `grid` para registrar las soluciones de varios subproblemas y podar los subproblemas superpuestos:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dfs_mem}
```

Como se muestra en la siguiente figura, después de introducir la memorización, la solución a cada subproblema solo necesita calcularse una vez. Por lo tanto, la complejidad del tiempo depende del número total de estados, que es el tamaño de la cuadrícula $O(nm)$.

![Árbol de recursión de búsqueda con memorización](dp_solution_pipeline.assets/min_path_sum_dfs_mem.png)

### Método tres: Programación Dinámica

Implementación de la solución de programación dinámica basada en iteración. El código se muestra a continuación:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dp}
```

La siguiente figura muestra el proceso de transición de estado de la suma mínima de la ruta, que recorre toda la cuadrícula. **Por lo tanto, la complejidad del tiempo es $O(nm)$**.

El tamaño de la matriz `dp` es $n \times m$. **Por lo tanto, la complejidad del espacio es $O(nm)$**.

=== "<1>"
    ![Proceso de programación dinámica de suma mínima de ruta](dp_solution_pipeline.assets/min_path_sum_dp_step1.png)

=== "<2>"
    ![min_path_sum_dp_step2](dp_solution_pipeline.assets/min_path_sum_dp_step2.png)

=== "<3>"
    ![min_path_sum_dp_step3](dp_solution_pipeline.assets/min_path_sum_dp_step3.png)

=== "<4>"
    ![min_path_sum_dp_step4](dp_solution_pipeline.assets/min_path_sum_dp_step4.png)

=== "<5>"
    ![min_path_sum_dp_step5](dp_solution_pipeline.assets/min_path_sum_dp_step5.png)

=== "<6>"
    ![min_path_sum_dp_step6](dp_solution_pipeline.assets/min_path_sum_dp_step6.png)

=== "<7>"
    ![min_path_sum_dp_step7](dp_solution_pipeline.assets/min_path_sum_dp_step7.png)

=== "<8>"
    ![min_path_sum_dp_step8](dp_solution_pipeline.assets/min_path_sum_dp_step8.png)

=== "<9>"
    ![min_path_sum_dp_step9](dp_solution_pipeline.assets/min_path_sum_dp_step9.png)

=== "<10>"
    ![min_path_sum_dp_step10](dp_solution_pipeline.assets/min_path_sum_dp_step10.png)

=== "<11>"
    ![min_path_sum_dp_step11](dp_solution_pipeline.assets/min_path_sum_dp_step11.png)

=== "<12>"
    ![min_path_sum_dp_step12](dp_solution_pipeline.assets/min_path_sum_dp_step12.png)

### Optimización del Espacio

Dado que cada celda solo está relacionada con sus celdas izquierda y superior, podemos implementar la tabla $dp$ usando solo una matriz de una sola fila.

Ten en cuenta que debido a que la matriz `dp` solo puede representar el estado de una fila, no podemos inicializar el estado de la primera columna por adelantado. En su lugar, lo actualizamos mientras recorremos cada fila:

```src
[file]{min_path_sum}-[class]{}-[func]{min_path_sum_dp_comp}
```

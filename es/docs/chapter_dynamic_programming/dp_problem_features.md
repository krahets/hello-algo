# Características de los problemas de programación dinámica

En la sección anterior, aprendimos cómo la programación dinámica resuelve el problema original descomponiéndolo en subproblemas. De hecho, la descomposición de subproblemas es un enfoque algorítmico general, con diferentes énfasis en divide y vencerás, programación dinámica y backtracking.

- Los algoritmos de divide y vencerás dividen recursivamente el problema original en múltiples subproblemas independientes hasta que se alcanzan los subproblemas más pequeños, y combinan las soluciones de los subproblemas durante el backtracking para obtener finalmente la solución al problema original.
- La programación dinámica también descompone el problema recursivamente, pero la principal diferencia con los algoritmos de divide y vencerás es que los subproblemas en la programación dinámica son interdependientes, y aparecerán muchos subproblemas superpuestos durante el proceso de descomposición.
- Los algoritmos de backtracking agotan todas las soluciones posibles a través de prueba y error y evitan ramas de búsqueda innecesarias mediante la poda. La solución al problema original consiste en una serie de pasos de decisión, y podemos considerar cada subsecuencia antes de cada paso de decisión como un subproblema.

De hecho, la programación dinámica se usa comúnmente para resolver problemas de optimización, que no solo incluyen subproblemas superpuestos, sino que también tienen otras dos características importantes: subestructura óptima y ausencia de estado.

## Subestructura óptima

Hacemos una ligera modificación al problema de subir escaleras para que sea más adecuado para demostrar el concepto de subestructura óptima.

!!! question "Costo mínimo de subir escaleras"

    Dada una escalera, puedes subir 1 o 2 escalones a la vez, y cada escalón de la escalera tiene un entero no negativo que representa el costo que debes pagar en ese escalón. Dado un arreglo de enteros no negativos $cost$, donde $cost[i]$ representa el costo que debes pagar en el escalón $i$-ésimo, $cost[0]$ es el suelo (punto de partida). ¿Cuál es el costo mínimo requerido para llegar a la cima?

Como se muestra en la figura a continuación, si los costos de los escalones 1, 2 y 3 son $1$, $10$ y $1$ respectivamente, entonces el costo mínimo para subir al escalón 3 desde el suelo es $2$.

![Costo mínimo para subir al tercer escalón](dp_problem_features.assets/min_cost_cs_example.png)

Sea $dp[i]$ el costo acumulado de subir al escalón $i$-ésimo. Dado que el escalón $i$-ésimo solo puede provenir del escalón $i-1$ o $i-2$, $dp[i]$ solo puede ser $dp[i-1] + cost[i]$ o $dp[i-2] + cost[i]$. Para minimizar el costo, debemos elegir el menor de los dos:

$$
dp[i] = \min(dp[i-1], dp[i-2]) + cost[i]
$$

Esto nos lleva al significado de subestructura óptima: **La solución óptima al problema original se construye a partir de las soluciones óptimas de los subproblemas**.

Este problema obviamente tiene una subestructura óptima: seleccionamos la mejor de las soluciones óptimas de los dos subproblemas, $dp[i-1]$ y $dp[i-2]$, y la usamos para construir la solución óptima para el problema original $dp[i]$.

Entonces, ¿el problema de subir escaleras de la sección anterior tiene una subestructura óptima? Su objetivo es resolver el número de soluciones, lo que parece ser un problema de conteo, pero si preguntamos de otra manera: "Resolver el número máximo de soluciones". Sorprendentemente, encontramos que **aunque el problema ha cambiado, la subestructura óptima ha surgido**: el número máximo de soluciones en el $n$-ésimo escalón es igual a la suma del número máximo de soluciones en los escalones $n-1$ y $n-2$. Por lo tanto, la interpretación de la subestructura óptima es bastante flexible y tendrá diferentes significados en diferentes problemas.

Según la ecuación de transición de estado, y los estados iniciales $dp[1] = cost[1]$ y $dp[2] = cost[2]$, podemos obtener el código de programación dinámica:

```src
[file]{min_cost_climbing_stairs_dp}-[class]{}-[func]{min_cost_climbing_stairs_dp}
```

La figura a continuación muestra el proceso de programación dinámica para el código anterior.

![Proceso de programación dinámica para el costo mínimo de subir escaleras](dp_problem_features.assets/min_cost_cs_dp.png)

Este problema también se puede optimizar en espacio, comprimiendo una dimensión a cero, reduciendo la complejidad espacial de $O(n)$ a $O(1)$:

```src
[file]{min_cost_climbing_stairs_dp}-[class]{}-[func]{min_cost_climbing_stairs_dp_comp}
```

## Ausencia de estado

La ausencia de estado es una de las características importantes que hacen que la programación dinámica sea efectiva para resolver problemas. Su definición es: **Dado un cierto estado, su desarrollo futuro solo está relacionado con el estado actual y no está relacionado con todos los estados pasados experimentados**.

Tomando el problema de subir escaleras como ejemplo, dado el estado $i$, se desarrollará en los estados $i+1$ e $i+2$, correspondientes a saltar 1 escalón y 2 escalones respectivamente. Al tomar estas dos decisiones, no necesitamos considerar los estados anteriores al estado $i$, ya que no afectan el futuro del estado $i$.

Sin embargo, si agregamos una restricción al problema de subir escaleras, la situación cambia.

!!! question "Subir escaleras con restricciones"

    Dada una escalera con $n$ escalones, puedes subir 1 o 2 escalones cada vez, **pero no puedes saltar 1 escalón dos veces seguidas**. ¿Cuántas formas hay de subir a la cima?

Como se muestra en la figura a continuación, solo hay 2 opciones factibles para subir al escalón 3, entre las cuales la opción de saltar 1 escalón tres veces seguidas no cumple la condición de restricción y, por lo tanto, se descarta.

![Número de opciones factibles para subir al tercer escalón con restricciones](dp_problem_features.assets/climbing_stairs_constraint_example.png)

En este problema, si la última ronda fue un salto de 1 escalón, entonces la siguiente ronda debe ser un salto de 2 escalones. Esto significa que **la siguiente elección de paso no puede ser determinada independientemente por el estado actual (escalón actual), sino que también depende del estado anterior (escalón de la última ronda)**.

No es difícil encontrar que este problema ya no satisface la ausencia de estado, y la ecuación de transición de estado $dp[i] = dp[i-1] + dp[i-2]$ también falla, porque $dp[i-1]$ representa el salto de 1 escalón de esta ronda, pero incluye muchas opciones de "la última ronda fue un salto de 1 escalón", que, para cumplir la restricción, no pueden incluirse directamente en $dp[i]$.

Para esto, necesitamos expandir la definición de estado: **El estado $[i, j]$ representa estar en el escalón $i$-ésimo y la última ronda fue un salto de $j$ escalones**, donde $j \in \{1, 2\}$. Esta definición de estado distingue eficazmente si la última ronda fue un salto de 1 escalón o 2 escalones, y podemos juzgar en consecuencia de dónde provino el estado actual.

-   Cuando la última ronda fue un salto de 1 escalón, la ronda anterior solo pudo elegir saltar 2 escalones, es decir, $dp[i, 1]$ solo puede transferirse de $dp[i-1, 2]$.
-   Cuando la última ronda fue un salto de 2 escalones, la ronda anterior pudo elegir saltar 1 escalón o 2 escalones, es decir, $dp[i, 2]$ puede transferirse de $dp[i-2, 1]$ o $dp[i-2, 2]$.

Como se muestra en la figura a continuación, $dp[i, j]$ representa el número de soluciones para el estado $[i, j]$. En este punto, la ecuación de transición de estado es:

$$
\begin{cases}
dp[i, 1] = dp[i-1, 2] \\
dp[i, 2] = dp[i-2, 1] + dp[i-2, 2]
\end{cases}
$$

![Relación recursiva considerando restricciones](dp_problem_features.assets/climbing_stairs_constraint_state_transfer.png)

Al final, devolver $dp[n, 1] + dp[n, 2]$ será suficiente, la suma de los dos representa el número total de soluciones para subir al escalón $n$-ésimo:

```src
[file]{climbing_stairs_constraint_dp}-[class]{}-[func]{climbing_stairs_constraint_dp}
```

En los casos anteriores, dado que solo necesitamos considerar el estado anterior, aún podemos cumplir con la ausencia de estado expandiendo la definición de estado. Sin embargo, algunos problemas tienen "efectos de estado" muy graves.

!!! question "Subir escaleras con generación de obstáculos"

    Dada una escalera con $n$ escalones, puedes subir 1 o 2 escalones cada vez. **Se estipula que al subir al escalón $i$-ésimo, el sistema coloca automáticamente un obstáculo en el escalón $2i$-ésimo, y a partir de entonces no se permite saltar al escalón $2i$-ésimo en ninguna ronda**. Por ejemplo, si las dos primeras rondas saltan a los escalones 2 y 3, entonces más tarde no se puede saltar a los escalones 4 y 6. ¿Cuántas formas hay de subir a la cima?

En este problema, el siguiente salto depende de todos los estados pasados, ya que cada salto coloca obstáculos en escalones más altos, afectando los saltos futuros. Para tales problemas, la programación dinámica a menudo tiene dificultades para resolverlos.

De hecho, muchos problemas complejos de optimización combinatoria (como el problema del viajante de comercio) no satisfacen la ausencia de estado. Para este tipo de problemas, generalmente elegimos usar otros métodos, como la búsqueda heurística, los algoritmos genéticos, el aprendizaje por refuerzo, etc., para obtener soluciones óptimas locales utilizables en un tiempo limitado.

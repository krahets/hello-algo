# Introducción a la programación dinámica

La <u>programación dinámica</u> es un paradigma algorítmico importante que descompone un problema en una serie de subproblemas más pequeños y almacena las soluciones de estos subproblemas para evitar cálculos redundantes, mejorando así significativamente la eficiencia temporal.

En esta sección, comenzamos con un problema clásico, presentando primero su solución de backtracking por fuerza bruta, identificando los subproblemas superpuestos y luego derivando gradualmente una solución de programación dinámica más eficiente.

!!! question "Subir escaleras"

    Dada una escalera con $n$ escalones, donde puedes subir $1$ o $2$ escalones a la vez, ¿cuántas formas diferentes hay de llegar a la cima?

Como se muestra en la figura a continuación, hay $3$ formas de llegar a la cima de una escalera de $3$ escalones.

![Número de formas de llegar al tercer escalón](intro_to_dynamic_programming.assets/climbing_stairs_example.png)

Este problema tiene como objetivo calcular el número de formas **utilizando el backtracking para agotar todas las posibilidades**. Específicamente, considera el problema de subir escaleras como un proceso de elección de múltiples rondas: comenzando desde el suelo, eligiendo subir $1$ o $2$ escalones en cada ronda, incrementando el conteo de formas al llegar a la cima de las escaleras, y podando el proceso cuando excede la cima. El código es el siguiente:

```src
[file]{climbing_stairs_backtrack}-[class]{}-[func]{climbing_stairs_backtrack}
```

## Método 1: Búsqueda por fuerza bruta

Los algoritmos de backtracking no descomponen explícitamente el problema en subproblemas. En cambio, tratan el problema como una secuencia de pasos de decisión, explorando todas las posibilidades a través de prueba y poda.

Podemos analizar este problema utilizando un enfoque de descomposición. Sea $dp[i]$ el número de formas de llegar al escalón $i^{\text{ésimo}}$. En este caso, $dp[i]$ es el problema original, y sus subproblemas son:

$$
dp[i-1], dp[i-2], \dots, dp[2], dp[1]
$$

Dado que cada movimiento solo puede avanzar $1$ o $2$ escalones, cuando estamos en el escalón $i^{\text{ésimo}}$, el escalón anterior debe haber sido el $i-1^{\text{ésimo}}$ o el $i-2^{\text{ésimo}}$. En otras palabras, solo podemos llegar al $i^{\text{ésimo}}$ desde el escalón $i-1^{\text{ésimo}}$ o $i-2^{\text{ésimo}}$.

Esto lleva a una conclusión importante: **el número de formas de llegar al escalón $i-1^{\text{ésimo}}$ más el número de formas de llegar al escalón $i-2^{\text{ésimo}}$ es igual al número de formas de llegar al escalón $i^{\text{ésimo}}$**. La fórmula es la siguiente:

$$
dp[i] = dp[i-1] + dp[i-2]
$$

Esto significa que en el problema de subir escaleras, existe una relación recursiva entre los subproblemas, **la solución al problema original se puede construir a partir de las soluciones a los subproblemas**. La figura a continuación muestra esta relación recursiva.

![Relación recursiva de los recuentos de soluciones](intro_to_dynamic_programming.assets/climbing_stairs_state_transfer.png)

Podemos obtener la solución de búsqueda por fuerza bruta de acuerdo con la fórmula recursiva. Comenzando con $dp[n]$, **descomponemos recursivamente un problema más grande en la suma de dos subproblemas más pequeños**, hasta llegar a los subproblemas más pequeños $dp[1]$ y $dp[2]$ donde las soluciones son conocidas, con $dp[1] = 1$ y $dp[2] = 2$, que representan $1$ y $2$ formas de subir al primer y segundo escalón, respectivamente.

Observe el siguiente código, que, al igual que el código de backtracking estándar, pertenece a la búsqueda en profundidad pero es más conciso:

```src
[file]{climbing_stairs_dfs}-[class]{}-[func]{climbing_stairs_dfs}
```

La figura a continuación muestra el árbol recursivo formado por la búsqueda por fuerza bruta. Para el problema $dp[n]$, la profundidad de su árbol recursivo es $n$, con una complejidad temporal de $O(2^n)$. Este crecimiento exponencial hace que el programa se ejecute mucho más lentamente cuando $n$ es grande, lo que lleva a largos tiempos de espera.

![Árbol recursivo para subir escaleras](intro_to_dynamic_programming.assets/climbing_stairs_dfs_tree.png)

Observando la figura anterior, **la complejidad temporal exponencial es causada por 'subproblemas superpuestos'**. Por ejemplo, $dp[9]$ se descompone en $dp[8]$ y $dp[7]$, y $dp[8]$ se descompone aún más en $dp[7]$ y $dp[6]$, ambos conteniendo el subproblema $dp[7]$.

Así, los subproblemas incluyen subproblemas superpuestos aún más pequeños, sin fin. Una gran mayoría de los recursos computacionales se desperdician en estos subproblemas superpuestos.

## Método 2: Búsqueda memorizada

Para mejorar la eficiencia del algoritmo, **esperamos que todos los subproblemas superpuestos se calculen solo una vez**. Para este propósito, declaramos un arreglo `mem` para registrar la solución de cada subproblema, y podar los subproblemas superpuestos durante el proceso de búsqueda.

1.  Cuando $dp[i]$ se calcula por primera vez, lo registramos en `mem[i]` para su uso posterior.
2.  Cuando $dp[i]$ necesite calcularse de nuevo, podemos recuperar directamente el resultado de `mem[i]`, evitando así cálculos redundantes de ese subproblema.

El código es el siguiente:

```src
[file]{climbing_stairs_dfs_mem}-[class]{}-[func]{climbing_stairs_dfs_mem}
```

Observe la figura a continuación, **después de la memorización, todos los subproblemas superpuestos deben calcularse solo una vez, optimizando la complejidad temporal a $O(n)$**, lo cual es un salto significativo.

![Árbol recursivo con búsqueda memorizada](intro_to_dynamic_programming.assets/climbing_stairs_dfs_memo_tree.png)

## Método 3: Programación dinámica

**La búsqueda memorizada es un método 'de arriba hacia abajo'**: comenzamos con el problema original (nodo raíz), descomponemos recursivamente los subproblemas más grandes en otros más pequeños hasta que se alcanzan las soluciones a los subproblemas más pequeños conocidos (nodos hoja). Posteriormente, mediante el backtracking, recopilamos las soluciones de los subproblemas, construyendo la solución al problema original.

Por el contrario, **la programación dinámica es un método 'de abajo hacia arriba'**: comenzando con las soluciones a los subproblemas más pequeños, construye iterativamente las soluciones a subproblemas más grandes hasta que se resuelve el problema original.

Dado que la programación dinámica no implica backtracking, solo requiere iteración usando bucles y no necesita recursión. En el siguiente código, inicializamos un arreglo `dp` para almacenar las soluciones a los subproblemas, sirviendo la misma función de registro que el arreglo `mem` en la búsqueda memorizada:

```src
[file]{climbing_stairs_dp}-[class]{}-[func]{climbing_stairs_dp}
```

La figura a continuación simula el proceso de ejecución del código anterior.

![Proceso de programación dinámica para subir escaleras](intro_to_dynamic_programming.assets/climbing_stairs_dp.png)

Al igual que el algoritmo de backtracking, la programación dinámica también utiliza el concepto de "estados" para representar etapas específicas en la resolución de problemas, cada estado corresponde a un subproblema y su solución óptima local. Por ejemplo, el estado del problema de subir escaleras se define como el número de escalón actual $i$.

Basándonos en el contenido anterior, podemos resumir la terminología comúnmente utilizada en la programación dinámica.

-   El arreglo `dp` se denomina <u>tabla DP</u>, donde $dp[i]$ representa la solución al subproblema correspondiente al estado $i$.
-   Los estados correspondientes a los subproblemas más pequeños (pasos $1$ y $2$) se denominan <u>estados iniciales</u>.
-   La fórmula recursiva $dp[i] = dp[i-1] + dp[i-2]$ se denomina <u>ecuación de transición de estado</u>.

## Optimización del espacio

Los lectores observadores pueden haber notado que **dado que $dp[i]$ solo está relacionado con $dp[i-1]$ y $dp[i-2]$, no necesitamos usar un arreglo `dp` para almacenar las soluciones a todos los subproblemas**, sino que simplemente podemos usar dos variables para progresar iterativamente. El código es el siguiente:

```src
[file]{climbing_stairs_dp}-[class]{}-[func]{climbing_stairs_dp_comp}
```

Observando el código anterior, dado que se elimina el espacio ocupado por el arreglo `dp`, la complejidad espacial se reduce de $O(n)$ a $O(1)$.

En muchos problemas de programación dinámica, el estado actual depende solo de un número limitado de estados anteriores, lo que nos permite retener solo los estados necesarios y ahorrar espacio de memoria mediante la "reducción de dimensiones". **Esta técnica de optimización del espacio se conoce como 'variable rodante' o 'arreglo rodante'**.
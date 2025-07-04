# Complejidad temporal

El tiempo de ejecución puede evaluar intuitivamente la eficiencia de un algoritmo. ¿Cómo podemos estimar con precisión el tiempo de ejecución de una parte de un algoritmo?

1. **Determinación de la plataforma de ejecución**: Esto incluye la configuración del hardware, el lenguaje de programación, el entorno del sistema, etc., todo lo cual puede afectar la eficiencia de la ejecución del código.
2. **Evaluación del tiempo de ejecución para diversas operaciones computacionales**: Por ejemplo, una operación de suma `+` podría tardar 1 ns, una operación de multiplicación `*` podría tardar 10 ns, una operación de impresión `print()` podría tardar 5 ns, etc.
3. **Conteo de todas las operaciones computacionales en el código**: La suma de los tiempos de ejecución de todas estas operaciones da el tiempo de ejecución total.

Por ejemplo, considere el siguiente código con un tamaño de entrada de $n$:

=== "Python"

    ```python title=""
    # Bajo una plataforma operativa
    def algorithm(n: int):
        a = 2      # 1 ns
        a = a + 1  # 1 ns
        a = a * 2  # 10 ns
        # Ciclo n veces
        for _ in range(n):  # 1 ns
            print(0)        # 5 ns
    ```

=== "C++"

    ```cpp title=""
    // Bajo una plataforma operativa particular
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Bucle n veces
        for (int i = 0; i < n; i++) {  // 1 ns , en cada ronda se ejecuta i++
            cout << 0 << endl;         // 5 ns
        }
    }
    ```

=== "Java"

    ```java title=""
    // Bajo una plataforma operativa particular
    void algorithm(int n) {
        int a = 2;  // 1 ns
        a = a + 1;  // 1 ns
        a = a * 2;  // 10 ns
        // Bucle n veces
        for (int i = 0; i < n; i++) {  // 1 ns , en cada ronda se ejecuta i++
            System.out.println(0);     // 5 ns
        }
    }
    ```

Usando el método anterior, el tiempo de ejecución del algoritmo se puede calcular como $(6n + 12)$ ns:

$$
1 + 1 + 10 + (1 + 5) \times n = 6n + 12
$$

Sin embargo, en la práctica, **contar el tiempo de ejecución de un algoritmo no es práctico ni razonable**. Primero, no queremos vincular el tiempo estimado a la plataforma de ejecución, ya que los algoritmos deben ejecutarse en varias plataformas. Segundo, es difícil saber el tiempo de ejecución para cada tipo de operación, lo que dificulta el proceso de estimación.

## Evaluación de la tendencia de crecimiento del tiempo

El análisis de la complejidad temporal no cuenta el tiempo de ejecución del algoritmo, **sino la tendencia de crecimiento del tiempo de ejecución a medida que aumenta el volumen de datos**.

Entendamos este concepto de "tendencia de crecimiento del tiempo" con un ejemplo. Supongamos que el tamaño de los datos de entrada es $n$, y consideremos tres algoritmos `A`, `B` y `C`:

=== "Python"

    ```python title=""
    # Complejidad temporal del algoritmo A: orden constante
    def algorithm_A(n: int):
        print(0)
    # Complejidad temporal del algoritmo B: orden lineal
    def algorithm_B(n: int):
        for _ in range(n):
            print(0)
    # Complejidad temporal del algoritmo C: orden constante
    def algorithm_C(n: int):
        for _ in range(1000000):
            print(0)
    ```

La figura a continuación muestra las complejidades temporales de estos tres algoritmos.

- El algoritmo `A` tiene solo una operación de impresión, y su tiempo de ejecución no crece con $n$. Su complejidad temporal se considera de "orden constante".
- El algoritmo `B` implica una operación de impresión en un bucle $n$ veces, y su tiempo de ejecución crece linealmente con $n$. Su complejidad temporal es de "orden lineal".
- El algoritmo `C` tiene una operación de impresión en un bucle 1,000,000 de veces. Aunque tarda mucho tiempo, es independiente del tamaño de los datos de entrada $n$. Por lo tanto, la complejidad temporal de `C` es la misma que la de `A`, que es de "orden constante".

![Tendencia de crecimiento del tiempo de los algoritmos a, b y c](time_complexity.assets/time_complexity_simple_example.png)

En comparación con contar directamente el tiempo de ejecución de un algoritmo, ¿cuáles son las características del análisis de complejidad temporal?

- **La complejidad temporal evalúa eficazmente la eficiencia del algoritmo**. Por ejemplo, el algoritmo `B` tiene un tiempo de ejecución que crece linealmente, que es más lento que el algoritmo `A` cuando $n > 1$ y más lento que `C` cuando $n > 1,000,000$. De hecho, siempre que el tamaño de los datos de entrada $n$ sea suficientemente grande, un algoritmo de complejidad de "orden constante" siempre será mejor que uno de "orden lineal", lo que demuestra la esencia de la tendencia de crecimiento del tiempo.
- **El análisis de la complejidad temporal es más sencillo**. Obviamente, la plataforma de ejecución y los tipos de operaciones computacionales son irrelevantes para la tendencia de crecimiento del tiempo de ejecución. Por lo tanto, en el análisis de la complejidad temporal, podemos simplemente tratar el tiempo de ejecución de todas las operaciones computacionales como el mismo "tiempo unitario", simplificando el "conteo del tiempo de ejecución de la operación computacional" a un "conteo de operaciones computacionales". Esto reduce significativamente la complejidad de la estimación.
- **La complejidad temporal tiene sus limitaciones**. Por ejemplo, aunque los algoritmos `A` y `C` tienen la misma complejidad temporal, sus tiempos de ejecución reales pueden ser bastante diferentes. Del mismo modo, aunque el algoritmo `B` tiene una complejidad temporal mayor que `C`, es claramente superior cuando el tamaño de los datos de entrada $n$ es pequeño. En estos casos, es difícil juzgar la eficiencia de los algoritmos basándose únicamente en la complejidad temporal. No obstante, a pesar de estos problemas, el análisis de la complejidad sigue siendo el método más eficaz y comúnmente utilizado para evaluar la eficiencia de los algoritmos.

## Límite superior asintótico

Considere una función con un tamaño de entrada de $n$:

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +1
        a = a + 1  # +1
        a = a * 2  # +1
        # Ciclo n veces
        for i in range(n):  # +1
            print(0)        # +1
    ```

Dado una función que representa el número de operaciones de un algoritmo como una función del tamaño de la entrada $n$, denotada como $T(n)$, considere el siguiente ejemplo:

$$
T(n) = 3 + 2n
$$

Dado que $T(n)$ es una función lineal, su tendencia de crecimiento es lineal y, por lo tanto, su complejidad temporal es de orden lineal, denotada como $O(n)$. Esta notación matemática, conocida como \underline{notación de O grande}, representa el \underline{límite superior asintótico} de la función $T(n)$.

En esencia, el análisis de la complejidad temporal consiste en encontrar el límite superior asintótico del "número de operaciones $T(n)$". Tiene una definición matemática precisa.

!!! note "Límite superior asintótico"

    Si existen números reales positivos $c$ y $n_0$ tales que para todo $n > n_0$, $T(n) \leq c \cdot f(n)$, entonces se considera que $f(n)$ es un límite superior asintótico de $T(n)$, denotado como $T(n) = O(f(n))$.

Como se muestra en la figura a continuación, calcular el límite superior asintótico implica encontrar una función $f(n)$ tal que, a medida que $n$ se acerca al infinito, $T(n)$ y $f(n)$ tienen el mismo orden de crecimiento, difiriendo solo por un factor constante $c$.

![Límite superior asintótico de una función](time_complexity.assets/asymptotic_upper_bound.png)

## Método de cálculo

Si bien el concepto de límite superior asintótico puede parecer matemáticamente denso, no es necesario que lo comprenda por completo de inmediato. Primero entendamos el método de cálculo, que se puede practicar y comprender con el tiempo.

Una vez que se determina $f(n)$, obtenemos la complejidad temporal $O(f(n))$. Pero, ¿cómo determinamos el límite superior asintótico $f(n)$? Este proceso generalmente implica dos pasos: contar el número de operaciones y determinar el límite superior asintótico.

### Paso 1: contar el número de operaciones

Este paso implica revisar el código línea por línea. Sin embargo, debido a la presencia de la constante $c$ en $c \cdot f(n)$, **todos los coeficientes y términos constantes en $T(n)$ pueden ignorarse**. Este principio permite técnicas de simplificación en el conteo de operaciones.

1. **Ignorar los términos constantes en $T(n)$**, ya que no afectan a que la complejidad temporal sea independiente de $n$.
2. **Omitir todos los coeficientes**. Por ejemplo, un bucle de $2n$, $5n + 1$ veces, etc., se puede simplificar a $n$ veces, ya que el coeficiente antes de $n$ no afecta la complejidad temporal.
3. **Usar la multiplicación para bucles anidados**. El número total de operaciones es igual al producto del número de operaciones en cada bucle, aplicando las técnicas de simplificación de los puntos 1 y 2 para cada nivel de bucle.

Dado una función, podemos usar estas técnicas para contar operaciones:

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 1      # +0 (truco 1)
        a = a + n  # +0 (truco 1)
        # +n (técnica 2)
        for i in range(5 * n + 1):
            print(0)
        # +n*n (técnica 3)
        for i in range(2 * n):
            for j in range(n + 1):
                print(0)
    ```

La siguiente fórmula muestra los resultados del conteo antes y después de la simplificación, ambos conduciendo a una complejidad temporal de $O(n^2)$:

$$
\begin{aligned}
T(n) & = 2n(n + 1) + (5n + 1) + 2 & \text{Conteo completo (-.-|||)} \newline
& = 2n^2 + 7n + 3 \newline
T(n) & = n^2 + n & \text{Conteo simplificado (o.O)}
\end{aligned}
$$

### Paso 2: determinar el límite superior asintótico

**La complejidad temporal está determinada por el término de orden más alto en $T(n)$**. Esto se debe a que, a medida que $n$ se acerca al infinito, el término de orden más alto domina, haciendo que la influencia de otros términos sea insignificante.

La siguiente tabla ilustra ejemplos de diferentes recuentos de operaciones y sus correspondientes complejidades temporales. Se utilizan algunos valores exagerados para enfatizar que los coeficientes no pueden alterar el orden de crecimiento. Cuando $n$ se vuelve muy grande, estas constantes se vuelven insignificantes.

<p align="center"> Tabla: Complejidad temporal para diferentes recuentos de operaciones </p>

| Recuento de operaciones $T(n)$ | Complejidad temporal $O(f(n))$ |
| ---------------------- | ------------------------- |
| $100000$               | $O(1)$                    |
| $3n + 2$               | $O(n)$                    |
| $2n^2 + 3n + 2$        | $O(n^2)$                  |
| $n^3 + 10000n^2$       | $O(n^3)$                  |
| $2^n + 10000n^{10000}$ | $O(2^n)$                  |

## Tipos comunes de complejidad temporal

Consideremos el tamaño de los datos de entrada como $n$. Los tipos comunes de complejidades temporales se muestran en la figura a continuación, ordenados de menor a mayor:

$$
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n \log n) < O(n^2) < O(2^n) < O(n!) \newline
& \text{Constante} < \text{Logarítmico} < \text{Lineal} < \text{Lineal-Logarítmico} < \text{Cuadrático} < \text{Exponencial} < \text{Factorial}
\end{aligned}
$$

![Tipos comunes de complejidad temporal](time_complexity.assets/time_complexity_common_types.png)

### Orden constante $O(1)$

El orden constante significa que el número de operaciones es independiente del tamaño de los datos de entrada $n$. En la siguiente función, aunque el número de operaciones `size` puede ser grande, la complejidad temporal sigue siendo $O(1)$ ya que no está relacionada con $n$:

```src
[file]{time_complexity}-[class]{}-[func]{constant}
```

### Orden lineal $O(n)$

El orden lineal indica que el número de operaciones crece linealmente con el tamaño de los datos de entrada $n$. El orden lineal aparece comúnmente en estructuras de un solo bucle:

```src
[file]{time_complexity}-[class]{}-[func]{linear}
```

Operaciones como el recorrido de arreglos y el recorrido de listas enlazadas tienen una complejidad temporal de $O(n)$, donde $n$ es la longitud del arreglo o la lista:

```src
[file]{time_complexity}-[class]{}-[func]{array_traversal}
```

Es importante tener en cuenta que **el tamaño de los datos de entrada $n$ debe determinarse en función del tipo de datos de entrada**. Por ejemplo, en el primer ejemplo, $n$ representa el tamaño de los datos de entrada, mientras que en el segundo ejemplo, la longitud del arreglo $n$ es el tamaño de los datos.

### Orden cuadrático $O(n^2)$

El orden cuadrático significa que el número de operaciones crece cuadráticamente con el tamaño de los datos de entrada $n$. El orden cuadrático suele aparecer en bucles anidados, donde tanto el bucle externo como el interno tienen una complejidad temporal de $O(n)$, lo que da como resultado una complejidad general de $O(n^2)$:

```src
[file]{time_complexity}-[class]{}-[func]{quadratic}
```

La siguiente figura compara las complejidades temporales de orden constante, lineal y cuadrático.

![Complejidades temporales de orden constante, lineal y cuadrático](time_complexity.assets/time_complexity_constant_linear_quadratic.png)

Por ejemplo, en el ordenamiento de burbuja, el bucle externo se ejecuta $n - 1$ veces, y el bucle interno se ejecuta $n-1$, $n-2$, ..., $2$, $1$ veces, con un promedio de $n / 2$ veces, lo que da como resultado una complejidad temporal de $O((n - 1) n / 2) = O(n^2)$:

```src
[file]{time_complexity}-[class]{}-[func]{bubble_sort}
```

### Orden exponencial $O(2^n)$

La "división celular" biológica es un ejemplo clásico de crecimiento de orden exponencial: comenzando con una célula, se convierte en dos después de una división, cuatro después de dos divisiones, y así sucesivamente, lo que da como resultado $2^n$ células después de $n$ divisiones.

La siguiente figura y el código simulan el proceso de división celular, con una complejidad temporal de $O(2^n)$:

```src
[file]{time_complexity}-[class]{}-[func]{exponential}
```

![Complejidad temporal de orden exponencial](time_complexity.assets/time_complexity_exponential.png)

En la práctica, el orden exponencial aparece a menudo en funciones recursivas. Por ejemplo, en el siguiente código, se divide recursivamente en dos mitades, deteniéndose después de $n$ divisiones:

```src
[file]{time_complexity}-[class]{}-[func]{exp_recur}
```

El crecimiento de orden exponencial es extremadamente rápido y se ve comúnmente en métodos de búsqueda exhaustiva (fuerza bruta, backtracking, etc.). Para problemas a gran escala, el orden exponencial es inaceptable, y a menudo se requieren soluciones de programación dinámica o algoritmos codiciosos.

### Orden logarítmico $O(\log n)$

En contraste con el orden exponencial, el orden logarítmico refleja situaciones en las que "el tamaño se reduce a la mitad en cada ronda". Dado un tamaño de datos de entrada $n$, dado que el tamaño se reduce a la mitad en cada ronda, el número de iteraciones es $\log_2 n$, la función inversa de $2^n$.

La siguiente figura y el código simulan el proceso de "reducir a la mitad en cada ronda", con una complejidad temporal de $O(\log_2 n)$, comúnmente abreviado como $O(\log n)$:

```src
[file]{time_complexity}-[class]{}-[func]{logarithmic}
```

![Complejidad temporal de orden logarítmico](time_complexity.assets/time_complexity_logarithmic.png)

Al igual que el orden exponencial, el orden logarítmico también aparece con frecuencia en funciones recursivas. El siguiente código forma un árbol recursivo de altura $\log_2 n$:

```src
[file]{time_complexity}-[class]{}-[func]{log_recur}
```

El orden logarítmico es típico en algoritmos basados en la estrategia de divide y vencerás, que encarna el enfoque de "dividir en muchos" y "simplificar problemas complejos". Es de crecimiento lento y es la complejidad temporal más ideal después del orden constante.

!!! tip "¿Cuál es la base de $O(\log n)$?"

    Técnicamente, "dividir en $m$" corresponde a una complejidad temporal de $O(\log_m n)$. Usando la fórmula de cambio de base del logaritmo, podemos equiparar diferentes complejidades logarítmicas:

    $$
    O(\log_m n) = O(\log_k n / \log_k m) = O(\log_k n)
    $$

    Esto significa que la base $m$ se puede cambiar sin afectar la complejidad. Por lo tanto, a menudo omitimos la base $m$ y simplemente denotamos el orden logarítmico como $O(\log n)$.

### Orden lineal-logarítmico $O(n \log n)$

El orden lineal-logarítmico aparece a menudo en bucles anidados, con las complejidades de los dos bucles siendo $O(\log n)$ y $O(n)$ respectivamente. El código relacionado es el siguiente:

```src
[file]{time_complexity}-[class]{}-[func]{linear_log_recur}
```

La siguiente figura demuestra cómo se genera el orden lineal-logarítmico. Cada nivel de un árbol binario tiene $n$ operaciones, y el árbol tiene $\log_2 n + 1$ niveles, lo que da como resultado una complejidad temporal de $O(n \log n)$.

![Complejidad temporal de orden lineal-logarítmico](time_complexity.assets/time_complexity_logarithmic_linear.png)

Los algoritmos de ordenación convencionales suelen tener una complejidad temporal de $O(n \log n)$, como el ordenamiento rápido, el ordenamiento por fusión y el ordenamiento por montículos.

### Orden factorial $O(n!)$

El orden factorial corresponde al problema matemático de la "permutación completa". Dados $n$ elementos distintos, el número total de permutaciones posibles es:

$$
n! = n \times (n - 1) \times (n - 2) \times \dots \times 2 \times 1
$$

Los factoriales se implementan normalmente mediante recursión. Como se muestra en el código y la figura a continuación, el primer nivel se divide en $n$ ramas, el segundo nivel en $n - 1$ ramas, y así sucesivamente, deteniéndose después del nivel $n$:

```src
[file]{time_complexity}-[class]{}-[func]{factorial_recur}
```

![Complejidad temporal de orden factorial](time_complexity.assets/time_complexity_factorial.png)

Nótese que el orden factorial crece incluso más rápido que el orden exponencial; es inaceptable para valores de $n$ más grandes.

## Complejidades temporales en el peor, mejor y promedio de los casos

**La eficiencia temporal de un algoritmo a menudo no es fija, sino que depende de la distribución de los datos de entrada**. Supongamos que tenemos un arreglo `nums` de longitud $n$, que consta de números del $1$ al $n$, cada uno de los cuales aparece solo una vez, pero en un orden barajado al azar. La tarea es devolver el índice del elemento $1$. Podemos sacar las siguientes conclusiones:

- Cuando `nums = [?, ?, ..., 1]`, es decir, cuando el último elemento es $1$, se requiere un recorrido completo del arreglo, **alcanzando la complejidad temporal en el peor de los casos de $O(n)$**.
- Cuando `nums = [1, ?, ?, ...]`, es decir, cuando el primer elemento es $1$, no importa la longitud del arreglo, no se necesita más recorrido, **alcanzando la complejidad temporal en el mejor de los casos de $\Omega(1)$**.

La "complejidad temporal en el peor de los casos" corresponde al límite superior asintótico, denotado por la notación de O grande. Correspondientemente, la "complejidad temporal en el mejor de los casos" corresponde al límite inferior asintótico, denotado por $\Omega$:

```src
[file]{worst_best_time_complexity}-[class]{}-[func]{find_one}
```

Es importante tener en cuenta que la complejidad temporal en el mejor de los casos rara vez se utiliza en la práctica, ya que generalmente solo se puede lograr con probabilidades muy bajas y puede ser engañosa. **La complejidad temporal en el peor de los casos es más práctica, ya que proporciona un valor de seguridad para la eficiencia**, lo que nos permite utilizar el algoritmo con confianza.

Del ejemplo anterior, está claro que tanto las complejidades temporales en el peor como en el mejor de los casos solo ocurren bajo "distribuciones de datos especiales", que pueden tener una pequeña probabilidad de ocurrencia y pueden no reflejar con precisión la eficiencia de ejecución del algoritmo. En contraste, **la complejidad temporal promedio puede reflejar la eficiencia del algoritmo bajo datos de entrada aleatorios**, denotada por la notación $\Theta$.

Para algunos algoritmos, podemos simplemente estimar el caso promedio bajo una distribución de datos aleatoria. Por ejemplo, en el ejemplo mencionado anteriormente, dado que el arreglo de entrada está barajado, la probabilidad de que el elemento $1$ aparezca en cualquier índice es igual. Por lo tanto, el número promedio de bucles para el algoritmo es la mitad de la longitud del arreglo $n / 2$, lo que da una complejidad temporal promedio de $\Theta(n / 2) = \Theta(n)$.

Sin embargo, calcular la complejidad temporal promedio para algoritmos más complejos puede ser bastante difícil, ya que es un desafío analizar la expectativa matemática general bajo la distribución de datos. En tales casos, generalmente usamos la complejidad temporal en el peor de los casos como el estándar para juzgar la eficiencia del algoritmo.

!!! question "¿Por qué rara vez se ve el símbolo $\Theta$?"

    Posiblemente porque la notación $O$ se habla más comúnmente, a menudo se usa para representar la complejidad temporal promedio. Sin embargo, estrictamente hablando, esta práctica no es precisa. En este libro y otros materiales, si encuentra declaraciones como "complejidad temporal promedio $O(n)$", por favor, entiéndalo directamente como $\Theta(n)$.
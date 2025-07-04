# Complejidad espacial

La <u>complejidad espacial</u> se utiliza para medir la tendencia de crecimiento del espacio de memoria ocupado por un algoritmo a medida que aumenta la cantidad de datos. Este concepto es muy similar a la complejidad temporal, excepto que el "tiempo de ejecución" se reemplaza por "espacio de memoria ocupado".

## Espacio relacionado con los algoritmos

El espacio de memoria utilizado por un algoritmo durante su ejecución incluye principalmente los siguientes tipos.

- **Espacio de entrada**: Se utiliza para almacenar los datos de entrada del algoritmo.
- **Espacio temporal**: Se utiliza para almacenar variables, objetos, contextos de funciones y otros datos durante la ejecución del algoritmo.
- **Espacio de salida**: Se utiliza para almacenar los datos de salida del algoritmo.

Generalmente, el alcance de las estadísticas de complejidad espacial incluye tanto el "Espacio temporal" como el "Espacio de salida".

El espacio temporal se puede dividir a su vez en tres partes.

- **Datos temporales**: Se utilizan para guardar varias constantes, variables, objetos, etc., durante la ejecución del algoritmo.
- **Espacio de marco de pila**: Se utiliza para guardar los datos de contexto de la función llamada. El sistema crea un marco de pila en la parte superior de la pila cada vez que se llama a una función, y el espacio del marco de pila se libera después de que la función regresa.
- **Espacio de instrucciones**: Se utiliza para almacenar instrucciones de programa compiladas, que generalmente son insignificantes en las estadísticas reales.

Al analizar la complejidad espacial de un programa, **normalmente contamos los datos temporales, el espacio del marco de pila y los datos de salida**, como se muestra en la figura a continuación.

![Tipos de espacio utilizados en los algoritmos](space_complexity.assets/space_types.png)

El código relevante es el siguiente:

=== "Python"

    ```python title=""
    class Node:
        """Clases"""
        def __init__(self, x: int):
            self.val: int = x               # valor del nodo
            self.next: Node | None = None   # referencia al siguiente nodo

    def function() -> int:
        """Funciones"""
        # Realizar ciertas operaciones...
        return 0

    def algorithm(n) -> int:    # datos de entrada
        A = 0                   # datos temporales (constante, generalmente en mayúsculas)
        b = 0                   # datos temporales (variable)
        node = Node(0)          # datos temporales (objeto)
        c = function()          # Espacio de marco de pila (llamar a la función)
        return A + b + c        # datos de salida
    ```

## Método de cálculo

El método para calcular la complejidad espacial es aproximadamente similar al de la complejidad temporal, con el único cambio de que el objeto estadístico pasa de ser el "número de operaciones" al "tamaño del espacio utilizado".

Sin embargo, a diferencia de la complejidad temporal, **normalmente solo nos centramos en la complejidad espacial en el peor de los casos**. Esto se debe a que el espacio de memoria es un requisito estricto y debemos asegurarnos de que haya suficiente espacio de memoria reservado para todos los datos de entrada.

Considere el siguiente código, el término "peor de los casos" en la complejidad espacial en el peor de los casos tiene dos significados.

1.  **Basado en los peores datos de entrada**: Cuando $n < 10$, la complejidad espacial es $O(1)$; pero cuando $n > 10$, el arreglo inicializado `nums` ocupa un espacio de $O(n)$, por lo que la complejidad espacial en el peor de los casos es $O(n)$.
2.  **Basado en el pico de memoria utilizado durante la ejecución del algoritmo**: Por ejemplo, antes de ejecutar la última línea, el programa ocupa un espacio de $O(1)$; al inicializar el arreglo `nums`, el programa ocupa un espacio de $O(n)$, por lo que la complejidad espacial en el peor de los casos es $O(n)$.

=== "Python"

    ```python title=""
    def algorithm(n: int):
        a = 0               # O(1)
        b = [0] * 10000     # O(1)
        if n > 10:
            nums = [0] * n  # O(n)
    ```

**En las funciones recursivas, se debe tener en cuenta el espacio del marco de pila**. Considere el siguiente código:

=== "Python"

    ```python title=""
    def function() -> int:
        # Realizar ciertas operaciones
        return 0

    def loop(n: int):
        """Bucle O(1)"""
        for _ in range(n):
            function()

    def recur(n: int):
        """Recursión O(n)"""
        if n == 1:
            return
        return recur(n - 1)
    ```

La complejidad temporal de las funciones `loop()` y `recur()` es $O(n)$, pero sus complejidades espaciales difieren.

-   La función `loop()` llama a `function()` $n$ veces en un bucle, donde el `function()` de cada iteración regresa y libera su espacio de marco de pila, por lo que la complejidad espacial permanece en $O(1)$.
-   La función recursiva `recur()` tendrá $n$ instancias de la función `recur()` no devueltas que existen simultáneamente durante su ejecución, por lo que ocupa un espacio de marco de pila de $O(n)$.

## Tipos comunes

Sea el tamaño de los datos de entrada $n$, la siguiente figura muestra los tipos comunes de complejidades espaciales (ordenados de menor a mayor).

$$ 
\begin{aligned}
& O(1) < O(\log n) < O(n) < O(n^2) < O(2^n) \\
& \text{Constante} < \text{Logarítmico} < \text{Lineal} < \text{Cuadrático} < \text{Exponencial}
\end{aligned}
$$

![Tipos comunes de complejidad espacial](space_complexity.assets/space_complexity_common_types.png)

### Orden constante $O(1)$

El orden constante es común en constantes, variables, objetos que son independientes del tamaño de los datos de entrada $n$.

Tenga en cuenta que la memoria ocupada al inicializar variables o llamar a funciones en un bucle, que se libera al entrar en el siguiente ciclo, no se acumula en el espacio, por lo que la complejidad espacial permanece en $O(1)$:

```src
[file]{space_complexity}-[class]{}-[func]{constant}
```

### Orden lineal $O(n)$

El orden lineal es común en arreglos, listas enlazadas, pilas, colas, etc., donde el número de elementos es proporcional a $n$:

```src
[file]{space_complexity}-[class]{}-[func]{linear}
```

Como se muestra en la figura a continuación, la profundidad recursiva de esta función es $n$, lo que significa que hay $n$ instancias de la función `linear_recur()` no devueltas, que utilizan un tamaño de $O(n)$ de espacio de marco de pila:

```src
[file]{space_complexity}-[class]{}-[func]{linear_recur}
```

![Función recursiva que genera una complejidad espacial de orden lineal](space_complexity.assets/space_complexity_recursive_linear.png)

### Orden cuadrático $O(n^2)$

El orden cuadrático es común en matrices y grafos, donde el número de elementos es cuadrático a $n$:

```src
[file]{space_complexity}-[class]{}-[func]{quadratic}
```

Como se muestra en la figura a continuación, la profundidad recursiva de esta función es $n$, y en cada llamada recursiva, se inicializa un arreglo con longitudes $n$, $n-1$, $\dots$, $2$, $1$, con un promedio de $n/2$, por lo que en general ocupa un espacio de $O(n^2)$:

```src
[file]{space_complexity}-[class]{}-[func]{quadratic_recur}
```

![Función recursiva que genera una complejidad espacial de orden cuadrático](space_complexity.assets/space_complexity_recursive_quadratic.png)

### Orden exponencial $O(2^n)$

El orden exponencial es común en los árboles binarios. Observe la figura a continuación, un "árbol binario completo" con $n$ niveles tiene $2^n - 1$ nodos, ocupando un espacio de $O(2^n)$:

```src
[file]{space_complexity}-[class]{}-[func]{build_tree}
```

![Árbol binario completo que genera una complejidad espacial de orden exponencial](space_complexity.assets/space_complexity_exponential.png)

### Orden logarítmico $O(\log n)$

El orden logarítmico es común en los algoritmos de divide y vencerás. Por ejemplo, en el ordenamiento por fusión, un arreglo de longitud $n$ se divide recursivamente por la mitad en cada ronda, formando un árbol de recursión de altura $\log n$, utilizando un espacio de marco de pila de $O(\log n)$.

Otro ejemplo es convertir un número en una cadena. Dado un entero positivo $n$, su número de dígitos es $\log_{10} n + 1$, que corresponde a la longitud de la cadena, por lo que la complejidad espacial es $O(\log_{10} n + 1) = O(\log n)$.

## Equilibrio entre tiempo y espacio

Idealmente, nuestro objetivo es que tanto la complejidad temporal como la espacial sean óptimas. Sin embargo, en la práctica, optimizar ambas simultáneamente suele ser difícil.

**Reducir la complejidad temporal generalmente se logra a costa de una mayor complejidad espacial, y viceversa**. El enfoque de sacrificar el espacio de memoria para mejorar la velocidad del algoritmo se conoce como "intercambio espacio-tiempo"; lo contrario se conoce como "intercambio tiempo-espacio".

La elección depende de qué aspecto valoremos más. En la mayoría de los casos, el tiempo es más valioso que el espacio, por lo que el "intercambio espacio-tiempo" suele ser la estrategia más común. Por supuesto, controlar la complejidad espacial también es muy importante cuando se trata de grandes volúmenes de datos.

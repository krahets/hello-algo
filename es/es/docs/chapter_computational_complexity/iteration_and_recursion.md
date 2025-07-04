# Iteración y recursión

En los algoritmos, la ejecución repetida de una tarea es bastante común y está estrechamente relacionada con el análisis de la complejidad. Por lo tanto, antes de profundizar en los conceptos de complejidad temporal y espacial, exploremos primero cómo implementar tareas repetitivas en la programación. Esto implica comprender dos estructuras de control de programación fundamentales: la iteración y la recursión.

## Iteración

La <u>iteración</u> es una estructura de control para realizar repetidamente una tarea. En la iteración, un programa repite un bloque de código siempre que se cumpla una determinada condición hasta que esta condición ya no se satisfaga.

### Bucles for

El bucle `for` es una de las formas más comunes de iteración, y **es particularmente adecuado cuando se conoce de antemano el número de iteraciones**.

La siguiente función utiliza un bucle `for` para realizar una suma de $1 + 2 + \dots + n$, y la suma se almacena en la variable `res`. Es importante tener en cuenta que en Python, `range(a, b)` crea un intervalo que incluye `a` pero excluye `b`, lo que significa que itera sobre el rango desde $a$ hasta $b-1$.

```src
[file]{iteration}-[class]{}-[func]{for_loop}
```

La siguiente figura representa esta función de suma.

![Diagrama de flujo de la función de suma](iteration_and_recursion.assets/iteration.png)

El número de operaciones en esta función de suma es proporcional al tamaño de los datos de entrada $n$, o en otras palabras, tiene una relación lineal. **Esta "relación lineal" es lo que describe la complejidad temporal**. Este tema se discutirá con más detalle en la siguiente sección.

### Bucles while

Al igual que los bucles `for`, los bucles `while` son otro enfoque para implementar la iteración. En un bucle `while`, el programa comprueba una condición al principio de cada iteración; si la condición es verdadera, la ejecución continúa, de lo contrario, el bucle finaliza.

A continuación, utilizamos un bucle `while` para implementar la suma $1 + 2 + \dots + n$.

```src
[file]{iteration}-[class]{}-[func]{while_loop}
```

**Los bucles `while` proporcionan más flexibilidad que los bucles `for`**, especialmente porque permiten la inicialización y modificación personalizadas de la variable de condición en cada paso.

Por ejemplo, en el siguiente código, la variable de condición $i$ se actualiza dos veces en cada ronda, lo que sería un inconveniente de implementar con un bucle `for`.

```src
[file]{iteration}-[class]{}-[func]{while_loop_ii}
```

En general, **los bucles `for` son más concisos, mientras que los bucles `while` son más flexibles**. Ambos pueden implementar estructuras iterativas. Cuál usar debe determinarse en función de los requisitos específicos del problema.

### Bucles anidados

Podemos anidar una estructura de bucle dentro de otra. A continuación se muestra un ejemplo con bucles `for`:

```src
[file]{iteration}-[class]{}-[func]{nested_for_loop}
```

La siguiente figura representa este bucle anidado.

![Diagrama de flujo del bucle anidado](iteration_and_recursion.assets/nested_iteration.png)

En tales casos, el número de operaciones de la función es proporcional a $n^2$, lo que significa que el tiempo de ejecución del algoritmo y el tamaño de los datos de entrada $n$ tienen una "relación cuadrática".

Podemos aumentar aún más la complejidad agregando más bucles anidados, cada nivel de anidación efectivamente "aumentando la dimensión", lo que eleva la complejidad temporal a "cúbica", "cuártica", etc.

## Recursión

La <u>recursión</u> es una estrategia algorítmica en la que una función resuelve un problema llamándose a sí misma. Implica principalmente dos fases:

1.  **Llamada**: Aquí es donde el programa se llama a sí mismo repetidamente, a menudo con argumentos progresivamente más pequeños o más simples, avanzando hacia la "condición de terminación".
2.  **Retorno**: Al activar la "condición de terminación", el programa comienza a regresar desde la función recursiva más profunda, agregando los resultados de cada capa.

Desde una perspectiva de implementación, el código recursivo incluye principalmente tres elementos.

1.  **Condición de terminación**: Determina cuándo cambiar de "llamada" a "retorno".
2.  **Llamada recursiva**: Corresponde a la "llamada", donde la función se llama a sí misma, generalmente con parámetros más pequeños o simplificados.
3.  **Resultado de retorno**: Corresponde al "retorno", donde el resultado del nivel de recursión actual se devuelve a la capa anterior.

Observe el siguiente código, donde simplemente llamar a la función `recur(n)` puede calcular la suma de $1 + 2 + \dots + n$:

```src
[file]{recursion}-[class]{}-[func]{recur}
```

La siguiente figura muestra el proceso recursivo de esta función.

![Proceso recursivo de la función de suma](iteration_and_recursion.assets/recursion_sum.png)

Aunque la iteración y la recursión pueden lograr los mismos resultados desde un punto de vista computacional, **representan dos paradigmas de pensamiento y resolución de problemas completamente diferentes**.

-   **Iteración**: Resuelve problemas "de abajo hacia arriba". Comienza con los pasos más básicos y luego agrega o acumula repetidamente estos pasos hasta que se completa la tarea.
-   **Recursión**: Resuelve problemas "de arriba hacia abajo". Descompone el problema original en subproblemas más pequeños, cada uno de los cuales tiene la misma forma que el problema original. Estos subproblemas se descomponen aún más en subproblemas aún más pequeños, deteniéndose en el caso base cuya solución se conoce.

Tomemos el ejemplo anterior de la función de suma, definida como $f(n) = 1 + 2 + \dots + n$.

-   **Iteración**: En este enfoque, simulamos el proceso de suma dentro de un bucle. Comenzando desde $1$ y recorriendo hasta $n$, realizamos la operación de suma en cada iteración para finalmente calcular $f(n)$.
-   **Recursión**: Aquí, el problema se descompone en un subproblema: $f(n) = n + f(n-1)$. Esta descomposición continúa recursivamente hasta llegar al caso base, $f(1) = 1$, momento en el que finaliza la recursión.

### Pila de llamadas

Cada vez que una función recursiva se llama a sí misma, el sistema asigna memoria para que la función recién iniciada almacene variables locales, la dirección de retorno y otra información relevante. Esto conduce a dos resultados principales.

-   Los datos de contexto de la función se almacenan en un área de memoria llamada "espacio de marco de pila" y solo se liberan después de que la función regresa. Por lo tanto, **la recursión generalmente consume más espacio de memoria que la iteración**.
-   Las llamadas recursivas introducen una sobrecarga adicional. **Por lo tanto, la recursión suele ser menos eficiente en tiempo que los bucles.**

Como se muestra en la figura a continuación, hay $n$ funciones recursivas no devueltas antes de activar la condición de terminación, lo que indica una **profundidad de recursión de $n$**.

![Profundidad de la llamada de recursión](iteration_and_recursion.assets/recursion_sum_depth.png)

En la práctica, la profundidad de la recursión permitida por los lenguajes de programación suele ser limitada, y una recursión excesivamente profunda puede provocar errores de desbordamiento de la pila.

### Recursión de cola

Curiosamente, **si una función realiza su llamada recursiva como el último paso antes de regresar,** el compilador o intérprete puede optimizarla para que sea tan eficiente en espacio como la iteración. Este escenario se conoce como <u>recursión de cola</u>.

-   **Recursión regular**: En la recursión estándar, cuando la función regresa al nivel anterior, continúa ejecutando más código, lo que requiere que el sistema guarde el contexto de la llamada anterior.
-   **Recursión de cola**: Aquí, la llamada recursiva es la operación final antes de que la función regrese. Esto significa que al regresar al nivel anterior, no se necesitan más acciones, por lo que el sistema no necesita guardar el contexto del nivel anterior.

Por ejemplo, al calcular $1 + 2 + \dots + n$, podemos hacer que la variable de resultado `res` sea un parámetro de la función, logrando así la recursión de cola:

```src
[file]{recursion}-[class]{}-[func]{tail_recur}
```

El proceso de ejecución de la recursión de cola se muestra en la figura a continuación. Comparando la recursión regular y la recursión de cola, el punto de la operación de suma es diferente.

-   **Recursión regular**: La operación de suma ocurre durante la fase de "retorno", lo que requiere otra suma después de que cada capa regresa.
-   **Recursión de cola**: La operación de suma ocurre durante la fase de "llamada", y la fase de "retorno" solo implica regresar a través de cada capa.

![Proceso de recursión de cola](iteration_and_recursion.assets/tail_recursion_sum.png)

!!! tip

    Tenga en cuenta que muchos compiladores o intérpretes no admiten la optimización de la recursión de cola. Por ejemplo, Python no admite la optimización de la recursión de cola de forma predeterminada, por lo que incluso si la función tiene la forma de recursión de cola, aún puede encontrar problemas de desbordamiento de la pila.

### Árbol de recursión

Cuando se trata de algoritmos relacionados con "divide y vencerás", la recursión a menudo ofrece un enfoque más intuitivo y un código más legible que la iteración. Tomemos como ejemplo la "secuencia de Fibonacci".

!!! question

    Dada una secuencia de Fibonacci $0, 1, 1, 2, 3, 5, 8, 13, \dots$, encuentre el número $n$ en la secuencia.

Sea el número $n$ de la secuencia de Fibonacci $f(n)$, es fácil deducir dos conclusiones:

-   Los dos primeros números de la secuencia son $f(1) = 0$ y $f(2) = 1$.
-   Cada número de la secuencia es la suma de los dos anteriores, es decir, $f(n) = f(n - 1) + f(n - 2)$.

Usando la relación recursiva y considerando los dos primeros números como condiciones de terminación, podemos escribir el código recursivo. Llamar a `fib(n)` producirá el número $n$ de la secuencia de Fibonacci:

```src
[file]{recursion}-[class]{}-[func]{fib}
```

Al observar el código anterior, vemos que llama recursivamente a dos funciones dentro de sí mismo, **lo que significa que una llamada genera dos llamadas de bifurcación**. Como se ilustra en la figura a continuación, esta llamada recursiva continua finalmente crea un <u>árbol de recursión</u> con una profundidad de $n$.

![Árbol de recursión de la secuencia de Fibonacci](iteration_and_recursion.assets/recursion_tree.png)

Fundamentalmente, la recursión encarna el paradigma de "descomponer un problema en subproblemas más pequeños". Esta estrategia de divide y vencerás es crucial.

-   Desde una perspectiva algorítmica, muchas estrategias importantes como la búsqueda, la ordenación, el retroceso, el divide y vencerás y la programación dinámica utilizan directa o indirectamente esta forma de pensar.
-   Desde la perspectiva de la estructura de datos, la recursión es naturalmente adecuada para tratar con listas enlazadas, árboles y grafos, ya que son muy adecuados para el análisis utilizando el enfoque de divide y vencerás.

## Comparación

Resumiendo el contenido anterior, la siguiente tabla muestra las diferencias entre la iteración y la recursión en términos de implementación, rendimiento y aplicabilidad.

<p align="center"> Tabla: Comparación de las características de la iteración y la recursión </p>

|                   | Iteración                                                   | Recursión                                                                                                                        |
| ----------------- | ----------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Enfoque          | Estructura de bucle                                              | La función se llama a sí misma                                                                                                            |
| Eficiencia de tiempo   | Generalmente mayor eficiencia, sin sobrecarga de llamadas a funciones      | Cada llamada a una función genera una sobrecarga                                                                                            |
| Uso de memoria      | Normalmente utiliza un tamaño fijo de espacio de memoria                 | Las llamadas a funciones acumulativas pueden utilizar una cantidad sustancial de espacio de marco de pila                                                    |
| Problemas adecuados | Adecuado para tareas de bucle simples, código intuitivo y legible | Adecuado para la descomposición de problemas, como árboles, grafos, divide y vencerás, retroceso, etc., estructura de código concisa y clara |

!!! tip

    Si encuentra difícil de entender el siguiente contenido, considere volver a visitarlo después de leer el capítulo "Pila".

Entonces, ¿cuál es la conexión intrínseca entre la iteración y la recursión? Tomando como ejemplo la función recursiva anterior, la operación de suma ocurre durante la fase de "retorno" de la recursión. Esto significa que la función llamada inicialmente es la última en completar su operación de suma, **reflejando el principio de "último en entrar, primero en salir" de una pila**.

Los términos recursivos como "pila de llamadas" y "espacio de marco de pila" insinúan la estrecha relación entre la recursión y las pilas.

1.  **Llamada**: Cuando se llama a una función, el sistema asigna un nuevo marco de pila en la "pila de llamadas" para esa función, almacenando variables locales, parámetros, direcciones de retorno y otros datos.
2.  **Retorno**: Cuando una función completa la ejecución y regresa, el marco de pila correspondiente se elimina de la "pila de llamadas", restaurando el entorno de ejecución de la función anterior.

Por lo tanto, **podemos usar una pila explícita para simular el comportamiento de la pila de llamadas**, transformando así la recursión en una forma iterativa:

```src
[file]{recursion}-[class]{}-[func]{for_loop_recur}
```

Al observar el código anterior, cuando la recursión se transforma en iteración, el código se vuelve más complejo. Aunque la iteración y la recursión a menudo se pueden transformar entre sí, no siempre es aconsejable hacerlo por dos razones:

-   El código transformado puede volverse más difícil de entender y menos legible.
-   Para algunos problemas complejos, simular el comportamiento de la pila de llamadas del sistema puede ser todo un desafío.

En conclusión, **la elección entre iteración o recursión depende de la naturaleza específica del problema**. En la práctica de la programación, es crucial sopesar los pros y los contras de ambos y elegir el enfoque más adecuado para la situación en cuestión.

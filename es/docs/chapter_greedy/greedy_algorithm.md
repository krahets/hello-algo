# Algoritmos codiciosos

El <u>algoritmo codicioso</u> es un algoritmo común para resolver problemas de optimización, que fundamentalmente implica tomar la decisión aparentemente mejor en cada etapa de toma de decisiones del problema, es decir, tomar decisiones localmente óptimas de forma codiciosa con la esperanza de encontrar una solución globalmente óptima. Los algoritmos codiciosos son concisos y eficientes, y se utilizan ampliamente en muchos problemas prácticos.

Los algoritmos codiciosos y la programación dinámica se utilizan comúnmente para resolver problemas de optimización. Comparten algunas similitudes, como depender de la propiedad de la subestructura óptima, pero operan de manera diferente.

-   La programación dinámica considera todas las decisiones anteriores en la etapa de decisión actual y utiliza soluciones de subproblemas pasados para construir soluciones para el subproblema actual.
-   Los algoritmos codiciosos no consideran decisiones pasadas; en cambio, proceden con elecciones codiciosas, reduciendo continuamente el alcance del problema hasta que se resuelve.

Primero, entendamos el principio de funcionamiento del algoritmo codicioso a través del ejemplo del "cambio de monedas", que se ha introducido en el capítulo "Problema de la mochila completa". Creo que ya está familiarizado con él.

!!! question

    Dadas $n$ tipos de monedas, donde la denominación del $i$-ésimo tipo de moneda es $coins[i - 1]$, y la cantidad objetivo es $amt$, con cada tipo de moneda disponible indefinidamente, ¿cuál es el número mínimo de monedas necesarias para alcanzar la cantidad objetivo? Si no es posible alcanzar la cantidad objetivo, devuelva $-1$.

La estrategia codiciosa adoptada en este problema se muestra en la figura a continuación. Dada la cantidad objetivo, **elegimos codiciosamente la moneda que está más cerca y no es mayor que ella**, siguiendo repetidamente este paso hasta que se cumpla la cantidad objetivo.

![Estrategia codiciosa para el cambio de monedas](greedy_algorithm.assets/coin_change_greedy_strategy.png)

El código de implementación es el siguiente:

```src
[file]{coin_change_greedy}-[class]{}-[func]{coin_change_greedy}
```

Podría exclamar: ¡Qué limpio! El algoritmo codicioso resuelve el problema del cambio de monedas en unas diez líneas de código.

## Ventajas y limitaciones de los algoritmos codiciosos

**Los algoritmos codiciosos no solo son sencillos y fáciles de implementar, sino que también suelen ser muy eficientes**. En el código anterior, si la denominación de moneda más pequeña es $\min(coins)$, la elección codiciosa se repite como máximo $amt / \min(coins)$ veces, lo que da una complejidad temporal de $O(amt / \min(coins))$. Esto es un orden de magnitud menor que la complejidad temporal de la solución de programación dinámica, que es $O(n \times amt)$.

Sin embargo, **para algunas combinaciones de denominaciones de monedas, los algoritmos codiciosos no pueden encontrar la solución óptima**. La figura a continuación proporciona dos ejemplos.

-   **Ejemplo positivo $coins = [1, 5, 10, 20, 50, 100]$**: En esta combinación de monedas, dada cualquier cantidad, el algoritmo codicioso puede encontrar la solución óptima.
-   **Ejemplo negativo $coins = [1, 20, 50]$**: Supongamos que $amt = 60$, el algoritmo codicioso solo puede encontrar la combinación $50 + 1 \times 10$, totalizando 11 monedas, pero la programación dinámica puede encontrar la solución óptima de $20 + 20 + 20$, necesitando solo 3 monedas.
-   **Ejemplo negativo $coins = [1, 49, 50]$**: Supongamos que $amt = 98$, el algoritmo codicioso solo puede encontrar la combinación $50 + 1 \times 48$, totalizando 49 monedas, pero la programación dinámica puede encontrar la solución óptima de $49 + 49$, necesitando solo 2 monedas.

![Ejemplos donde los algoritmos codiciosos no encuentran la solución óptima](greedy_algorithm.assets/coin_change_greedy_vs_dp.png)

Esto significa que para el problema del cambio de monedas, los algoritmos codiciosos no pueden garantizar encontrar la solución globalmente óptima, y podrían encontrar una solución muy pobre. Son más adecuados para la programación dinámica.

Generalmente, la idoneidad de los algoritmos codiciosos se divide en dos categorías.

1.  **Garantizado para encontrar la solución óptima**: En estos casos, los algoritmos codiciosos suelen ser la mejor opción, ya que tienden a ser más eficientes que el backtracking o la programación dinámica.
2.  **Puede encontrar una solución casi óptima**: Los algoritmos codiciosos también son aplicables aquí. Para muchos problemas complejos, encontrar la solución óptima global es muy desafiante, y poder encontrar una solución subóptima de alta eficiencia también es muy loable.

## Características de los algoritmos codiciosos

Entonces, ¿qué tipo de problemas son adecuados para resolver con algoritmos codiciosos? O más bien, ¿bajo qué condiciones pueden los algoritmos codiciosos garantizar que encontrarán la solución óptima?

En comparación con la programación dinámica, los algoritmos codiciosos tienen condiciones de uso más estrictas, centrándose principalmente en dos propiedades del problema.

-   **Propiedad de elección codiciosa**: Solo cuando la elección localmente óptima siempre puede conducir a una solución globalmente óptima, los algoritmos codiciosos pueden garantizar la obtención de la solución óptima.
-   **Subestructura óptima**: La solución óptima al problema original contiene las soluciones óptimas a sus subproblemas.

La subestructura óptima ya se ha introducido en el capítulo "Programación dinámica", por lo que no se discute más aquí. Es importante tener en cuenta que algunos problemas no tienen una subestructura óptima obvia, pero aún así se pueden resolver utilizando algoritmos codiciosos.

Exploramos principalmente el método para determinar la propiedad de elección codiciosa. Aunque su descripción parece simple, **en la práctica, probar la propiedad de elección codiciosa para muchos problemas no es fácil**.

Por ejemplo, en el problema del cambio de monedas, aunque podemos citar fácilmente contraejemplos para refutar la propiedad de elección codiciosa, probarla es mucho más desafiante. Si se pregunta, **¿qué condiciones debe cumplir una combinación de monedas para poder usar un algoritmo codicioso para encontrar la solución óptima para cualquier cantidad**? A menudo tenemos que confiar en la intuición o en ejemplos para dar una respuesta ambigua, ya que es difícil proporcionar una prueba matemática rigurosa.

!!! quote

    Un artículo presenta un algoritmo con una complejidad temporal de $O(n^3)$ para determinar si una combinación de monedas puede usar un algoritmo codicioso para encontrar la solución óptima para cualquier cantidad.

    Pearson, D. A polynomial-time algorithm for the change-making problem[J]. Operations Research Letters, 2005, 33(3): 231-234.

## Pasos para resolver problemas con algoritmos codiciosos

El proceso de resolución de problemas codiciosos generalmente se puede dividir en los siguientes tres pasos.

1.  **Análisis del problema**: Organizar y comprender las características del problema, incluyendo la definición del estado, los objetivos de optimización y las restricciones, etc. Este paso también está involucrado en el backtracking y la programación dinámica.
2.  **Determinar la estrategia codiciosa**: Determinar cómo tomar una decisión codiciosa en cada paso. Esta estrategia puede reducir la escala del problema en cada paso y finalmente resolver todo el problema.
3.  **Prueba de corrección**: Generalmente es necesario probar que el problema tiene tanto una propiedad de elección codiciosa como una subestructura óptima. Este paso puede requerir pruebas matemáticas, como inducción o reducción al absurdo.

Determinar la estrategia codiciosa es el paso central para resolver el problema, pero puede que no sea fácil de implementar, principalmente por las siguientes razones.

-   **Las estrategias codiciosas varían mucho entre diferentes problemas**. Para muchos problemas, la estrategia codiciosa es bastante sencilla, y podemos idearla a través de un pensamiento y intentos generales. Sin embargo, para algunos problemas complejos, la estrategia codiciosa puede ser muy elusiva, lo que es una verdadera prueba de la experiencia individual en la resolución de problemas y la capacidad algorítmica.
-   **Algunas estrategias codiciosas son bastante engañosas**. Cuando diseñamos con confianza una estrategia codiciosa, escribimos el código y lo enviamos a prueba, es muy posible que algunos casos de prueba no pasen. Esto se debe a que la estrategia codiciosa diseñada es solo "parcialmente correcta", como se describió anteriormente con el ejemplo del cambio de monedas.

Para garantizar la precisión, debemos proporcionar pruebas matemáticas rigurosas para la estrategia codiciosa, **generalmente involucrando reducción al absurdo o inducción matemática**.

Sin embargo, probar la corrección puede no ser una tarea fácil. Si estamos perdidos, generalmente optamos por depurar el código basándonos en casos de prueba, modificando y verificando la estrategia codiciosa paso a paso.

## Problemas típicos resueltos por algoritmos codiciosos

Los algoritmos codiciosos se aplican a menudo a problemas de optimización que satisfacen las propiedades de elección codiciosa y subestructura óptima. A continuación se presentan algunos problemas típicos de algoritmos codiciosos.

-   **Problema del cambio de monedas**: En algunas combinaciones de monedas, el algoritmo codicioso siempre proporciona la solución óptima.
-   **Problema de programación de intervalos**: Suponga que tiene varias tareas, cada una de las cuales tiene lugar durante un período de tiempo. Su objetivo es completar tantas tareas como sea posible. Si siempre elige la tarea que termina antes, entonces el algoritmo codicioso puede lograr la solución óptima.
-   **Problema de la mochila fraccionaria**: Dado un conjunto de artículos y una capacidad de carga, su objetivo es seleccionar un conjunto de artículos de tal manera que el peso total no exceda la capacidad de carga y el valor total se maximice. Si siempre elige el artículo con la mayor relación valor-peso (valor / peso), el algoritmo codicioso puede lograr la solución óptima en algunos casos.
-   **Problema de comercio de acciones**: Dado un conjunto de precios históricos de acciones, puede realizar múltiples operaciones, pero no puede volver a comprar hasta después de haber vendido si ya posee acciones. El objetivo es lograr el máximo beneficio.
-   **Codificación de Huffman**: La codificación de Huffman es un algoritmo codicioso utilizado para la compresión de datos sin pérdidas. Al construir un árbol de Huffman, siempre fusiona los dos nodos con la frecuencia más baja, lo que da como resultado un árbol de Huffman con la longitud de ruta ponderada mínima (longitud de codificación).
-   **Algoritmo de Dijkstra**: Es un algoritmo codicioso para resolver el problema del camino más corto desde un vértice fuente dado a todos los demás vértices.

```
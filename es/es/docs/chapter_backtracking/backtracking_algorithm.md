# Algoritmos de backtracking

El <u>algoritmo de backtracking</u> es un método para resolver problemas mediante la búsqueda exhaustiva. Su concepto central es partir de un estado inicial y buscar brutalmente todas las soluciones posibles. El algoritmo registra las correctas hasta que se encuentra una solución o se han probado todas las soluciones posibles pero no se encuentra ninguna.

El backtracking suele emplear la "búsqueda en profundidad" para recorrer el espacio de soluciones. En el capítulo "Árbol binario", mencionamos que los recorridos en preorden, inorden y postorden son todas búsquedas en profundidad. A continuación, utilizaremos el recorrido en preorden para resolver un problema de backtracking. Esto nos ayuda a comprender cómo funciona el algoritmo gradualmente.

!!! question "Ejemplo uno"

    Dado un árbol binario, busque y registre todos los nodos con un valor de $7$ y devuélvalos en una lista.

Para resolver este problema, recorremos este árbol en preorden y verificamos si el valor del nodo actual es $7$. Si lo es, agregamos el valor del nodo a la lista de resultados `res`. El proceso se muestra en la figura a continuación:

```src
[file]{preorder_traversal_i_compact}-[class]{}-[func]{pre_order}
```

![Búsqueda de nodos en recorrido en preorden](backtracking_algorithm.assets/preorder_find_nodes.png)

## Prueba y retroceso

**Se llama algoritmo de backtracking porque utiliza una estrategia de "prueba" y "retroceso" al buscar en el espacio de soluciones**. Durante la búsqueda, cada vez que encuentra un estado en el que ya no puede avanzar para obtener una solución satisfactoria, deshace la elección anterior y vuelve al estado anterior para que se puedan elegir otras opciones posibles para el siguiente intento.

En el Ejemplo Uno, visitar cada nodo inicia una "prueba". Y pasar un nodo hoja o la instrucción `return` para volver al nodo padre sugiere "retroceso".

Vale la pena señalar que **el retroceso no se trata simplemente de retornos de funciones**. Ampliaremos ligeramente la pregunta del Ejemplo Uno para explicar lo que significa.

!!! question "Ejemplo dos"

    En un árbol binario, busque todos los nodos con un valor de $7$ y, para todos los nodos coincidentes, **devuelva las rutas desde el nodo raíz hasta ese nodo**.

Basándonos en el código del Ejemplo Uno, necesitamos usar una lista llamada `path` para registrar las rutas de los nodos visitados. Cuando se alcanza un nodo con un valor de $7$, copiamos `path` y lo agregamos a la lista de resultados `res`. Después del recorrido, `res` contiene todas las soluciones. El código es el siguiente:

```src
[file]{preorder_traversal_ii_compact}-[class]{}-[func]{pre_order}
```

En cada "prueba", registramos la ruta agregando el nodo actual a `path`. Cada vez que necesitamos "retroceder", sacamos el nodo de `path` **para restaurar el estado anterior a este intento fallido**.

Al observar el proceso que se muestra en la figura a continuación, **la prueba es como "avanzar", y el retroceso es como "deshacer"**. Los pares posteriores pueden verse como una operación inversa a su contraparte.

=== "<1>"
    ![Probando y retrocediendo](backtracking_algorithm.assets/preorder_find_paths_step1.png)

=== "<2>"
    ![preorder_find_paths_step2](backtracking_algorithm.assets/preorder_find_paths_step2.png)

=== "<3>"
    ![preorder_find_paths_step3](backtracking_algorithm.assets/preorder_find_paths_step3.png)

=== "<4>"
    ![preorder_find_paths_step4](backtracking_algorithm.assets/preorder_find_paths_step4.png)

=== "<5>"
    ![preorder_find_paths_step5](backtracking_algorithm.assets/preorder_find_paths_step5.png)

=== "<6>"
    ![preorder_find_paths_step6](backtracking_algorithm.assets/preorder_find_paths_step6.png)

=== "<7>"
    ![preorder_find_paths_step7](backtracking_algorithm.assets/preorder_find_paths_step7.png)

=== "<8>"
    ![preorder_find_paths_step8](backtracking_algorithm.assets/preorder_find_paths_step8.png)

=== "<9>"
    ![preorder_find_paths_step9](backtracking_algorithm.assets/preorder_find_paths_step9.png)

=== "<10>"
    ![preorder_find_paths_step10](backtracking_algorithm.assets/preorder_find_paths_step10.png)

=== "<11>"
    ![preorder_find_paths_step11](backtracking_algorithm.assets/preorder_find_paths_step11.png)

## Poda

Los problemas complejos de backtracking suelen implicar una o más restricciones, **que a menudo se utilizan para la "poda"**.

!!! question "Ejemplo tres"

    En un árbol binario, busque todos los nodos con un valor de $7$ y devuelva las rutas desde la raíz hasta estos nodos, **con la restricción de que las rutas no contengan nodos con un valor de $3$**.

Para cumplir con las restricciones anteriores, **necesitamos agregar una operación de poda**: durante el proceso de búsqueda, si se encuentra un nodo con un valor de $3$, se aborta inmediatamente la búsqueda posterior a través de la ruta. El código es el siguiente:

```src
[file]{preorder_traversal_iii_compact}-[class]{}-[func]{pre_order}
```

"Poda" es un sustantivo muy vívido. Como se muestra en la figura a continuación, en el proceso de búsqueda, **"cortamos" las ramas de búsqueda que no cumplen con las restricciones**. Evita intentos innecesarios adicionales, lo que mejora la eficiencia de la búsqueda.

![Poda basada en restricciones](backtracking_algorithm.assets/preorder_find_constrained_paths.png)

## Código de marco

Ahora, intentemos destilar el marco principal de "prueba, retroceso y poda" del backtracking para mejorar la universalidad del código.

En el siguiente código de marco, `state` representa el estado actual del problema, `choices` representa las opciones disponibles bajo el estado actual:

=== "Python"

    ```python title=""
    def backtrack(state: State, choices: list[choice], res: list[state]):
        """Marco del algoritmo de backtracking"""
        # Comprobar si es una solución
        if is_solution(state):
            # Registrar la solución
            record_solution(state, res)
            # Detener la búsqueda
            return
        # Iterar a través de todas las opciones
        for choice in choices:
            # Podar: comprobar si la opción es válida
            if is_valid(state, choice):
                # Prueba: hacer una elección, actualizar el estado
                make_choice(state, choice)
                backtrack(state, choices, res)
                # Retroceder: deshacer la elección, volver al estado anterior
                undo_choice(state, choice)
    ```

Ahora, podemos resolver el Ejemplo Tres usando el código del marco. El `state` es la ruta de recorrido del nodo, `choices` son los hijos izquierdo y derecho del nodo actual, y el resultado `res` es la lista de rutas:

```src
[file]{preorder_traversal_iii_template}-[class]{}-[func]{backtrack}
```

Según los requisitos, después de encontrar un nodo con un valor de $7$, la búsqueda debe continuar. **Como resultado, la instrucción `return` después de registrar la solución debe eliminarse**. La figura a continuación compara los procesos de búsqueda con y sin retener la instrucción `return`.

![Comparación de retener y eliminar el retorno en el proceso de búsqueda](backtracking_algorithm.assets/backtrack_remove_return_or_not.png)

En comparación con la implementación basada en el recorrido en preorden, el código que utiliza el marco del algoritmo de backtracking parece prolijo. Sin embargo, tiene una mejor universalidad. De hecho, **muchos problemas de backtracking se pueden resolver dentro de este marco**. Solo necesitamos definir `state` y `choices` de acuerdo con el problema específico e implementar los métodos en el marco.

## Terminología común

Para analizar los problemas algorítmicos con mayor claridad, resumimos los significados de la terminología comúnmente utilizada en los algoritmos de backtracking y proporcionamos ejemplos correspondientes del Ejemplo Tres, como se muestra en la tabla a continuación.

<p align="center"> Tabla <id> &nbsp; Terminología común del algoritmo de backtracking </p>

| Término                        | Definición                                                                                                                                                          | Ejemplo tres                                                                                                                    |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| Solución         | Una solución es una respuesta que satisface condiciones específicas del problema, que puede tener una o más                                                               | Todas las rutas desde el nodo raíz hasta el nodo $7$ que cumplen la restricción                                                                |
| Restricción     | Las restricciones son condiciones en el problema que limitan la viabilidad de las soluciones, a menudo utilizadas para la poda                                                           | Las rutas no contienen el nodo $3$                                                                                                    |
| Estado               | El estado representa la situación del problema en un momento determinado, incluidas las elecciones realizadas                                                                           | Ruta del nodo visitado actual, es decir, lista de nodos `path`                                                                                |
| Prueba           | Una prueba es el proceso de explorar el espacio de soluciones basándose en las opciones disponibles, incluyendo la toma de decisiones, la actualización del estado y la verificación de si es una solución | Visitar recursivamente los nodos hijos izquierdo (derecho), agregar nodos a `path`, verificar si el valor del nodo es $7$                       |
| Retroceso | El retroceso se refiere a la acción de deshacer las elecciones anteriores y volver al estado anterior cuando se encuentran estados que no cumplen las restricciones         | Al pasar nodos hoja, finalizar las visitas a nodos, encontrar nodos con un valor de $3$, terminar la búsqueda y la función de recursión regresa |
| Poda           | La poda es un método para evitar rutas de búsqueda sin sentido basándose en las características y restricciones del problema, lo que puede mejorar la eficiencia de la búsqueda              | Cuando se encuentra un nodo con un valor de $3$, no se requiere más búsqueda                                                     |

!!! tip

    Conceptos como problemas, soluciones, estados, etc., son universales y están involucrados en algoritmos de divide y vencerás, backtracking, programación dinámica y algoritmos codiciosos, entre otros.

## Ventajas y limitaciones

El algoritmo de backtracking es esencialmente un algoritmo de búsqueda en profundidad que intenta todas las soluciones posibles hasta que se encuentra una solución satisfactoria. La ventaja de este método es que puede encontrar todas las soluciones posibles, y con operaciones de poda razonables, puede ser altamente eficiente.

Sin embargo, cuando se trata de problemas a gran escala o complejos, **la eficiencia de ejecución del algoritmo de backtracking puede no ser aceptable**.

-   **Complejidad temporal**: Los algoritmos de backtracking suelen necesitar recorrer todos los estados posibles en el espacio de estados, lo que puede alcanzar una complejidad temporal exponencial o factorial.
-   **Complejidad espacial**: En las llamadas recursivas, es necesario guardar el estado actual (como rutas, variables auxiliares para la poda, etc.). Cuando la profundidad es muy grande, la necesidad de espacio puede aumentar significativamente.

Aun así, **el backtracking sigue siendo la mejor solución para ciertos problemas de búsqueda y problemas de satisfacción de restricciones**. Para estos problemas, no hay forma de predecir qué opciones pueden generar soluciones válidas. Tenemos que recorrer todas las opciones posibles. En este caso, **la clave es cómo optimizar la eficiencia**. Hay dos métodos comunes de optimización de la eficiencia.

-   **Poda**: Evitar buscar rutas que definitivamente no producirán una solución, ahorrando así tiempo y espacio.
-   **Búsqueda heurística**: Introducir algunas estrategias o estimaciones durante el proceso de búsqueda para priorizar las rutas que tienen más probabilidades de producir soluciones válidas.

## Problemas típicos de backtracking

Los algoritmos de backtracking se pueden utilizar para resolver muchos problemas de búsqueda, problemas de satisfacción de restricciones y problemas de optimización combinatoria.

**Problemas de búsqueda**: El objetivo de estos problemas es encontrar soluciones que cumplan condiciones específicas.

-   Problema de permutación completa: Dado un conjunto, encuentre todas las permutaciones y combinaciones posibles del mismo.
-   Problema de la suma de subconjuntos: Dado un conjunto y una suma objetivo, encuentre todos los subconjuntos del conjunto que sumen el objetivo.
-   Problema de las Torres de Hanói: Dadas tres varillas y una serie de discos de diferentes tamaños, el objetivo es mover todos los discos de una varilla a otra, moviendo solo un disco a la vez y nunca colocando un disco más grande sobre uno más pequeño.

**Problemas de satisfacción de restricciones**: El objetivo de estos problemas es encontrar soluciones que satisfagan todas las restricciones.

-   $n$ reinas: Coloque $n$ reinas en un tablero de ajedrez de $n \times n$ para que no se ataquen entre sí.
-   Sudoku: Rellene una cuadrícula de $9 \times 9$ con los números del $1$ al $9$, asegurándose de que los números no se repitan en cada fila, cada columna y cada subcuadrícula de $3 \times 3$.
-   Problema de coloración de grafos: Dado un grafo no dirigido, coloree cada vértice con la menor cantidad posible de colores para que los vértices adyacentes tengan colores diferentes.

**Problemas de optimización combinatoria**: El objetivo de estos problemas es encontrar la solución óptima dentro de un espacio de combinación que cumpla ciertas condiciones.

-   Problema de la mochila 0-1: Dado un conjunto de elementos y una mochila, cada elemento tiene un cierto valor y peso. El objetivo es elegir elementos para maximizar el valor total dentro del límite de capacidad de la mochila.
-   Problema del viajante de comercio: En un grafo, partiendo de un punto, visite todos los demás puntos exactamente una vez y luego regrese al punto de partida, buscando la ruta más corta.
-   Problema del clique máximo: Dado un grafo no dirigido, encuentre el subgrafo completo más grande, es decir, un subgrafo donde dos vértices cualesquiera estén conectados por una arista.

Tenga en cuenta que para muchos problemas de optimización combinatoria, el backtracking no es la solución óptima.

-   El problema de la mochila 0-1 generalmente se resuelve utilizando programación dinámica para lograr una mayor eficiencia temporal.
-   El problema del viajante de comercio es un problema NP-Hard bien conocido, comúnmente resuelto utilizando algoritmos genéticos y algoritmos de colonia de hormigas, entre otros.
-   El problema del clique máximo es un problema clásico en la teoría de grafos, que se puede resolver utilizando algoritmos codiciosos y otros métodos heurísticos.

# Resumen

### Revisión clave

- La esencia del algoritmo de backtracking es la búsqueda exhaustiva. Busca soluciones que cumplan las condiciones realizando un recorrido en profundidad del espacio de soluciones. Durante la búsqueda, si se encuentra una solución satisfactoria, se registra, hasta que se encuentran todas las soluciones o se completa el recorrido.
- El proceso de búsqueda del algoritmo de backtracking incluye la prueba y el retroceso. Utiliza la búsqueda en profundidad para explorar varias opciones, y cuando una opción no cumple las restricciones, se deshace la elección anterior. Luego, vuelve al estado anterior y continúa probando otras opciones. La prueba y el retroceso son operaciones en direcciones opuestas.
- Los problemas de backtracking suelen contener múltiples restricciones. Estas restricciones se pueden utilizar para realizar operaciones de poda. La poda puede terminar ramas de búsqueda innecesarias de antemano, mejorando en gran medida la eficiencia de la búsqueda.
- El algoritmo de backtracking se utiliza principalmente para resolver problemas de búsqueda y problemas de satisfacción de restricciones. Aunque los problemas de optimización combinatoria se pueden resolver utilizando backtracking, a menudo hay soluciones más eficientes o efectivas disponibles.
- El problema de la permutación tiene como objetivo buscar todas las permutaciones posibles de los elementos en un conjunto dado. Utilizamos un arreglo para registrar si cada elemento ha sido elegido, evitando la selección repetida del mismo elemento. Esto asegura que cada elemento se elija solo una vez.
- En los problemas de permutación, si el conjunto contiene elementos duplicados, el resultado final incluirá permutaciones duplicadas. Necesitamos restringir que los elementos idénticos solo se puedan seleccionar una vez en cada ronda, lo que generalmente se implementa utilizando un conjunto hash.
- El problema de la suma de subconjuntos tiene como objetivo encontrar todos los subconjuntos en un conjunto dado que sumen un valor objetivo. El conjunto no distingue el orden de los elementos, pero el proceso de búsqueda puede generar subconjuntos duplicados. Esto ocurre porque el algoritmo explora diferentes órdenes de elementos como rutas únicas. Antes de retroceder, ordenamos los datos y establecemos una variable para indicar el punto de partida del recorrido para cada ronda. Esto nos permite podar las ramas de búsqueda que generan subconjuntos duplicados.
- Para el problema de la suma de subconjuntos, los elementos iguales en el arreglo pueden producir conjuntos duplicados. Usando la precondición de que el arreglo ya está ordenado, podamos determinando si los elementos adyacentes son iguales. Esto asegura que los elementos iguales solo se seleccionen una vez por ronda.
- El problema de las $n$ reinas tiene como objetivo encontrar esquemas para colocar $n$ reinas en un tablero de ajedrez de $n \times n$ de tal manera que no dos reinas puedan atacarse entre sí. Las restricciones del problema incluyen restricciones de fila, restricciones de columna y restricciones en las diagonales principales y secundarias. Para cumplir la restricción de fila, adoptamos una estrategia de colocar una reina por fila, asegurando que cada fila tenga una reina colocada.
- El manejo de las restricciones de columna y diagonales es similar. Para las restricciones de columna, usamos un arreglo para registrar si hay una reina en cada columna, indicando así si la celda seleccionada es legal. Para las restricciones de diagonales, usamos dos arreglos para registrar respectivamente la presencia de reinas en las diagonales principales y secundarias. El desafío es determinar la relación entre los índices de fila y columna para las celdas en la misma diagonal principal o secundaria.

### Preguntas y respuestas

**P**: ¿Cómo podemos entender la relación entre el backtracking y la recursión?

En general, el backtracking es una "estrategia algorítmica", mientras que la recursión es más una "herramienta".

- Los algoritmos de backtracking suelen basarse en la recursión. Sin embargo, el backtracking es uno de los escenarios de aplicación de la recursión, específicamente en problemas de búsqueda.
- La estructura de la recursión refleja el paradigma de resolución de problemas de "descomposición de subproblemas". Se usa comúnmente para resolver problemas que involucran divide y vencerás, backtracking y programación dinámica (recursión memorizada).

```
# Problema de las n-reinas

!!! question

    Según las reglas del ajedrez, una reina puede atacar piezas en la misma fila, columna o línea diagonal. Dadas $n$ reinas y un tablero de ajedrez de $n \times n$, encuentre las disposiciones en las que no dos reinas puedan atacarse entre sí.

Como se muestra en la figura a continuación, hay dos soluciones cuando $n = 4$. Desde la perspectiva del algoritmo de backtracking, un tablero de ajedrez de $n \times n$ tiene $n^2$ casillas, presentando todas las posibles `choices`. El estado del tablero de ajedrez `state` cambia continuamente a medida que se coloca cada reina.

![Solución al problema de las 4 reinas](n_queens_problem.assets/solution_4_queens.png)

La figura a continuación muestra las tres restricciones de este problema: **múltiples reinas no pueden ocupar la misma fila, columna o diagonal**. Es importante tener en cuenta que las diagonales se dividen en la diagonal principal `\` y la diagonal secundaria `/`.

![Restricciones del problema de las n-reinas](n_queens_problem.assets/n_queens_constraints.png)

### Estrategia de colocación fila por fila

Como el número de reinas es igual al número de filas en el tablero de ajedrez, siendo ambos $n$, es fácil concluir que **cada fila del tablero de ajedrez permite y solo permite que se coloque una reina**.

Esto significa que podemos adoptar una estrategia de colocación fila por fila: comenzando desde la primera fila, coloque una reina por fila hasta que se alcance la última fila.

La figura a continuación muestra el proceso de colocación fila por fila para el problema de las 4 reinas. Debido a las limitaciones de espacio, la figura solo expande una rama de búsqueda de la primera fila y poda cualquier colocación que no cumpla con las restricciones de columna y diagonal.

![Estrategia de colocación fila por fila](n_queens_problem.assets/n_queens_placing.png)

Esencialmente, **la estrategia de colocación fila por fila sirve como una función de poda**, eliminando todas las ramas de búsqueda que colocarían varias reinas en la misma fila.

### Poda de columna y diagonal

Para satisfacer las restricciones de columna, podemos usar un arreglo booleano `cols` de longitud $n$ para rastrear si una reina ocupa cada columna. Antes de cada decisión de colocación, `cols` se usa para podar las columnas que ya tienen reinas, y se actualiza dinámicamente durante el backtracking.

!!! tip

    Tenga en cuenta que el origen de la matriz se encuentra en la esquina superior izquierda, donde el índice de fila aumenta de arriba a abajo y el índice de columna aumenta de izquierda a derecha.

¿Qué pasa con las restricciones diagonales? Sean los índices de fila y columna de una celda determinada en el tablero de ajedrez $(row, col)$. Al seleccionar una diagonal principal específica, notamos que la diferencia $row - col$ es la misma para todas las celdas de esa diagonal, **lo que significa que $row - col$ es un valor constante en la diagonal principal**.

En otras palabras, si dos celdas satisfacen $row_1 - col_1 = row_2 - col_2$, definitivamente están en la misma diagonal principal. Usando este patrón, podemos utilizar el arreglo `diags1` que se muestra en la figura a continuación para rastrear si una reina está en alguna diagonal principal.

De manera similar, **la suma de $row + col$ es un valor constante para todas las celdas de la diagonal secundaria**. También podemos usar el arreglo `diags2` para manejar las restricciones de la diagonal secundaria.

![Manejo de restricciones de columna y diagonal](n_queens_problem.assets/n_queens_cols_diagonals.png)

### Implementación del código

Tenga en cuenta que, en una matriz cuadrada de $n$ dimensiones, el rango de $row - col$ es $[-n + 1, n - 1]$, y el rango de $row + col$ es $[0, 2n - 2]$. En consecuencia, el número de diagonales principales y secundarias es $2n - 1$, lo que significa que la longitud de los arreglos `diags1` y `diags2` es $2n - 1$.

```src
[file]{n_queens}-[class]{}-[func]{n_queens}
```

Colocando $n$ reinas fila por fila, considerando las restricciones de columna, desde la primera fila hasta la última fila, hay $n$, $n-1$, $\dots$, $2$, $1$ opciones, utilizando tiempo $O(n!)$. Al registrar una solución, es necesario copiar la matriz `state` y agregarla a `res`, con la operación de copia utilizando tiempo $O(n^2)$. Por lo tanto, **la complejidad temporal general es $O(n! \cdot n^2)$**. En la práctica, la poda basada en restricciones diagonales puede reducir significativamente el espacio de búsqueda, por lo que a menudo la eficiencia de búsqueda es mejor que la complejidad temporal mencionada.

El arreglo `state` utiliza espacio $O(n^2)$, y los arreglos `cols`, `diags1` y `diags2` utilizan cada uno espacio $O(n)$. La profundidad máxima de recursión es $n$, utilizando espacio de marco de pila $O(n)$. Por lo tanto, **la complejidad espacial es $O(n^2)$**.


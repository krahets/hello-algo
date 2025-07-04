# Algoritmos de ordenamiento

Los <u>algoritmos de ordenamiento</u> se utilizan para organizar un conjunto de datos en un orden específico. Los algoritmos de ordenamiento tienen una amplia gama de aplicaciones porque los datos ordenados generalmente se pueden buscar, analizar y procesar de manera más eficiente.

Como se muestra en la figura a continuación, los tipos de datos en los algoritmos de ordenamiento pueden ser enteros, números de punto flotante, caracteres o cadenas, etc. El criterio de ordenamiento se puede establecer según las necesidades, como el tamaño numérico, el orden ASCII de los caracteres o un criterio personalizado.

![Tipos de datos y ejemplos de comparadores](sorting_algorithm.assets/sorting_examples.png)

## Dimensiones de evaluación

**Eficiencia de ejecución**: Esperamos que la complejidad temporal de los algoritmos de ordenamiento sea lo más baja posible, así como un menor número de operaciones generales (reduciendo el término constante de la complejidad temporal). Para grandes volúmenes de datos, la eficiencia de ejecución es particularmente importante.

**Propiedad in situ**: Como su nombre lo indica, el <u>ordenamiento in situ</u> se logra manipulando directamente el arreglo original, sin necesidad de arreglos auxiliares adicionales, lo que ahorra memoria. Generalmente, el ordenamiento in situ implica menos operaciones de movimiento de datos y es más rápido.

**Estabilidad**: El <u>ordenamiento estable</u> asegura que el orden relativo de los elementos iguales en el arreglo no cambie después del ordenamiento.

El ordenamiento estable es una condición necesaria para escenarios de ordenamiento de múltiples claves. Supongamos que tenemos una tabla que almacena información de estudiantes, con la primera y segunda columna siendo el nombre y la edad, respectivamente. En este caso, el <u>ordenamiento inestable</u> podría conducir a una pérdida de orden en los datos de entrada:

```shell
# Los datos de entrada están ordenados por nombre
# (nombre, edad)
  ('A', 19)
  ('B', 18)
  ('C', 21)
  ('D', 19)
  ('E', 23)

# Suponiendo que se utiliza un algoritmo de ordenamiento inestable para ordenar la lista por edad,
# el resultado cambia la posición relativa de ('D', 19) y ('A', 19),
# y se pierde la propiedad de que los datos de entrada estén ordenados por nombre
  ('B', 18)
  ('D', 19)
  ('A', 19)
  ('C', 21)
  ('E', 23)
```

**Adaptabilidad**: El <u>ordenamiento adaptativo</u> aprovecha la información de orden existente dentro de los datos de entrada para reducir el esfuerzo computacional, logrando una eficiencia temporal más óptima. La complejidad temporal en el mejor de los casos de los algoritmos de ordenamiento adaptativo suele ser mejor que su complejidad temporal promedio.

**Basado en comparación o no basado en comparación**: El <u>ordenamiento basado en comparación</u> se basa en operadores de comparación ($<$, $=$, $>$) para determinar el orden relativo de los elementos y así ordenar todo el arreglo, siendo la complejidad temporal óptima teórica $O(n \log n)$. Mientras tanto, el <u>ordenamiento sin comparación</u> no utiliza operadores de comparación y puede lograr una complejidad temporal de $O(n)$, pero su versatilidad es relativamente pobre.

## Algoritmo de ordenamiento ideal

**Ejecución rápida, in situ, estable, adaptativo y versátil**. Claramente, hasta la fecha no se ha encontrado ningún algoritmo de ordenamiento que combine todas estas características. Por lo tanto, al seleccionar un algoritmo de ordenamiento, es necesario decidir en función de las características específicas de los datos y los requisitos del problema.

A continuación, aprenderemos sobre varios algoritmos de ordenamiento juntos y analizaremos las ventajas y desventajas de cada uno basándonos en las dimensiones de evaluación anteriores.

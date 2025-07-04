# Algoritmos de búsqueda revisados

Los <u>algoritmos de búsqueda</u> se utilizan para recuperar uno o más elementos que cumplen criterios específicos dentro de estructuras de datos como arreglos, listas enlazadas, árboles o grafos.

Los algoritmos de búsqueda se pueden dividir en las siguientes dos categorías según su enfoque.

-   **Localizar el elemento objetivo recorriendo la estructura de datos**, como recorridos de arreglos, listas enlazadas, árboles y grafos, etc.
-   **Utilizar la estructura organizativa de los datos o los datos existentes para lograr búsquedas eficientes de elementos**, como la búsqueda binaria, la búsqueda hash, la búsqueda en árboles de búsqueda binaria, etc.

Estos temas se introdujeron en capítulos anteriores, por lo que no nos son desconocidos. En esta sección, revisaremos los algoritmos de búsqueda desde una perspectiva más sistemática.

## Búsqueda por fuerza bruta

Una búsqueda por fuerza bruta localiza el elemento objetivo recorriendo cada elemento de la estructura de datos.

-   La "búsqueda lineal" es adecuada para estructuras de datos lineales como arreglos y listas enlazadas. Comienza desde un extremo de la estructura de datos y accede a cada elemento uno por uno hasta que se encuentra el elemento objetivo o se llega al otro extremo sin encontrar el elemento objetivo.
-   La "búsqueda en amplitud" y la "búsqueda en profundidad" son dos estrategias de recorrido para grafos y árboles. La búsqueda en amplitud comienza desde el nodo inicial y busca capa por capa (de izquierda a derecha), accediendo a los nodos de cerca a lejos. La búsqueda en profundidad comienza desde el nodo inicial, sigue un camino hasta el final (de arriba a abajo), luego retrocede e intenta otros caminos hasta que se recorre toda la estructura de datos.

La ventaja de la búsqueda por fuerza bruta es su simplicidad y versatilidad, **no necesita preprocesamiento de datos ni la ayuda de estructuras de datos adicionales**.

Sin embargo, **la complejidad temporal de este tipo de algoritmo es $O(n)$**, donde $n$ es el número de elementos, por lo que el rendimiento es deficiente con grandes conjuntos de datos.

## Búsqueda adaptativa

Una búsqueda adaptativa utiliza las propiedades únicas de los datos (como el orden) para optimizar el proceso de búsqueda, localizando así el elemento objetivo de manera más eficiente.

-   La "búsqueda binaria" utiliza la ordenación de los datos para lograr una búsqueda eficiente, solo adecuada para arreglos.
-   La "búsqueda hash" utiliza una tabla hash para establecer un mapeo clave-valor entre los datos de búsqueda y los datos objetivo, implementando así la operación de consulta.
-   La "búsqueda en árbol" en una estructura de árbol específica (como un árbol de búsqueda binaria), elimina rápidamente nodos basándose en comparaciones de valores de nodos, localizando así el elemento objetivo.

La ventaja de estos algoritmos es su alta eficiencia, **con complejidades temporales que alcanzan $O(\log n)$ o incluso $O(1)$**.

Sin embargo, **el uso de estos algoritmos a menudo requiere preprocesamiento de datos**. Por ejemplo, la búsqueda binaria requiere ordenar el arreglo de antemano, y la búsqueda hash y la búsqueda en árbol requieren la ayuda de estructuras de datos adicionales. Mantener estas estructuras también requiere más sobrecarga en términos de tiempo y espacio.

!!! tip

    Los algoritmos de búsqueda adaptativa a menudo se denominan algoritmos de búsqueda, **utilizados principalmente para recuperar rápidamente elementos objetivo en estructuras de datos específicas**.

## Elección de un método de búsqueda

Dado un conjunto de datos de tamaño $n$, podemos usar una búsqueda lineal, búsqueda binaria, búsqueda en árbol, búsqueda hash u otros métodos para recuperar el elemento objetivo. Los principios de funcionamiento de estos métodos se muestran en la figura a continuación.

![Varias estrategias de búsqueda](searching_algorithm_revisited.assets/searching_algorithms.png)

Las características y la eficiencia operativa de los métodos mencionados anteriormente se muestran en la siguiente tabla.

<p align="center"> Tabla <id> &nbsp; Comparación de la eficiencia de los algoritmos de búsqueda </p>

|                    | Búsqueda lineal | Búsqueda binaria         | Búsqueda en árbol                 | Búsqueda hash                |
| ------------------ | ------------- | --------------------- | --------------------------- | -------------------------- |
| Buscar elemento     | $O(n)$        | $O(\log n)$           | $O(\log n)$                 | $O(1)$                     |
| Insertar elemento     | $O(1)$        | $O(n)$                | $O(\log n)$                 | $O(1)$                     |
| Eliminar elemento | $O(n)$        | $O(n)$                | $O(\log n)$                 | $O(1)$                     |
| Espacio extra        | $O(1)$        | $O(1)$                | $O(n)$                      | $O(n)$                     |
| Preprocesamiento de datos | /             | Ordenamiento $O(n \log n)$ | Construcción de árbol $O(n \log n)$ | Construcción de tabla hash $O(n)$ |
| Orden de los datos   | Desordenado     | Ordenado               | Ordenado                     | Desordenado                  |

La elección del algoritmo de búsqueda también depende del volumen de datos, los requisitos de rendimiento de la búsqueda, la frecuencia de las consultas y actualizaciones de datos, etc.

**Búsqueda lineal**

-   Buena versatilidad, sin necesidad de operaciones de preprocesamiento de datos. Si solo necesitamos consultar los datos una vez, el tiempo de preprocesamiento de datos en los otros tres métodos sería más largo que el tiempo de una búsqueda lineal.
-   Adecuado para pequeños volúmenes de datos, donde la complejidad temporal tiene un impacto menor en la eficiencia.
-   Adecuado para escenarios con actualizaciones de datos muy frecuentes, porque este método no requiere ningún mantenimiento adicional de los datos.

**Búsqueda binaria**

-   Adecuado para volúmenes de datos más grandes, con un rendimiento estable y una complejidad temporal en el peor de los casos de $O(\log n)$.
-   Sin embargo, el volumen de datos no puede ser demasiado grande, porque el almacenamiento de arreglos requiere un espacio de memoria contiguo.
-   No adecuado para escenarios con adiciones y eliminaciones frecuentes, porque mantener un arreglo ordenado incurre en mucha sobrecarga.

**Búsqueda hash**

-   Adecuado para escenarios donde el rendimiento de consulta rápida es esencial, con una complejidad temporal promedio de $O(1)$.
-   No adecuado para escenarios que necesitan datos ordenados o búsquedas de rango, porque las tablas hash no pueden mantener el orden de los datos.
-   Alta dependencia de las funciones hash y las estrategias de manejo de colisiones hash, con riesgos significativos de degradación del rendimiento.
-   No adecuado para volúmenes de datos excesivamente grandes, porque las tablas hash necesitan espacio extra para minimizar las colisiones y proporcionar un buen rendimiento de consulta.

**Búsqueda en árbol**

-   Adecuado para datos masivos, porque los nodos del árbol se almacenan dispersos en la memoria.
-   Adecuado para mantener datos ordenados o búsquedas de rango.
-   Con la adición y eliminación continua de nodos, el árbol de búsqueda binaria puede sesgarse, degradando la complejidad temporal a $O(n)$.
-   Si se utilizan árboles AVL o árboles rojo-negro, las operaciones pueden ejecutarse de forma estable con una eficiencia de $O(\log n)$, pero la operación para mantener el equilibrio del árbol añade una sobrecarga adicional.

# Resumen

### Revisión clave

- Un árbol binario es una estructura de datos no lineal que refleja la lógica de "divide y vencerás" de dividir uno en dos. Cada nodo de árbol binario contiene un valor y dos punteros, que apuntan a sus nodos hijos izquierdo y derecho, respectivamente.
- Para un nodo en un árbol binario, su nodo hijo izquierdo (derecho) y el árbol formado debajo de él se denominan colectivamente el subárbol izquierdo (derecho) del nodo.
- Los términos relacionados con los árboles binarios incluyen nodo raíz, nodo hoja, nivel, grado, arista, altura y profundidad.
- Las operaciones de inicialización de un árbol binario, inserción de nodos y eliminación de nodos son similares a las operaciones de listas enlazadas.
- Los tipos comunes de árboles binarios incluyen árboles binarios perfectos, árboles binarios completos, árboles binarios llenos y árboles binarios equilibrados. El árbol binario perfecto representa el estado ideal, mientras que la lista enlazada es el peor estado después de la degradación.
- Un árbol binario se puede representar usando un arreglo organizando los valores de los nodos y los espacios vacíos en una secuencia de recorrido por niveles e implementando punteros basados en la relación de mapeo de índices entre nodos padre y nodos hijo.
- El recorrido por niveles de un árbol binario es un método de búsqueda en amplitud, que refleja una forma de recorrido capa por capa de "expansión círculo por círculo". Generalmente se implementa usando una cola.
- Los recorridos en preorden, inorden y postorden son todos métodos de búsqueda en profundidad, que reflejan la forma de recorrido de "ir al final primero, luego retroceder para continuar". Generalmente se implementan usando recursión.
- Un árbol de búsqueda binaria es una estructura de datos eficiente para la búsqueda de elementos, con una complejidad temporal de las operaciones de búsqueda, inserción y eliminación de $O(\log n)$. Cuando un árbol de búsqueda binaria degenera en una lista enlazada, estas complejidades temporales se deterioran a $O(n)$.
- Un árbol AVL, también conocido como árbol de búsqueda binaria equilibrado, asegura que el árbol permanezca equilibrado después de inserciones y eliminaciones continuas de nodos a través de operaciones de rotación.
- Las operaciones de rotación en un árbol AVL incluyen rotación a la derecha, rotación a la izquierda, rotación derecha-izquierda y rotación izquierda-derecha. Después de la inserción o eliminación de nodos, el árbol AVL se reequilibra realizando estas rotaciones de abajo hacia arriba.

### Preguntas y respuestas

**P**: Para un árbol binario con un solo nodo, ¿la altura del árbol y la profundidad del nodo raíz son ambas $0$?

Sí, porque la altura y la profundidad se definen típicamente como "el número de aristas recorridas".

**P**: La inserción y eliminación en un árbol binario generalmente se logran mediante un conjunto de operaciones. ¿A qué se refiere aquí "un conjunto de operaciones"? ¿Implica liberar los recursos de los nodos hijos?

Tomando como ejemplo el árbol de búsqueda binaria, la operación de eliminar un nodo debe manejarse en tres escenarios diferentes, cada uno de los cuales requiere múltiples pasos de operaciones de nodo.

**P**: ¿Por qué hay tres secuencias: preorden, inorden y postorden para el recorrido DFS de un árbol binario, y cuáles son sus usos?

Similar al recorrido secuencial y inverso de arreglos, los recorridos en preorden, inorden y postorden son tres métodos para recorrer un árbol binario, lo que nos permite obtener un resultado de recorrido en un orden específico. Por ejemplo, en un árbol de búsqueda binaria, dado que los tamaños de los nodos satisfacen `valor del nodo hijo izquierdo < valor del nodo raíz < valor del nodo hijo derecho`, podemos obtener una secuencia de nodos ordenada recorriendo el árbol con la prioridad "izquierda $\rightarrow$ raíz $\rightarrow$ derecha".

**P**: En una operación de rotación a la derecha que trata con la relación entre los nodos de desequilibrio `node`, `child`, `grand_child`, ¿no se pierde la conexión entre `node` y su nodo padre y el enlace original de `node` después de la rotación a la derecha?

Necesitamos ver este problema desde una perspectiva recursiva. La operación `right_rotate(root)` pasa el nodo raíz del subárbol y finalmente devuelve el nodo raíz del subárbol rotado con `return child`. La conexión entre el nodo raíz del subárbol y su nodo padre se establece después de que esta función regresa, lo cual está fuera del alcance del mantenimiento de la operación de rotación a la derecha.

**P**: En C++, las funciones se dividen en secciones `private` y `public`. ¿Qué consideraciones hay para esto? ¿Por qué la función `height()` y la función `updateHeight()` se colocan en `public` y `private`, respectivamente?

Depende del alcance del uso del método. Si un método solo se usa dentro de la clase, entonces está diseñado para ser `private`. Por ejemplo, no tiene sentido que los usuarios llamen a `updateHeight()` por su cuenta, ya que es solo un paso en las operaciones de inserción o eliminación. Sin embargo, `height()` es para acceder a la altura del nodo, similar a `vector.size()`, por lo que se establece en `public` para su uso.

**P**: ¿Cómo se construye un árbol de búsqueda binaria a partir de un conjunto de datos de entrada? ¿Es muy importante la elección del nodo raíz?

Sí, el método para construir el árbol se proporciona en el método `build_tree()` en el código del árbol de búsqueda binaria. En cuanto a la elección del nodo raíz, generalmente ordenamos los datos de entrada y luego seleccionamos el elemento central como nodo raíz, construyendo recursivamente los subárboles izquierdo y derecho. Este enfoque maximiza el equilibrio del árbol.

**P**: En Java, ¿siempre hay que usar el método `equals()` para la comparación de cadenas?

En Java, para los tipos de datos primitivos, `==` se usa para comparar si los valores de dos variables son iguales. Para los tipos de referencia, los principios de funcionamiento de los dos símbolos son diferentes.

-   `==`: Se usa para comparar si dos variables apuntan al mismo objeto, es decir, si sus posiciones en la memoria son las mismas.
-   `equals()`: Se usa para comparar si los valores de dos objetos son iguales.

Por lo tanto, para comparar valores, debemos usar `equals()`. Sin embargo, las cadenas inicializadas con `String a = "hi"; String b = "hi";` se almacenan en el grupo de constantes de cadena y apuntan al mismo objeto, por lo que `a == b` también se puede usar para comparar el contenido de dos cadenas.

**P**: Antes de llegar al nivel inferior, ¿el número de nodos en la cola es $2^h$ en el recorrido en amplitud?

Sí, por ejemplo, un árbol binario completo con altura $h = 2$ tiene un total de $n = 7$ nodos, entonces el nivel inferior tiene $4 = 2^h = (n + 1) / 2$ nodos.

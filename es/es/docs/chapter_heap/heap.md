# Montículo

Un <u>montículo</u> es un árbol binario completo que satisface condiciones específicas y se puede clasificar principalmente en dos tipos, como se muestra en la figura a continuación.

-   <u>montículo mínimo</u>: El valor de cualquier nodo $\leq$ los valores de sus nodos hijos.
-   <u>montículo máximo</u>: El valor de cualquier nodo $\geq$ los valores de sus nodos hijos.

![Montículo mínimo y montículo máximo](heap.assets/min_heap_and_max_heap.png)

Como caso especial de un árbol binario completo, un montículo tiene las siguientes características:

-   Los nodos de la capa inferior se llenan de izquierda a derecha, y los nodos de otras capas están completamente llenos.
-   El nodo raíz del árbol binario se llama la "cima" del montículo, y el nodo más a la derecha de la parte inferior se llama el "fondo" del montículo.
-   Para los montículos máximos (montículos mínimos), el valor del elemento superior (raíz) es el más grande (más pequeño) entre todos los elementos.

## Operaciones comunes del montículo

Cabe señalar que muchos lenguajes de programación proporcionan una <u>cola de prioridad</u>, que es una estructura de datos abstracta definida como una cola con ordenación de prioridad.

En la práctica, **los montículos se utilizan a menudo para implementar colas de prioridad. Un montículo máximo corresponde a una cola de prioridad donde los elementos se desencolan en orden descendente**. Desde una perspectiva de uso, podemos considerar "cola de prioridad" y "montículo" como estructuras de datos equivalentes. Por lo tanto, este libro no hace una distinción especial entre los dos, refiriéndose uniformemente a ellos como "montículo".

Las operaciones comunes en los montículos se muestran en la tabla a continuación, y los nombres de los métodos pueden variar según el lenguaje de programación.

<p align="center"> Tabla <id> &nbsp; Eficiencia de las operaciones del montículo </p>

| Nombre del método | Descripción                                                  | Complejidad temporal |
| ----------- | ------------------------------------------------------------ | --------------- |
| `push()`    | Agregar un elemento al montículo                                   | $O(\log n)$     |
| `pop()`     | Eliminar el elemento superior del montículo                         | $O(\log n)$     |
| `peek()`    | Acceder al elemento superior (para montículo máximo/mínimo, el valor máximo/mínimo) | $O(1)$          |
| `size()`    | Obtener el número de elementos en el montículo                       | $O(1)$          |
| `isEmpty()` | Comprobar si el montículo está vacío                                   | $O(1)$          |

En la práctica, podemos usar directamente la clase de montículo (o clase de cola de prioridad) proporcionada por los lenguajes de programación.

Similar a los algoritmos de ordenación donde tenemos "orden ascendente" y "orden descendente", podemos cambiar entre "montículo mínimo" y "montículo máximo" estableciendo una `flag` o modificando el `Comparator`. El código es el siguiente:

=== "Python"

    ```python title="heap.py"
    # Inicializar un montículo mínimo
    min_heap, flag = [], 1
    # Inicializar un montículo máximo
    max_heap, flag = [], -1

    # El módulo heapq de Python implementa un montículo mínimo por defecto
    # Al negar los elementos antes de empujarlos al montículo, invertimos el orden y así implementamos un montículo máximo
    # En este ejemplo, flag = 1 corresponde a un montículo mínimo, mientras que flag = -1 corresponde a un montículo máximo

    # Empujar elementos al montículo
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)

    # Recuperar el elemento superior del montículo
    peek: int = flag * max_heap[0] # 5

    # Sacar el elemento superior del montículo
    # Los elementos sacados formarán una secuencia en orden descendente
    val = flag * heapq.heappop(max_heap) # 5
    val = flag * heapq.heappop(max_heap) # 4
    val = flag * heapq.heappop(max_heap) # 3
    val = flag * heapq.heappop(max_heap) # 2
    val = flag * heapq.heappop(max_heap) # 1

    # Obtener el tamaño del montículo
    size: int = len(max_heap)

    # Comprobar si el montículo está vacío
    is_empty: bool = not max_heap

    # Crear un montículo a partir de una lista
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    ```

## Implementación del montículo

La siguiente implementación es de un montículo máximo. Para convertirlo en un montículo mínimo, simplemente invierta todas las comparaciones lógicas de tamaño (por ejemplo, reemplace $\geq$ con $\leq$). Se anima a los lectores interesados a implementarlo por su cuenta.

### Almacenamiento y representación del montículo

Como se mencionó en la sección "Árboles binarios", los árboles binarios completos son muy adecuados para la representación en arreglos. Dado que los montículos son un tipo de árbol binario completo, **utilizaremos arreglos para almacenar montículos**.

Al usar un arreglo para representar un árbol binario, los elementos representan los valores de los nodos y los índices representan las posiciones de los nodos en el árbol binario. **Los punteros de los nodos se implementan a través de una fórmula de mapeo de índices**.

Como se muestra en la figura a continuación, dado un índice $i$, el índice de su hijo izquierdo es $2i + 1$, el índice de su hijo derecho es $2i + 2$, y el índice de su padre es $(i - 1) / 2$ (división entera). Cuando el índice está fuera de los límites, significa un nodo nulo o que el nodo no existe.

![Representación y almacenamiento de montículos](heap.assets/representation_of_heap.png)

Podemos encapsular la fórmula de mapeo de índices en funciones para un uso posterior conveniente:

```src
[file]{my_heap}-[class]{max_heap}-[func]{parent}
```

### Acceso al elemento superior del montículo

El elemento superior del montículo es el nodo raíz del árbol binario, que también es el primer elemento de la lista:

```src
[file]{my_heap}-[class]{max_heap}-[func]{peek}
```

### Inserción de un elemento en el montículo

Dado un elemento `val`, primero lo agregamos al fondo del montículo. Después de la adición, dado que `val` puede ser mayor que otros elementos en el montículo, la integridad del montículo podría verse comprometida, **por lo que es necesario reparar la ruta desde el nodo insertado hasta el nodo raíz**. Esta operación se llama <u>heapify</u>.

Considerando comenzar desde el nodo insertado, **realice heapify de abajo hacia arriba**. Como se muestra en la figura a continuación, comparamos el valor del nodo insertado con su nodo padre, y si el nodo insertado es mayor, los intercambiamos. Luego, continuamos esta operación, reparando cada nodo en el montículo de abajo hacia arriba hasta llegar a la raíz o a un nodo que no necesita intercambio.

=== "<1>"
    ![Pasos de inserción de elementos en el montículo](heap.assets/heap_push_step1.png)

=== "<2>"
    ![heap_push_step2](heap.assets/heap_push_step2.png)

=== "<3>"
    ![heap_push_step3](heap.assets/heap_push_step3.png)

=== "<4>"
    ![heap_push_step4](heap.assets/heap_push_step4.png)

=== "<5>"
    ![heap_push_step5](heap.assets/heap_push_step5.png)

=== "<6>"
    ![heap_push_step6](heap.assets/heap_push_step6.png)

=== "<7>"
    ![heap_push_step7](heap.assets/heap_push_step7.png)

=== "<8>"
    ![heap_push_step8](heap.assets/heap_push_step8.png)

=== "<9>"
    ![heap_push_step9](heap.assets/heap_push_step9.png)

Dado un total de $n$ nodos, la altura del árbol es $O(\log n)$. Por lo tanto, las iteraciones del bucle para la operación heapify son como máximo $O(\log n)$, **lo que hace que la complejidad temporal de la operación de inserción de elementos sea $O(\log n)$**. El código es el siguiente:

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_up}
```

### Eliminación del elemento superior del montículo

El elemento superior del montículo es el nodo raíz del árbol binario, es decir, el primer elemento de la lista. Si eliminamos directamente el primer elemento de la lista, todos los índices de los nodos en el árbol binario cambiarán, lo que dificultará el uso de heapify para reparaciones posteriores. Para minimizar los cambios en los índices de los elementos, utilizamos los siguientes pasos.

1.  Intercambie el elemento superior con el elemento inferior del montículo (intercambie el nodo raíz con el nodo hoja más a la derecha).
2.  Después del intercambio, elimine la parte inferior del montículo de la lista (tenga en cuenta que, dado que se ha intercambiado, el elemento superior original se está eliminando).
3.  Comenzando desde el nodo raíz, **realice heapify de arriba hacia abajo**.

Como se muestra en la figura a continuación, **la dirección de "heapify de arriba hacia abajo" es opuesta a "heapify de abajo hacia arriba"**. Comparamos el valor del nodo raíz con sus dos hijos y lo intercambiamos con el hijo más grande. Luego, repetimos esta operación hasta llegar al nodo hoja o encontrar un nodo que no necesite intercambio.

=== "<1>"
    ![Pasos para eliminar el elemento superior del montículo](heap.assets/heap_pop_step1.png)

=== "<2>"
    ![heap_pop_step2](heap.assets/heap_pop_step2.png)

=== "<3>"
    ![heap_pop_step3](heap.assets/heap_pop_step3.png)

=== "<4>"
    ![heap_pop_step4](heap.assets/heap_pop_step4.png)

=== "<5>"
    ![heap_pop_step5](heap.assets/heap_pop_step5.png)

=== "<6>"
    ![heap_pop_step6](heap.assets/heap_pop_step6.png)

=== "<7>"
    ![heap_pop_step7](heap.assets/heap_pop_step7.png)

=== "<8>"
    ![heap_pop_step8](heap.assets/heap_pop_step8.png)

=== "<9>"
    ![heap_pop_step9](heap.assets/heap_pop_step9.png)

=== "<10>"
    ![heap_pop_step10](heap.assets/heap_pop_step10.png)

Similar a la operación de inserción de elementos, la complejidad temporal de la operación de eliminación del elemento superior también es $O(\log n)$. El código es el siguiente:

```src
[file]{my_heap}-[class]{max_heap}-[func]{sift_down}
```

## Aplicaciones comunes de los montículos

-   **Cola de prioridad**: Los montículos suelen ser la estructura de datos preferida para implementar colas de prioridad, con operaciones de encolar y desencolar con una complejidad temporal de $O(\log n)$, y la construcción de una cola con una complejidad temporal de $O(n)$, todas ellas muy eficientes.
-   **Ordenación por montículos**: Dado un conjunto de datos, podemos crear un montículo a partir de ellos y luego realizar continuamente operaciones de eliminación de elementos para obtener datos ordenados. Sin embargo, existe una forma más elegante de implementar la ordenación por montículos, como se explica en el capítulo "Ordenación por montículos".
-   **Encontrar los $k$ elementos más grandes**: Este es un problema algorítmico clásico y también un caso de uso común, como seleccionar las 10 noticias más populares para la búsqueda en caliente de Weibo, elegir los 10 productos más vendidos, etc.

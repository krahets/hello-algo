# Cola

Una <u>cola</u> es una estructura de datos lineal que sigue la regla de Primero en Entrar, Primero en Salir (FIFO). Como su nombre indica, una cola simula el fenómeno de hacer fila, donde los recién llegados se unen a la cola por la parte trasera, y la persona que está al frente sale de la cola primero.

Como se muestra en la figura a continuación, llamamos a la parte delantera de la cola la "cabeza" y a la parte trasera la "cola". La operación de agregar elementos a la parte trasera de la cola se denomina "encolar", y la operación de eliminar elementos de la parte delantera se denomina "desencolar".

![Regla de primero en entrar, primero en salir de la cola](queue.assets/queue_operations.png)

## Operaciones comunes en la cola

Las operaciones comunes en una cola se muestran en la tabla a continuación. Tenga en cuenta que los nombres de los métodos pueden variar entre los diferentes lenguajes de programación. Aquí, usamos la misma convención de nombres que la utilizada para las pilas.

<p align="center"> Tabla <id> &nbsp; Eficiencia de las operaciones de cola </p>

| Nombre del método | Descripción                            | Complejidad temporal |
| ----------- | -------------------------------------- | --------------- |
| `push()`    | Encolar un elemento, agregarlo a la cola | $O(1)$          |
| `pop()`     | Desencolar el elemento de la cabeza               | $O(1)$          |
| `peek()`    | Acceder al elemento de la cabeza                | $O(1)$          |

Podemos usar directamente las clases de cola ya hechas en los lenguajes de programación:

=== "Python"

    ```python title="queue.py"
    from collections import deque

    # Inicializar la cola
    # En Python, generalmente usamos la clase deque como cola
    # Aunque queue.Queue() es una clase de cola pura, no es muy fácil de usar, por lo que no se recomienda
    que: deque[int] = deque()

    # Encolar elementos
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)

    # Acceder al primer elemento
    front: int = que[0]

    # Desencolar un elemento
    pop: int = que.popleft()

    # Obtener la longitud de la cola
    size: int = len(que)

    # Comprobar si la cola está vacía
    is_empty: bool = len(que) == 0
    ```

## Implementación de una cola

Para implementar una cola, necesitamos una estructura de datos que permita agregar elementos en un extremo y eliminarlos en el otro. Tanto las listas enlazadas como los arreglos cumplen con este requisito.

### Implementación basada en una lista enlazada

Como se muestra en la figura a continuación, podemos considerar el "nodo cabeza" y el "nodo cola" de una lista enlazada como el "frente" y la "parte trasera" de la cola, respectivamente. Se estipula que los nodos solo se pueden agregar en la parte trasera y eliminar en el frente.

=== "LinkedListQueue"
    ![Implementación de cola con lista enlazada para operaciones de encolar y desencolar](queue.assets/linkedlist_queue_step1.png)

=== "push()"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_step2_push.png)

=== "pop()"
    ![linkedlist_queue_pop](queue.assets/linkedlist_queue_step3_pop.png)

A continuación se muestra el código para implementar una cola usando una lista enlazada:

```src
[file]{linkedlist_queue}-[class]{linked_list_queue}-[func]{}
```

### Implementación basada en un arreglo

Eliminar el primer elemento de un arreglo tiene una complejidad temporal de $O(n)$, lo que haría que la operación de desencolar fuera ineficiente. Sin embargo, este problema se puede evitar inteligentemente de la siguiente manera.

Usamos una variable `front` para indicar el índice del elemento frontal y mantenemos una variable `size` para registrar la longitud de la cola. Definimos `rear = front + size`, que apunta a la posición inmediatamente posterior al elemento de la cola.

Con este diseño, **el intervalo efectivo de elementos en el arreglo es `[front, rear - 1]`**. Los métodos de implementación para varias operaciones se muestran en la figura a continuación.

-   Operación de encolar: Asigne el elemento de entrada al índice `rear` y aumente `size` en 1.
-   Operación de desencolar: Simplemente aumente `front` en 1 y disminuya `size` en 1.

Ambas operaciones de encolar y desencolar solo requieren una única operación, cada una con una complejidad temporal de $O(1)$.

=== "ArrayQueue"
    ![Implementación de cola con arreglo para operaciones de encolar y desencolar](queue.assets/array_queue_step1.png)

=== "push()"
    ![array_queue_push](queue.assets/array_queue_step2_push.png)

=== "pop()"
    ![array_queue_pop](queue.assets/array_queue_step3_pop.png)

Podría notar un problema: a medida que las operaciones de encolar y desencolar se realizan continuamente, tanto `front` como `rear` se mueven hacia la derecha y **eventualmente llegarán al final del arreglo y no podrán moverse más**. Para resolver esto, podemos tratar el arreglo como un "arreglo circular" donde se conecta el final del arreglo de nuevo a su principio.

En un arreglo circular, `front` o `rear` deben volver al principio del arreglo al llegar al final. Este patrón cíclico se puede lograr con una "operación de módulo" como se muestra en el código a continuación:

```src
[file]{array_queue}-[class]{array_queue}-[func]{}
```

La implementación anterior de la cola todavía tiene sus limitaciones: su longitud es fija. Sin embargo, este problema no es difícil de resolver. Podemos reemplazar el arreglo con un arreglo dinámico que pueda expandirse si es necesario. Los lectores interesados pueden intentar implementarlo ellos mismos.

La comparación de las dos implementaciones es consistente con la de la pila y no se repite aquí.

## Aplicaciones típicas de la cola

-   **Pedidos de Amazon**: Después de que los compradores realizan pedidos, estos pedidos se unen a una cola, y el sistema los procesa en orden. Durante eventos como el Día del Soltero, se genera una gran cantidad de pedidos en poco tiempo, lo que convierte la alta concurrencia en un desafío clave para los ingenieros.
-   **Varias listas de tareas pendientes**: Cualquier escenario que requiera una funcionalidad de "primero en llegar, primero en ser atendido", como la cola de tareas de una impresora o la cola de entrega de alimentos de un restaurante, puede mantener eficazmente el orden de procesamiento con una cola.

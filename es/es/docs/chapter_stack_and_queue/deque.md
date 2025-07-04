# Cola de doble extremo

En una cola, solo podemos eliminar elementos de la cabeza o agregar elementos a la cola. Como se muestra en la figura a continuación, una <u>cola de doble extremo (deque)</u> ofrece más flexibilidad, permitiendo la adición o eliminación de elementos tanto en la cabeza como en la cola.

![Operaciones en cola de doble extremo](deque.assets/deque_operations.png)

## Operaciones comunes en cola de doble extremo

Las operaciones comunes en una cola de doble extremo se enumeran a continuación, y los nombres de los métodos específicos dependen del lenguaje de programación utilizado.

<p align="center"> Tabla <id> &nbsp; Eficiencia de las operaciones de cola de doble extremo </p>

| Nombre del método   | Descripción                | Complejidad temporal |
| ------------- | -------------------------- | --------------- |
| `pushFirst()` | Agregar un elemento a la cabeza | $O(1)$          |
| `pushLast()`  | Agregar un elemento a la cola | $O(1)$          |
| `popFirst()`  | Eliminar el primer elemento   | $O(1)$          |
| `popLast()`   | Eliminar el último elemento    | $O(1)$          |
| `peekFirst()` | Acceder al primer elemento   | $O(1)$          |
| `peekLast()`  | Acceder al último elemento    | $O(1)$          |

De manera similar, podemos usar directamente las clases de cola de doble extremo implementadas en los lenguajes de programación:

=== "Python"

    ```python title="deque.py"
    from collections import deque

    # Inicializar la deque
    deq: deque[int] = deque()

    # Encolar elementos
    deq.append(2)      # Agregar a la cola
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Agregar a la cabeza
    deq.appendleft(1)

    # Acceder a elementos
    front: int = deq[0]  # El primer elemento
    rear: int = deq[-1]  # El último elemento

    # Desencolar elementos
    pop_front: int = deq.popleft()  # El primer elemento desencolado
    pop_rear: int = deq.pop()       # El último elemento desencolado

    # Obtener la longitud de la deque
    size: int = len(deq)

    # Comprobar si la deque está vacía
    is_empty: bool = len(deq) == 0
    ```

## Implementación de una cola de doble extremo *

La implementación de una cola de doble extremo es similar a la de una cola regular, puede basarse en una lista enlazada o en un arreglo como estructura de datos subyacente.

### Implementación basada en lista doblemente enlazada

Recordemos de la sección anterior que usamos una lista enlazada simple regular para implementar una cola, ya que convenientemente permite eliminar desde la cabeza (correspondiente a la operación de desencolar) y agregar nuevos elementos después de la cola (correspondiente a la operación de encolar).

Para una cola de doble extremo, tanto la cabeza como la cola pueden realizar operaciones de encolar y desencolar. En otras palabras, una cola de doble extremo necesita implementar operaciones en la dirección opuesta también. Para esto, usamos una "lista doblemente enlazada" como estructura de datos subyacente de la cola de doble extremo.

Como se muestra en la figura a continuación, tratamos los nodos cabeza y cola de la lista doblemente enlazada como el frente y la parte trasera de la cola de doble extremo, respectivamente, e implementamos la funcionalidad para agregar y eliminar nodos en ambos extremos.

=== "LinkedListDeque"
    ![Implementación de cola de doble extremo con lista doblemente enlazada para operaciones de encolar y desencolar](deque.assets/linkedlist_deque_step1.png)

=== "pushLast()"
    ![linkedlist_deque_push_last](deque.assets/linkedlist_deque_step2_push_last.png)

=== "pushFirst()"
    ![linkedlist_deque_push_first](deque.assets/linkedlist_deque_step3_push_first.png)

=== "popLast()"
    ![linkedlist_deque_pop_last](deque.assets/linkedlist_deque_step4_pop_last.png)

=== "popFirst()"
    ![linkedlist_deque_pop_first](deque.assets/linkedlist_deque_step5_pop_first.png)

El código de implementación es el siguiente:

```src
[file]{linkedlist_deque}-[class]{linked_list_deque}-[func]{}
```

### Implementación basada en arreglo

Como se muestra en la figura a continuación, de manera similar a la implementación de una cola con un arreglo, también podemos usar un arreglo circular para implementar una cola de doble extremo.

=== "ArrayDeque"
    ![Implementación de cola de doble extremo con arreglo para operaciones de encolar y desencolar](deque.assets/array_deque_step1.png)

=== "pushLast()"
    ![array_deque_push_last](deque.assets/array_deque_step2_push_last.png)

=== "pushFirst()"
    ![array_deque_push_first](deque.assets/array_deque_step3_push_first.png)

=== "popLast()"
    ![array_deque_pop_last](deque.assets/array_deque_step4_pop_last.png)

=== "popFirst()"
    ![array_deque_pop_first](deque.assets/array_deque_step5_pop_first.png)

La implementación solo necesita agregar métodos para "encolar al frente" y "desencolar por la parte trasera":

```src
[file]{array_deque}-[class]{array_deque}-[func]{}
```

## Aplicaciones de la cola de doble extremo

La cola de doble extremo combina la lógica de pilas y colas, **por lo tanto, puede implementar todos sus casos de uso respectivos al tiempo que ofrece una mayor flexibilidad**.

Sabemos que la función "deshacer" del software se implementa típicamente usando una pila: el sistema `empuja` cada operación de cambio a la pila y luego `saca` para implementar el deshacer. Sin embargo, considerando las limitaciones de los recursos del sistema, el software a menudo restringe el número de pasos de deshacer (por ejemplo, solo permite los últimos 50 pasos). Cuando la longitud de la pila excede los 50, el software necesita realizar una operación de eliminación en la parte inferior de la pila (el frente de la cola). **Pero una pila regular no puede realizar esta función, donde una cola de doble extremo se vuelve necesaria**. Tenga en cuenta que la lógica central de "deshacer" todavía sigue el principio de Último en Entrar, Primero en Salir de una pila, pero una cola de doble extremo puede implementar de manera más flexible alguna lógica adicional.

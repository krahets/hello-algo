# Lista enlazada

El espacio de memoria es un recurso compartido entre todos los programas. En un entorno de sistema complejo, la memoria disponible puede estar dispersa por todo el espacio de memoria. Entendemos que la memoria asignada para un arreglo debe ser continua. Sin embargo, para arreglos muy grandes, encontrar un espacio de memoria contiguo suficientemente grande podría ser un desafío. Aquí es donde la ventaja flexible de las listas enlazadas se hace evidente.

Una <u>lista enlazada</u> es una estructura de datos lineal en la que cada elemento es un objeto nodo, y los nodos están interconectados a través de "referencias". Estas referencias contienen las direcciones de memoria de los nodos subsiguientes, lo que permite la navegación de un nodo al siguiente.

El diseño de las listas enlazadas permite que sus nodos se distribuyan en diferentes ubicaciones de memoria sin requerir direcciones de memoria contiguas.

![Definición de lista enlazada y método de almacenamiento](linked_list.assets/linkedlist_definition.png)

Como se muestra en la figura anterior, vemos que el bloque de construcción básico de una lista enlazada es el objeto <u>nodo</u>. Cada nodo consta de dos componentes clave: el "valor" del nodo y una "referencia" al siguiente nodo.

- El primer nodo de una lista enlazada es el "nodo cabeza", y el último es el "nodo cola".
- El nodo cola apunta a "nulo", designado como `null` en Java, `nullptr` en C++ y `None` en Python.
- En lenguajes que admiten punteros, como C, C++, Go y Rust, esta "referencia" se implementa típicamente como un "puntero".

Como ilustra el código a continuación, un `ListNode` en una lista enlazada, además de contener un valor, también debe mantener una referencia (o puntero) adicional. Por lo tanto, **una lista enlazada ocupa más espacio de memoria que un arreglo al almacenar la misma cantidad de datos.**.

=== "Python"

    ```python title=""
    class ListNode:
        """Clase de nodo de lista enlazada"""
        def __init__(self, val: int):
            self.val: int = val               # Valor del nodo
            self.next: ListNode | None = None # Referencia al siguiente nodo
    ```

## Operaciones comunes en listas enlazadas

### Inicialización de una lista enlazada

La construcción de una lista enlazada es un proceso de dos pasos: primero, inicializar cada objeto nodo, y segundo, formar los enlaces de referencia entre los nodos. Después de la inicialización, podemos recorrer todos los nodos secuencialmente desde el nodo cabeza siguiendo la referencia `next`.

=== "Python"

    ```python title="linked_list.py"
    # Inicializar lista enlazada: 1 -> 3 -> 2 -> 5 -> 4
    # Inicializar cada nodo
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # Construir referencias entre nodos
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

### Inserción de nodos

Insertar un nodo en una lista enlazada es muy fácil. Como se muestra en la figura a continuación, supongamos que queremos insertar un nuevo nodo `P` entre dos nodos adyacentes `n0` y `n1`. **Esto se puede lograr simplemente modificando dos referencias de nodo (punteros)**, con una complejidad temporal de $O(1)$.

En comparación, insertar un elemento en un arreglo tiene una complejidad temporal de $O(n)$, lo que se vuelve menos eficiente cuando se trata de grandes volúmenes de datos.

![Ejemplo de inserción de nodos en una lista enlazada](linked_list.assets/linkedlist_insert_node.png)

```src
[file]{linked_list}-[class]{}-[func]{insert}
```

### Eliminación de nodos

Como se muestra en la figura a continuación, eliminar un nodo de una lista enlazada también es muy fácil, **lo que implica solo la modificación de la referencia (puntero) de un solo nodo**.

Es importante tener en cuenta que, aunque el nodo `P` sigue apuntando a `n1` después de ser eliminado, se vuelve inaccesible durante el recorrido de la lista enlazada. Esto significa efectivamente que `P` ya no forma parte de la lista enlazada.

![Eliminación de nodos de una lista enlazada](linked_list.assets/linkedlist_remove_node.png)

```src
[file]{linked_list}-[class]{}-[func]{remove}
```

### Acceso a nodos

**El acceso a los nodos en una lista enlazada es menos eficiente**. Como se mencionó anteriormente, se puede acceder a cualquier elemento de un arreglo en tiempo $O(1)$. Por el contrario, con una lista enlazada, el programa implica comenzar desde el nodo cabeza y recorrer secuencialmente los nodos hasta que se encuentra el nodo deseado. En otras palabras, para acceder al nodo $i$-ésimo en una lista enlazada, el programa debe iterar a través de $i - 1$ nodos, lo que resulta en una complejidad temporal de $O(n)$.

```src
[file]{linked_list}-[class]{}-[func]{access}
```

### Búsqueda de nodos

Recorra la lista enlazada para localizar un nodo cuyo valor coincida con `target`, y luego genere el índice de ese nodo dentro de la lista enlazada. Este procedimiento también es un ejemplo de búsqueda lineal. El código correspondiente se proporciona a continuación:

```src
[file]{linked_list}-[class]{}-[func]{find}
```

## Arreglos vs. listas enlazadas

La siguiente tabla resume las características de los arreglos y las listas enlazadas, y también compara sus eficiencias en varias operaciones. Debido a que utilizan estrategias de almacenamiento opuestas, sus respectivas propiedades y eficiencias operativas exhiben contrastes distintos.

<p align="center"> Tabla <id> &nbsp; Comparación de eficiencia de arreglos y listas enlazadas </p>

|                    | Arreglos                                           | Listas enlazadas            |
| ------------------ | ------------------------------------------------ | ----------------------- |
| Almacenamiento            | Espacio de memoria contiguo                          | Espacio de memoria disperso  |
| Expansión de capacidad | Longitud fija                                     | Expansión flexible      |
| Eficiencia de memoria  | Menos memoria por elemento, posible desperdicio de espacio | Más memoria por elemento |
| Acceso a elementos | $O(1)$                                           | $O(n)$                  |
| Adición de elementos    | $O(n)$                                           | $O(1)$                  |
| Eliminación de elementos  | $O(n)$                                           | $O(1)$                  |

## Tipos comunes de listas enlazadas

Como se muestra en la figura a continuación, hay tres tipos comunes de listas enlazadas.

-   **Lista enlazada simple**: Esta es la lista enlazada estándar descrita anteriormente. Los nodos en una lista enlazada simple incluyen un valor y una referencia al siguiente nodo. El primer nodo se conoce como nodo cabeza, y el último nodo, que apunta a nulo (`None`), es el nodo cola.
-   **Lista enlazada circular**: Se forma cuando el nodo cola de una lista enlazada simple apunta de nuevo al nodo cabeza, creando un bucle. En una lista enlazada circular, cualquier nodo puede funcionar como nodo cabeza.
-   **Lista doblemente enlazada**: A diferencia de una lista enlazada simple, una lista doblemente enlazada mantiene referencias en dos direcciones. Cada nodo contiene referencias (puntero) tanto a su sucesor (el siguiente nodo) como a su predecesor (el nodo anterior). Aunque las listas doblemente enlazadas ofrecen más flexibilidad para recorrer en cualquier dirección, también consumen más espacio de memoria.

=== "Python"

    ```python title=""
    class ListNode:
        """Clase de nodo de lista enlazada bidireccional"""
        def __init__(self, val: int):
            self.val: int = val                # Valor del nodo
            self.next: ListNode | None = None  # Referencia al nodo sucesor
            self.prev: ListNode | None = None  # Referencia a un nodo predecesor
    ```

![Tipos comunes de listas enlazadas](linked_list.assets/linkedlist_common_types.png)

## Aplicaciones típicas de las listas enlazadas

Las listas enlazadas simples se utilizan con frecuencia en la implementación de pilas, colas, tablas hash y grafos.

-   **Pilas y colas**: En las listas enlazadas simples, si las inserciones y eliminaciones ocurren en el mismo extremo, se comporta como una pila (último en entrar, primero en salir). Por el contrario, si las inserciones están en un extremo y las eliminaciones en el otro, funciona como una cola (primero en entrar, primero en salir).
-   **Tablas hash**: Las listas enlazadas se utilizan en el encadenamiento, un método popular para resolver colisiones de hash. Aquí, todos los elementos colisionados se agrupan en una lista enlazada.
-   **Grafos**: Las listas de adyacencia, un método estándar para la representación de grafos, asocian cada vértice del grafo con una lista enlazada. Esta lista contiene elementos que representan vértices conectados al vértice correspondiente.

Las listas doblemente enlazadas son ideales para escenarios que requieren un acceso rápido a los elementos precedentes y sucesores.

-   **Estructuras de datos avanzadas**: En estructuras como los árboles rojo-negro y los árboles B, el acceso al padre de un nodo es esencial. Esto se logra incorporando una referencia al nodo padre en cada nodo, similar a una lista doblemente enlazada.
-   **Historial del navegador**: En los navegadores web, las listas doblemente enlazadas facilitan la navegación por el historial de páginas visitadas cuando los usuarios hacen clic en avanzar o retroceder.
-   **Algoritmo LRU**: Las listas doblemente enlazadas son adecuadas para los algoritmos de expulsión de caché de menos usadas recientemente (LRU), lo que permite una rápida identificación de los datos menos usados recientemente y facilita la adición y eliminación rápida de nodos.

Las listas enlazadas circulares son ideales para aplicaciones que requieren operaciones periódicas, como la programación de recursos en sistemas operativos.

-   **Algoritmo de planificación por turnos**: En los sistemas operativos, el algoritmo de planificación por turnos es un método común de planificación de CPU, que requiere recorrer un grupo de procesos. A cada proceso se le asigna un segmento de tiempo, y al expirar, la CPU rota al siguiente proceso. Esta operación cíclica se puede realizar de manera eficiente utilizando una lista enlazada circular, lo que permite un sistema justo y de tiempo compartido entre todos los procesos.
-   **Búferes de datos**: Las listas enlazadas circulares también se utilizan en búferes de datos, como en reproductores de audio y video, donde el flujo de datos se divide en múltiples bloques de búfer organizados de forma circular para una reproducción fluida.

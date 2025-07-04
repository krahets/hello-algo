# Pila

Una <u>pila</u> es una estructura de datos lineal que sigue el principio de Último en Entrar, Primero en Salir (LIFO).

Podemos comparar una pila con una pila de platos sobre una mesa. Para acceder al plato inferior, primero hay que quitar los platos de arriba. Al reemplazar los platos con varios tipos de elementos (como enteros, caracteres, objetos, etc.), obtenemos la estructura de datos conocida como pila.

Como se muestra en la figura a continuación, nos referimos a la parte superior de la pila de elementos como la "cima de la pila" y a la parte inferior como el "fondo de la pila". La operación de agregar elementos a la cima de la pila se llama "push", y la operación de eliminar el elemento superior se llama "pop".

![Regla de último en entrar, primero en salir de la pila](stack.assets/stack_operations.png)

## Operaciones comunes en la pila

Las operaciones comunes en una pila se muestran en la tabla a continuación. Los nombres de los métodos específicos dependen del lenguaje de programación utilizado. Aquí, usamos `push()`, `pop()` y `peek()` como ejemplos.

<p align="center"> Tabla <id> &nbsp; Eficiencia de las operaciones de pila </p>

| Método   | Descripción                                     | Complejidad temporal |
| -------- | ----------------------------------------------- | --------------- |
| `push()` | Empujar un elemento a la pila (agregar a la cima) | $O(1)$          |
| `pop()`  | Sacar el elemento superior de la pila              | $O(1)$          |
| `peek()` | Acceder al elemento superior de la pila             | $O(1)$          |

Típicamente, podemos usar directamente la clase de pila incorporada en el lenguaje de programación. Sin embargo, algunos lenguajes pueden no proporcionar específicamente una clase de pila. En estos casos, podemos usar el "arreglo" o la "lista enlazada" del lenguaje como una pila e ignorar las operaciones que no estén relacionadas con la lógica de la pila en el programa.

=== "Python"

    ```python title="stack.py"
    # Inicializar la pila
    # Python no tiene una clase de pila incorporada, por lo que se puede usar una lista como pila
    stack: list[int] = []

    # Empujar elementos a la pila
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # Acceder al elemento superior de la pila
    peek: int = stack[-1]

    # Sacar un elemento de la pila
    pop: int = stack.pop()

    # Obtener la longitud de la pila
    size: int = len(stack)

    # Comprobar si la pila está vacía
    is_empty: bool = len(stack) == 0
    ```

## Implementación de una pila

Para comprender mejor cómo funciona una pila, intentemos implementar una clase de pila nosotros mismos.

Una pila sigue el principio de Último en Entrar, Primero en Salir, lo que significa que solo podemos agregar o eliminar elementos en la parte superior de la pila. Sin embargo, tanto los arreglos como las listas enlazadas permiten agregar y eliminar elementos en cualquier posición, **por lo tanto, una pila puede verse como un arreglo o una lista enlazada restringida**. En otras palabras, podemos "proteger" ciertas operaciones irrelevantes de un arreglo o una lista enlazada, alineando su comportamiento externo con las características de una pila.

### Implementación basada en una lista enlazada

Al implementar una pila usando una lista enlazada, podemos considerar el nodo cabeza de la lista como la cima de la pila y el nodo cola como el fondo de la pila.

Como se muestra en la figura a continuación, para la operación push, simplemente insertamos elementos al principio de la lista enlazada. Este método de inserción de nodos se conoce como "inserción en la cabeza". Para la operación pop, solo necesitamos eliminar el nodo cabeza de la lista.

=== "LinkedListStack"
    ![Implementación de pila con lista enlazada para operaciones push y pop](stack.assets/linkedlist_stack_step1.png)

=== "push()"
    ![linkedlist_stack_push](stack.assets/linkedlist_stack_step2_push.png)

=== "pop()"
    ![linkedlist_stack_pop](stack.assets/linkedlist_stack_step3_pop.png)

A continuación se muestra un ejemplo de código para implementar una pila basada en una lista enlazada:

```src
[file]{linkedlist_stack}-[class]{linked_list_stack}-[func]{}
```

### Implementación basada en un arreglo

Al implementar una pila usando un arreglo, podemos considerar el final del arreglo como la cima de la pila. Como se muestra en la figura a continuación, las operaciones push y pop corresponden a agregar y eliminar elementos al final del arreglo, respectivamente, ambas con una complejidad temporal de $O(1)$.

=== "ArrayStack"
    ![Implementación de pila con arreglo para operaciones push y pop](stack.assets/array_stack_step1.png)

=== "push()"
    ![array_stack_push](stack.assets/array_stack_step2_push.png)

=== "pop()"
    ![array_stack_pop](stack.assets/array_stack_step3_pop.png)

Dado que los elementos que se van a empujar a la pila pueden aumentar continuamente, podemos usar un arreglo dinámico, evitando así la necesidad de manejar la expansión del arreglo nosotros mismos. Aquí hay un ejemplo de código:

```src
[file]{array_stack}-[class]{array_stack}-[func]{}
```

## Comparación de las dos implementaciones

**Operaciones soportadas**

Ambas implementaciones soportan todas las operaciones definidas en una pila. La implementación de arreglo adicionalmente soporta acceso aleatorio, pero esto está más allá del alcance de una definición de pila y generalmente no se usa.

**Eficiencia temporal**

En la implementación basada en arreglos, tanto las operaciones push como pop ocurren en memoria contigua preasignada, lo que tiene buena localidad de caché y, por lo tanto, mayor eficiencia. Sin embargo, si la operación push excede la capacidad del arreglo, se activa un mecanismo de redimensionamiento, lo que hace que la complejidad temporal de esa operación push sea $O(n)$.

En la implementación de lista enlazada, la expansión de la lista es muy flexible y no hay problemas de disminución de la eficiencia como en la expansión de arreglos. Sin embargo, la operación push requiere inicializar un objeto nodo y modificar punteros, por lo que su eficiencia es relativamente menor. Si los elementos que se empujan ya son objetos nodo, se puede omitir el paso de inicialización, lo que mejora la eficiencia.

Por lo tanto, cuando los elementos para las operaciones push y pop son tipos de datos básicos como `int` o `double`, podemos sacar las siguientes conclusiones:

- La eficiencia de la implementación de pila basada en arreglos disminuye durante la expansión, pero dado que la expansión es una operación de baja frecuencia, su eficiencia promedio es mayor.
- La implementación de pila basada en lista enlazada proporciona un rendimiento de eficiencia más estable.

**Eficiencia espacial**

Al inicializar una lista, el sistema asigna una "capacidad inicial", que podría exceder la necesidad real; además, el mecanismo de expansión generalmente aumenta la capacidad por un factor específico (como duplicar), lo que también puede exceder la necesidad real. Por lo tanto, **la pila basada en arreglos podría desperdiciar algo de espacio**.

Sin embargo, dado que los nodos de la lista enlazada requieren espacio adicional para almacenar punteros, **el espacio ocupado por los nodos de la lista enlazada es relativamente mayor**.

En resumen, no podemos simplemente determinar qué implementación es más eficiente en memoria. Requiere un análisis basado en circunstancias específicas.

## Aplicaciones típicas de la pila

-   **Atrás y adelante en navegadores, deshacer y rehacer en software**. Cada vez que abrimos una nueva página web, el navegador empuja la página anterior a la pila, lo que nos permite volver a la página anterior a través de la operación de retroceso, que es esencialmente una operación pop. Para admitir tanto el retroceso como el avance, se necesitan dos pilas para trabajar juntas.
-   **Gestión de memoria en programas**. Cada vez que se llama a una función, el sistema agrega un marco de pila en la parte superior de la pila para registrar la información de contexto de la función. En las funciones recursivas, la fase de recursión descendente sigue empujando a la pila, mientras que la fase de retroceso ascendente sigue sacando de la pila.

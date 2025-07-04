# Lista

Una <u>lista</u> es un concepto de estructura de datos abstracta que representa una colección ordenada de elementos, que admite operaciones como acceso, modificación, adición, eliminación y recorrido de elementos, sin requerir que los usuarios consideren las limitaciones de capacidad. Las listas se pueden implementar basándose en listas enlazadas o arreglos.

- Una lista enlazada sirve inherentemente como una lista, admitiendo operaciones para agregar, eliminar, buscar y modificar elementos, con la flexibilidad de ajustar dinámicamente su tamaño.
- Los arreglos también admiten estas operaciones, pero debido a su longitud inmutable, pueden considerarse como una lista con un límite de longitud.

Al implementar listas usando arreglos, **la inmutabilidad de la longitud reduce la practicidad de la lista**. Esto se debe a que predecir la cantidad de datos a almacenar con anticipación a menudo es un desafío, lo que dificulta la elección de una longitud de lista adecuada. Si la longitud es demasiado pequeña, es posible que no cumpla con los requisitos; si es demasiado grande, puede desperdiciar espacio de memoria.

Para resolver este problema, podemos implementar listas usando un <u>arreglo dinámico</u>. Hereda las ventajas de los arreglos y puede expandirse dinámicamente durante la ejecución del programa.

De hecho, **muchas bibliotecas estándar de lenguajes de programación implementan listas usando arreglos dinámicos**, como `list` de Python, `ArrayList` de Java, `vector` de C++ y `List` de C#. En la siguiente discusión, consideraremos "lista" y "arreglo dinámico" como conceptos sinónimos.

## Operaciones comunes de lista

### Inicialización de una lista

Normalmente utilizamos dos métodos de inicialización: "sin valores iniciales" y "con valores iniciales".

=== "Python"

    ```python title="list.py"
    # Inicializar lista
    # Sin valores iniciales
    nums1: list[int] = []
    # Con valores iniciales
    nums: list[int] = [1, 3, 2, 5, 4]
    ```

### Acceso a elementos

Las listas son esencialmente arreglos, por lo que pueden acceder y actualizar elementos en tiempo $O(1)$, lo cual es muy eficiente.

=== "Python"

    ```python title="list.py"
    # Acceder a elementos
    num: int = nums[1]  # Acceder al elemento en el índice 1

    # Actualizar elementos
    nums[1] = 0    # Actualizar el elemento en el índice 1 a 0
    ```

### Inserción y eliminación de elementos

En comparación con los arreglos, las listas ofrecen más flexibilidad para agregar y eliminar elementos. Si bien agregar elementos al final de una lista es una operación de $O(1)$, la eficiencia de insertar y eliminar elementos en otras partes de la lista sigue siendo la misma que en los arreglos, con una complejidad temporal de $O(n)$.

=== "Python"

    ```python title="list.py"
    # Limpiar lista
    nums.clear()

    # Agregar elementos al final
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)

    # Insertar elemento en el medio
    nums.insert(3, 6)  # Insertar el número 6 en el índice 3

    # Eliminar elementos
    nums.pop(3)        # Eliminar el elemento en el índice 3
    ```

### Iteración de la lista

Similar a los arreglos, las listas se pueden iterar utilizando índices o iterando directamente a través de cada elemento.

=== "Python"

    ```python title="list.py"
    # Iterar a través de la lista por índice
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # Iterar directamente a través de los elementos de la lista
    for num in nums:
        count += num
    ```

### Concatenación de listas

Dada una nueva lista `nums1`, podemos agregarla al final de la lista original.

=== "Python"

    ```python title="list.py"
    # Concatenar dos listas
    nums1: list[int] = [6, 8, 7, 10, 9]
    nums += nums1  # Concatenar nums1 al final de nums
    ```

### Ordenar la lista

Una vez que la lista está ordenada, podemos emplear algoritmos comúnmente utilizados en problemas de algoritmos relacionados con arreglos, como la "búsqueda binaria" y los algoritmos de "dos punteros".

=== "Python"

    ```python title="list.py"
    # Ordenar la lista
    nums.sort()  # Después de ordenar, los elementos de la lista están en orden ascendente
    ```

## Implementación de listas

Muchos lenguajes de programación vienen con listas incorporadas, incluidos Java, C++, Python, etc. Sus implementaciones tienden a ser intrincadas, con configuraciones cuidadosamente consideradas para varios parámetros, como la capacidad inicial y los factores de expansión. Los lectores curiosos pueden profundizar en el código fuente para seguir aprendiendo.

Para mejorar nuestra comprensión de cómo funcionan las listas, intentaremos implementar una versión simplificada de una lista, centrándonos en tres aspectos cruciales del diseño:

-   **Capacidad inicial**: Elija una capacidad inicial razonable para el arreglo. En este ejemplo, elegimos 10 como capacidad inicial.
-   **Registro de tamaño**: Declare una variable `size` para registrar el número actual de elementos en la lista, actualizándose en tiempo real con la inserción y eliminación de elementos. Con esta variable, podemos localizar el final de la lista y determinar si es necesaria la expansión.
-   **Mecanismo de expansión**: Si la lista alcanza su capacidad máxima al insertar un elemento, se requiere un proceso de expansión. Esto implica crear un arreglo más grande basándose en el factor de expansión y luego transferir todos los elementos del arreglo actual al nuevo. En este ejemplo, estipulamos que el tamaño del arreglo debe duplicarse con cada expansión.

```src
[file]{my_list}-[class]{my_list}-[func]{}
```

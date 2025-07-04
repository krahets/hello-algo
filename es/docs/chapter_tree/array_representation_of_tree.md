# Representación de árboles binarios en arreglos

Bajo la representación de lista enlazada, la unidad de almacenamiento de un árbol binario es un nodo `TreeNode`, con nodos conectados por punteros. Las operaciones básicas de los árboles binarios bajo la representación de lista enlazada se introdujeron en la sección anterior.

Entonces, ¿podemos usar un arreglo para representar un árbol binario? La respuesta es sí.

## Representación de árboles binarios perfectos

Analicemos primero un caso simple. Dado un árbol binario perfecto, almacenamos todos los nodos en un arreglo de acuerdo con el orden de recorrido por niveles, donde cada nodo corresponde a un índice de arreglo único.

Basándonos en las características del recorrido por niveles, podemos deducir una "fórmula de mapeo" entre el índice de un nodo padre y sus hijos: **Si el índice de un nodo es $i$, entonces el índice de su hijo izquierdo es $2i + 1$ y el de su hijo derecho es $2i + 2$**. La siguiente figura muestra la relación de mapeo entre los índices de varios nodos.

![Representación de un árbol binario perfecto en un arreglo](array_representation_of_tree.assets/array_representation_binary_tree.png)

**La fórmula de mapeo juega un papel similar a las referencias de nodo (punteros) en las listas enlazadas**. Dado cualquier nodo en el arreglo, podemos acceder a su nodo hijo izquierdo (derecho) usando la fórmula de mapeo.

## Representación de cualquier árbol binario

Los árboles binarios perfectos son un caso especial; a menudo hay muchos valores `None` en los niveles intermedios de un árbol binario. Dado que la secuencia de recorrido por niveles no incluye estos valores `None`, no podemos confiar únicamente en esta secuencia para deducir el número y la distribución de los valores `None`. **Esto significa que múltiples estructuras de árboles binarios pueden coincidir con la misma secuencia de recorrido por niveles**.

Como se muestra en la figura a continuación, dado un árbol binario no perfecto, el método anterior de representación de arreglos falla.

![La secuencia de recorrido por niveles corresponde a múltiples posibilidades de árboles binarios](array_representation_of_tree.assets/array_representation_without_empty.png)

Para resolver este problema, **podemos considerar escribir explícitamente todos los valores `None` en la secuencia de recorrido por niveles**. Como se muestra en la figura a continuación, después de este tratamiento, la secuencia de recorrido por niveles puede representar de forma única un árbol binario. El código de ejemplo es el siguiente:

=== "Python"

    ```python title=""
    # Representación de un árbol binario en un arreglo
    # Usando None para representar espacios vacíos
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

![Representación de cualquier tipo de árbol binario en un arreglo](array_representation_of_tree.assets/array_representation_with_empty.png)

Cabe señalar que **los árboles binarios completos son muy adecuados para la representación en arreglos**. Recordando la definición de un árbol binario completo, `None` aparece solo en el nivel inferior y hacia la derecha, **lo que significa que todos los valores `None` aparecen definitivamente al final de la secuencia de recorrido por niveles**.

Esto significa que al usar un arreglo para representar un árbol binario completo, es posible omitir el almacenamiento de todos los valores `None`, lo cual es muy conveniente. La figura a continuación muestra un ejemplo.

![Representación de un árbol binario completo en un arreglo](array_representation_of_tree.assets/array_representation_complete_binary_tree.png)

El siguiente código implementa un árbol binario basado en la representación de arreglos, incluyendo las siguientes operaciones:

-   Dado un nodo, obtener su valor, nodo hijo izquierdo (derecho) y nodo padre.
-   Obtener las secuencias de recorrido en preorden, inorden, postorden y por niveles.

```src
[file]{array_binary_tree}-[class]{array_binary_tree}-[func]{}
```

## Ventajas y limitaciones

La representación de árboles binarios en arreglos tiene las siguientes ventajas:

-   Los arreglos se almacenan en espacios de memoria contiguos, lo que es amigable con la caché y permite un acceso y recorrido más rápidos.
-   No requiere almacenar punteros, lo que ahorra espacio.
-   Permite el acceso aleatorio a los nodos.

Sin embargo, la representación de arreglos también tiene algunas limitaciones:

-   El almacenamiento en arreglos requiere un espacio de memoria contiguo, por lo que no es adecuado para almacenar árboles con una gran cantidad de datos.
-   Agregar o eliminar nodos requiere operaciones de inserción y eliminación de arreglos, que son menos eficientes.
-   Cuando hay muchos valores `None` en el árbol binario, la proporción de datos de nodos contenidos en el arreglo es baja, lo que lleva a una menor utilización del espacio.

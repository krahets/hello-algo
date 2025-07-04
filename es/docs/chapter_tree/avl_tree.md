# Árbol AVL *

En la sección "Árbol de búsqueda binaria", mencionamos que después de múltiples inserciones y eliminaciones, un árbol de búsqueda binaria podría degenerar en una lista enlazada. En tales casos, la complejidad temporal de todas las operaciones se degrada de $O(\log n)$ a $O(n)$.

Como se muestra en la figura a continuación, después de dos operaciones de eliminación de nodos, este árbol de búsqueda binaria degenerará en una lista enlazada.

![Degradación de un árbol AVL después de eliminar nodos](avl_tree.assets/avltree_degradation_from_removing_node.png)

Por ejemplo, en el árbol binario perfecto que se muestra en la figura a continuación, después de insertar dos nodos, el árbol se inclinará fuertemente hacia la izquierda y la complejidad temporal de las operaciones de búsqueda también se degradará.

![Degradación de un árbol AVL después de insertar nodos](avl_tree.assets/avltree_degradation_from_inserting_node.png)

En 1962, G. M. Adelson-Velsky y E. M. Landis propusieron el <u>Árbol AVL</u> en su artículo "Un algoritmo para la organización de la información". El artículo detallaba una serie de operaciones para asegurar que, después de añadir y eliminar nodos continuamente, el árbol AVL no se degradaría, manteniendo así la complejidad temporal de varias operaciones en el nivel $O(\log n)$. En otras palabras, en escenarios donde se necesitan inserciones, eliminaciones, búsquedas y modificaciones frecuentes, el árbol AVL siempre puede mantener un rendimiento eficiente de las operaciones de datos, lo que tiene un gran valor de aplicación.

## Terminología común en árboles AVL

Un árbol AVL es tanto un árbol de búsqueda binaria como un árbol binario equilibrado, satisfaciendo todas las propiedades de estos dos tipos de árboles binarios, por lo tanto, es un <u>árbol de búsqueda binaria equilibrado</u>.

### Altura del nodo

Dado que las operaciones relacionadas con los árboles AVL requieren obtener las alturas de los nodos, necesitamos agregar una variable `height` a la clase de nodo:

=== "Python"

    ```python title=""
    class TreeNode:
        """Nodo de árbol AVL"""
        def __init__(self, val: int):
            self.val: int = val                 # Valor del nodo
            self.height: int = 0                # Altura del nodo
            self.left: TreeNode | None = None   # Referencia al hijo izquierdo
            self.right: TreeNode | None = None  # Referencia al hijo derecho
    ```

La "altura del nodo" se refiere a la distancia desde ese nodo hasta su nodo hoja más lejano, es decir, el número de "aristas" pasadas. Es importante tener en cuenta que la altura de un nodo hoja es $0$, y la altura de un nodo nulo es $-1$. Crearemos dos funciones de utilidad para obtener y actualizar la altura de un nodo:

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{update_height}
```

### Factor de equilibrio del nodo

El <u>factor de equilibrio</u> de un nodo se define como la altura del subárbol izquierdo del nodo menos la altura de su subárbol derecho, con el factor de equilibrio de un nodo nulo definido como $0$. También encapsularemos la funcionalidad de obtener el factor de equilibrio del nodo en una función para facilitar su uso posterior:

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{balance_factor}
```

!!! tip

    Sea $f$ el factor de equilibrio, entonces el factor de equilibrio de cualquier nodo en un árbol AVL satisface $-1 \le f \le 1$.

## Rotaciones en árboles AVL

La característica distintiva de un árbol AVL es la operación de "rotación", que puede restaurar el equilibrio a un nodo desequilibrado sin afectar la secuencia de recorrido en orden del árbol binario. En otras palabras, **la operación de rotación puede mantener la propiedad de un "árbol de búsqueda binaria" al mismo tiempo que convierte el árbol de nuevo en un "árbol binario equilibrado"**.

Llamamos "nodos desequilibrados" a los nodos con un factor de equilibrio absoluto $> 1$. Dependiendo del tipo de desequilibrio, existen cuatro tipos de rotaciones: rotación a la derecha, rotación a la izquierda, rotación derecha-izquierda y rotación izquierda-derecha. A continuación, detallamos estas operaciones de rotación.

### Rotación a la derecha

Como se muestra en la figura a continuación, el primer nodo desequilibrado de abajo hacia arriba en el árbol binario es el "nodo 3". Centrándose en el subárbol con este nodo desequilibrado como raíz, denotado como `node`, y su hijo izquierdo como `child`, realice una "rotación a la derecha". Después de la rotación a la derecha, el subárbol vuelve a estar equilibrado mientras mantiene las propiedades de un árbol de búsqueda binaria.

=== "<1>"
    ![Pasos de la rotación a la derecha](avl_tree.assets/avltree_right_rotate_step1.png)

=== "<2>"
    ![avltree_right_rotate_step2](avl_tree.assets/avltree_right_rotate_step2.png)

=== "<3>"
    ![avltree_right_rotate_step3](avl_tree.assets/avltree_right_rotate_step3.png)

=== "<4>"
    ![avltree_right_rotate_step4](avl_tree.assets/avltree_right_rotate_step4.png)

Como se muestra en la figura a continuación, cuando el nodo `child` tiene un hijo derecho (denotado como `grand_child`), se debe agregar un paso en la rotación a la derecha: establecer `grand_child` como el hijo izquierdo de `node`.

![Rotación a la derecha con grand_child](avl_tree.assets/avltree_right_rotate_with_grandchild.png)

La "rotación a la derecha" es un término figurado; en la práctica, se logra modificando los punteros de los nodos, como se muestra en el siguiente código:

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{right_rotate}
```

### Rotación a la izquierda

Correspondientemente, si consideramos el "espejo" del árbol binario desequilibrado anterior, se debe realizar la operación de "rotación a la izquierda" que se muestra en la figura a continuación.

![Operación de rotación a la izquierda](avl_tree.assets/avltree_left_rotate.png)

De manera similar, como se muestra en la figura a continuación, cuando el nodo `child` tiene un hijo izquierdo (denotado como `grand_child`), se debe agregar un paso en la rotación a la izquierda: establecer `grand_child` como el hijo derecho de `node`.

![Rotación a la izquierda con grand_child](avl_tree.assets/avltree_left_rotate_with_grandchild.png)

Se puede observar que **las operaciones de rotación a la derecha y a la izquierda son lógicamente simétricas, y resuelven dos tipos simétricos de desequilibrio**. Basándose en la simetría, al reemplazar todos los `left` con `right` y todos los `right` con `left` en el código de implementación de la rotación a la derecha, podemos obtener el código de implementación para la rotación a la izquierda:

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{left_rotate}
```

### Rotación izquierda-derecha

Para el nodo desequilibrado 3 que se muestra en la figura a continuación, el uso de la rotación izquierda o derecha por sí solo no puede restaurar el equilibrio al subárbol. En este caso, primero se debe realizar una "rotación a la izquierda" en `child`, seguida de una "rotación a la derecha" en `node`.

![Rotación izquierda-derecha](avl_tree.assets/avltree_left_right_rotate.png)

### Rotación derecha-izquierda

Como se muestra en la figura a continuación, para el caso espejo del árbol binario desequilibrado anterior, primero se debe realizar una "rotación a la derecha" en `child`, seguida de una "rotación a la izquierda" en `node`.

![Rotación derecha-izquierda](avl_tree.assets/avltree_right_left_rotate.png)

### Elección de la rotación

Los cuatro tipos de desequilibrios que se muestran en la figura a continuación corresponden a los casos descritos anteriormente, que requieren respectivamente rotación a la derecha, rotación izquierda-derecha, rotación derecha-izquierda y rotación a la izquierda.

![Los cuatro casos de rotación del árbol AVL](avl_tree.assets/avltree_rotation_cases.png)

Como se muestra en la tabla a continuación, determinamos a cuál de los casos anteriores pertenece un nodo desequilibrado juzgando el signo del factor de equilibrio del nodo desequilibrado y el factor de equilibrio de su hijo de lado superior.

<p align="center"> Tabla <id> &nbsp; Condiciones para elegir entre los cuatro casos de rotación </p>

| Factor de equilibrio del nodo desequilibrado | Factor de equilibrio del nodo hijo | Método de rotación a utilizar            |
| --------------------------------- | ---------------------------- | --------------------------------- |
| $> 1$ (Árbol inclinado a la izquierda)         | $\geq 0$                     | Rotación a la derecha                    |
| $> 1$ (Árbol inclinado a la izquierda)         | $<0$                         | Rotación a la izquierda y luego a la derecha |
| $< -1$ (Árbol inclinado a la derecha)       | $\leq 0$                     | Rotación a la izquierda                     |
| $< -1$ (Árbol inclinado a la derecha)       | $>0$                         | Rotación a la derecha y luego a la izquierda |

Para mayor comodidad, encapsulamos las operaciones de rotación en una función. **Con esta función, podemos realizar rotaciones en varios tipos de desequilibrios, restaurando el equilibrio a los nodos desequilibrados**. El código es el siguiente:

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{rotate}
```

## Operaciones comunes en árboles AVL

### Inserción de nodos

La operación de inserción de nodos en árboles AVL es similar a la de los árboles de búsqueda binaria. La única diferencia es que después de insertar un nodo en un árbol AVL, puede aparecer una serie de nodos desequilibrados a lo largo de la ruta desde ese nodo hasta el nodo raíz. Por lo tanto, **necesitamos comenzar desde este nodo y realizar operaciones de rotación hacia arriba para restaurar el equilibrio a todos los nodos desequilibrados**. El código es el siguiente:

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{insert_helper}
```

### Eliminación de nodos

De manera similar, basándose en el método de eliminación de nodos en árboles de búsqueda binaria, es necesario realizar operaciones de rotación de abajo hacia arriba para restaurar el equilibrio a todos los nodos desequilibrados. El código es el siguiente:

```src
[file]{avl_tree}-[class]{avl_tree}-[func]{remove_helper}
```

### Búsqueda de nodos

La operación de búsqueda de nodos en árboles AVL es consistente con la de los árboles de búsqueda binaria y no se detallará aquí.

## Aplicaciones típicas de los árboles AVL

-   Organización y almacenamiento de grandes cantidades de datos, adecuado para escenarios con búsquedas de alta frecuencia e inserciones y eliminaciones de baja frecuencia.
-   Se utiliza para construir sistemas de índices en bases de datos.
-   Los árboles rojo-negro también son un tipo común de árbol de búsqueda binaria equilibrado. En comparación con los árboles AVL, los árboles rojo-negro tienen condiciones de equilibrio más relajadas, requieren menos rotaciones para la inserción y eliminación de nodos, y tienen una mayor eficiencia promedio para las operaciones de adición y eliminación de nodos.

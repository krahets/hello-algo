# Árbol binario

Un <u>árbol binario</u> es una estructura de datos no lineal que representa la relación jerárquica entre ancestros y descendientes y encarna la lógica de divide y vencerás de "dividir en dos". Similar a una lista enlazada, la unidad básica de un árbol binario es un nodo, y cada nodo contiene un valor, una referencia a su nodo hijo izquierdo y una referencia a su nodo hijo derecho.

=== "Python"

    ```python title=""
    class TreeNode:
        """Nodo de árbol binario"""
        def __init__(self, val: int):
            self.val: int = val                # Valor del nodo
            self.left: TreeNode | None = None  # Referencia al nodo hijo izquierdo
            self.right: TreeNode | None = None # Referencia al nodo hijo derecho
    ```

Cada nodo tiene dos referencias (punteros), que apuntan respectivamente al <u>nodo hijo izquierdo</u> y al <u>nodo hijo derecho</u>. Este nodo se denomina <u>nodo padre</u> de estos dos nodos hijos. Cuando se da un nodo de un árbol binario, llamamos al árbol formado por el hijo izquierdo de este nodo y todos los nodos debajo de él el <u>subárbol izquierdo</u> de este nodo. De manera similar, se puede definir el <u>subárbol derecho</u>.

**En un árbol binario, excepto los nodos hoja, todos los demás nodos contienen nodos hijos y subárboles no vacíos.** Como se muestra en la figura a continuación, si el "Nodo 2" se considera un nodo padre, sus nodos hijos izquierdo y derecho son "Nodo 4" y "Nodo 5" respectivamente. El subárbol izquierdo está formado por el "Nodo 4" y todos los nodos debajo de él, mientras que el subárbol derecho está formado por el "Nodo 5" y todos los nodos debajo de él.

![Nodo padre, nodo hijo, subárbol](binary_tree.assets/binary_tree_definition.png)

## Terminología común de los árboles binarios

La terminología comúnmente utilizada de los árboles binarios se muestra en la figura a continuación.

-   <u>Nodo raíz</u>: El nodo en el nivel superior de un árbol binario, que no tiene un nodo padre.
-   <u>Nodo hoja</u>: Un nodo que no tiene ningún nodo hijo, con ambos punteros apuntando a `None`.
-   <u>Arista</u>: Un segmento de línea que conecta dos nodos, que representa una referencia (puntero) entre los nodos.
-   El <u>nivel</u> de un nodo: Aumenta de arriba a abajo, siendo el nodo raíz el nivel 1.
-   El <u>grado</u> de un nodo: El número de nodos hijos que tiene un nodo. En un árbol binario, el grado puede ser 0, 1 o 2.
-   La <u>altura</u> de un árbol binario: El número de aristas desde el nodo raíz hasta el nodo hoja más lejano.
-   La <u>profundidad</u> de un nodo: El número de aristas desde el nodo raíz hasta el nodo.
-   La <u>altura</u> de un nodo: El número de aristas desde el nodo hoja más lejano hasta el nodo.

![Terminología común de los árboles binarios](binary_tree.assets/binary_tree_terminology.png)

!!! tip

    Tenga en cuenta que normalmente definimos "altura" y "profundidad" como "el número de aristas recorridas", pero algunas preguntas o libros de texto pueden definirlas como "el número de nodos recorridos". En este caso, tanto la altura como la profundidad deben incrementarse en 1.

## Operaciones básicas de los árboles binarios

### Inicialización de un árbol binario

Similar a una lista enlazada, la inicialización de un árbol binario implica primero crear los nodos y luego establecer las referencias (punteros) entre ellos.

=== "Python"

    ```python title="binary_tree.py"
    # Inicializando un árbol binario
    # Inicializando nodos
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # Enlazando referencias (punteros) entre nodos
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

### Inserción y eliminación de nodos

Similar a una lista enlazada, la inserción y eliminación de nodos en un árbol binario se puede lograr modificando punteros. La figura a continuación proporciona un ejemplo.

![Inserción y eliminación de nodos en un árbol binario](binary_tree.assets/binary_tree_add_remove.png)

=== "Python"

    ```python title="binary_tree.py"
    # Insertar y eliminar nodos
    p = TreeNode(0)
    # Insertar nodo P entre n1 -> n2
    n1.left = p
    p.left = n2
    # Eliminar nodo P
    n1.left = n2
    ```

!!! tip

    Cabe señalar que la inserción de nodos puede cambiar la estructura lógica original del árbol binario, mientras que la eliminación de nodos generalmente implica la eliminación del nodo y todos sus subárboles. Por lo tanto, en un árbol binario, la inserción y eliminación generalmente se realizan a través de un conjunto de operaciones para lograr resultados significativos.

## Tipos comunes de árboles binarios

### Árbol binario perfecto

Como se muestra en la figura a continuación, en un <u>árbol binario perfecto</u>, todos los niveles están completamente llenos de nodos. En un árbol binario perfecto, los nodos hoja tienen un grado de $0$, mientras que todos los demás nodos tienen un grado de $2$. El número total de nodos se puede calcular como $2^{h+1} - 1$, donde $h$ es la altura del árbol. Esto exhibe una relación exponencial estándar, lo que refleja el fenómeno común de la división celular en la naturaleza.

!!! tip

    Tenga en cuenta que en la comunidad china, un árbol binario perfecto a menudo se denomina <u>árbol binario completo</u>.

![Árbol binario perfecto](binary_tree.assets/perfect_binary_tree.png)

### Árbol binario completo

Como se muestra en la figura a continuación, un <u>árbol binario completo</u> es un árbol binario donde solo el nivel inferior posiblemente no está completamente lleno, y los nodos en el nivel inferior deben llenarse continuamente de izquierda a derecha. Tenga en cuenta que un árbol binario perfecto también es un árbol binario completo.

![Árbol binario completo](binary_tree.assets/complete_binary_tree.png)

### Árbol binario lleno

Como se muestra en la figura a continuación, un <u>árbol binario lleno</u>, excepto los nodos hoja, tiene dos nodos hijos para todos los demás nodos.

![Árbol binario lleno](binary_tree.assets/full_binary_tree.png)

### Árbol binario equilibrado

Como se muestra en la figura a continuación, en un <u>árbol binario equilibrado</u>, la diferencia absoluta entre la altura de los subárboles izquierdo y derecho de cualquier nodo no excede de 1.

![Árbol binario equilibrado](binary_tree.assets/balanced_binary_tree.png)

## Degeneración de los árboles binarios

La figura a continuación muestra las estructuras ideales y degeneradas de los árboles binarios. Un árbol binario se convierte en un "árbol binario perfecto" cuando cada nivel está lleno; mientras que degenera en una "lista enlazada" cuando todos los nodos están sesgados hacia un lado.

-   Un árbol binario perfecto es un escenario ideal donde se puede utilizar plenamente la ventaja de "divide y vencerás" de un árbol binario.
-   Por otro lado, una lista enlazada representa otro extremo donde todas las operaciones se vuelven lineales, lo que resulta en una complejidad temporal de $O(n)$.

![Las mejores y peores estructuras de árboles binarios](binary_tree.assets/binary_tree_best_worst_cases.png)

Como se muestra en la tabla a continuación, en las mejores y peores estructuras, el árbol binario alcanza valores máximos o mínimos para el recuento de nodos hoja, el número total de nodos y la altura.

<p align="center"> Tabla <id> &nbsp; Las mejores y peores estructuras de árboles binarios </p>

|                                                 | Árbol binario perfecto | Lista enlazada |
| ----------------------------------------------- | ------------------- | ----------- |
| Número de nodos en el nivel $i$                    | $2^{i-1}$           | $1$         |
| Número de nodos hoja en un árbol con altura $h$  | $2^h$               | $1$         |
| Número total de nodos en un árbol con altura $h$ | $2^{h+1} - 1$       | $h + 1$     |
| Altura de un árbol con $n$ nodos totales           | $\log_2 (n+1) - 1$  | $n - 1$     |

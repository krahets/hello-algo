# Recorrido de árboles binarios

Desde una perspectiva de estructura física, un árbol es una estructura de datos basada en listas enlazadas. Por lo tanto, su método de recorrido implica acceder a los nodos uno por uno a través de punteros. Sin embargo, un árbol es una estructura de datos no lineal, lo que hace que recorrer un árbol sea más complejo que recorrer una lista enlazada, lo que requiere la ayuda de algoritmos de búsqueda.

Los métodos de recorrido comunes para árboles binarios incluyen el recorrido por niveles, el recorrido en preorden, el recorrido en inorden y el recorrido en postorden.

## Recorrido por niveles

Como se muestra en la figura a continuación, el <u>recorrido por niveles</u> recorre el árbol binario de arriba a abajo, capa por capa. Dentro de cada nivel, visita los nodos de izquierda a derecha.

El recorrido por niveles es esencialmente un tipo de <u>recorrido en amplitud</u>, también conocido como <u>búsqueda en amplitud (BFS)</u>, que encarna un método de recorrido capa por capa que se expande "circunferencialmente hacia afuera".

![Recorrido por niveles de un árbol binario](binary_tree_traversal.assets/binary_tree_bfs.png)

### Implementación del código

La búsqueda en amplitud se implementa generalmente con la ayuda de una "cola". La cola sigue la regla de "primero en entrar, primero en salir", mientras que la búsqueda en amplitud sigue la regla de "progresión capa por capa", las ideas subyacentes de ambas son consistentes. El código de implementación es el siguiente:

```src
[file]{binary_tree_bfs}-[class]{}-[func]{level_order}
```

### Análisis de complejidad

-   **La complejidad temporal es $O(n)$**: Todos los nodos se visitan una vez, lo que lleva $O(n)$ tiempo, donde $n$ es el número de nodos.
-   **La complejidad espacial es $O(n)$**: En el peor de los casos, es decir, un árbol binario completo, antes de recorrer el nivel inferior, la cola puede contener como máximo $(n + 1) / 2$ nodos simultáneamente, ocupando un espacio de $O(n)$.

## Recorrido en preorden, inorden y postorden

Correspondientemente, el recorrido en preorden, inorden y postorden pertenecen al <u>recorrido en profundidad</u>, también conocido como <u>búsqueda en profundidad (DFS)</u>, que encarna un método de recorrido que "procede hasta el final primero, luego retrocede y continúa".

La siguiente figura muestra el principio de funcionamiento de la realización de un recorrido en profundidad en un árbol binario. **El recorrido en profundidad es como "caminar" alrededor de todo el árbol binario**, encontrando tres posiciones en cada nodo, correspondientes al recorrido en preorden, inorden y postorden.

![Recorrido en preorden, inorden y postorden de un árbol de búsqueda binaria](binary_tree_traversal.assets/binary_tree_dfs.png)

### Implementación del código

La búsqueda en profundidad se implementa generalmente basándose en la recursión:

```src
[file]{binary_tree_dfs}-[class]{}-[func]{post_order}
```

!!! tip

    La búsqueda en profundidad también se puede implementar basándose en la iteración, los lectores interesados pueden estudiarlo por su cuenta.

La siguiente figura muestra el proceso recursivo del recorrido en preorden de un árbol binario, que se puede dividir en dos partes opuestas: "recursión" y "retorno".

1.  "Recursión" significa iniciar un nuevo método, el programa accede al siguiente nodo en este proceso.
2.  "Retorno" significa que la función regresa, lo que indica que el nodo actual ha sido completamente accedido.

=== "<1>"
    ![El proceso recursivo del recorrido en preorden](binary_tree_traversal.assets/preorder_step1.png)

=== "<2>"
    ![preorder_step2](binary_tree_traversal.assets/preorder_step2.png)

=== "<3>"
    ![preorder_step3](binary_tree_traversal.assets/preorder_step3.png)

=== "<4>"
    ![preorder_step4](binary_tree_traversal.assets/preorder_step4.png)

=== "<5>"
    ![preorder_step5](binary_tree_traversal.assets/preorder_step5.png)

=== "<6>"
    ![preorder_step6](binary_tree_traversal.assets/preorder_step6.png)

=== "<7>"
    ![preorder_step7](binary_tree_traversal.assets/preorder_step7.png)

=== "<8>"
    ![preorder_step8](binary_tree_traversal.assets/preorder_step8.png)

=== "<9>"
    ![preorder_step9](binary_tree_traversal.assets/preorder_step9.png)

=== "<10>"
    ![preorder_step10](binary_tree_traversal.assets/preorder_step10.png)

=== "<11>"
    ![preorder_step11](binary_tree_traversal.assets/preorder_step11.png)

### Análisis de complejidad

-   **La complejidad temporal es $O(n)$**: Todos los nodos se visitan una vez, utilizando $O(n)$ tiempo.
-   **La complejidad espacial es $O(n)$**: En el peor de los casos, es decir, el árbol degenera en una lista enlazada, la profundidad de recursión alcanza $n$, el sistema ocupa un espacio de marco de pila de $O(n)$.

# Problema de construcción de un árbol binario

!!! question

    Dadas las secuencias de recorrido en preorden `preorder` y de recorrido en inorden `inorder` de un árbol binario, construya el árbol binario y devuelva su nodo raíz. Suponga que no hay valores de nodo duplicados en el árbol binario (como se muestra en la figura a continuación).

![Datos de ejemplo para construir un árbol binario](build_binary_tree_problem.assets/build_tree_example.png)

### Determinación de si es un problema de divide y vencerás

El problema original de construir un árbol binario a partir de las secuencias `preorder` e `inorder` es un problema típico de divide y vencerás.

-   **El problema se puede descomponer**: Desde la perspectiva de divide y vencerás, podemos dividir el problema original en dos subproblemas —construir el subárbol izquierdo y construir el subárbol derecho— más una operación de inicialización del nodo raíz. Para cada subárbol (subproblema), continuamos aplicando el mismo enfoque, dividiéndolo en subárboles más pequeños (subproblemas), hasta llegar al subproblema más pequeño (un subárbol vacío).
-   **Los subproblemas son independientes**: Los subárboles izquierdo y derecho no se superponen. Al construir el subárbol izquierdo, solo necesitamos los segmentos de los recorridos en inorden y preorden que corresponden al subárbol izquierdo. El mismo enfoque se aplica al subárbol derecho.
-   **Las soluciones a los subproblemas se pueden combinar**: Una vez que hemos construido los subárboles izquierdo y derecho (las soluciones de los subproblemas), podemos adjuntarlos al nodo raíz para obtener la solución al problema original.

### Cómo dividir los subárboles

Basándonos en el análisis anterior, este problema se puede resolver utilizando divide y vencerás. **Sin embargo, ¿cómo usamos la secuencia de recorrido en preorden `preorder` y la secuencia de recorrido en inorden `inorder` para dividir los subárboles izquierdo y derecho?**

Por definición, tanto las secuencias `preorder` como `inorder` se pueden dividir en tres partes:

-   Recorrido en preorden: `[ Raíz | Subárbol izquierdo | Subárbol derecho ]`. Por ejemplo, en la figura, el árbol corresponde a `[ 3 | 9 | 2 1 7 ]`.
-   Recorrido en inorden: `[ Subárbol izquierdo | Raíz | Subárbol derecho ]`. Por ejemplo, en la figura, el árbol corresponde a `[ 9 | 3 | 1 2 7 ]`.

Usando los datos de la figura anterior, podemos seguir los pasos que se muestran en la siguiente figura para obtener los resultados de la división:

1.  El primer elemento 3 en el recorrido en preorden es el valor del nodo raíz.
2.  Encuentre el índice del nodo raíz 3 en la secuencia `inorder`, y use este índice para dividir `inorder` en `[ 9 | 3 ｜ 1 2 7 ]`.
3.  Según la división de la secuencia `inorder`, es sencillo determinar que los subárboles izquierdo y derecho contienen 1 y 3 nodos, respectivamente, por lo que podemos dividir la secuencia `preorder` en `[ 3 | 9 | 2 1 7 ]` en consecuencia.

![Dividiendo los subárboles en recorridos en preorden y en inorden](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png)

### Descripción de los rangos de subárboles basada en variables

Basándonos en el método de división anterior, **hemos obtenido los rangos de índices de la raíz, el subárbol izquierdo y el subárbol derecho en las secuencias `preorder` e `inorder`**. Para describir estos rangos de índices, utilizamos varias variables de puntero.

-   Sea el índice del nodo raíz del árbol actual en la secuencia `preorder` denotado como $i$.
-   Sea el índice del nodo raíz del árbol actual en la secuencia `inorder` denotado como $m$.
-   Sea el rango de índices del árbol actual en la secuencia `inorder` denotado como $[l, r]$.

Como se muestra en la tabla a continuación, estas variables representan el índice del nodo raíz en la secuencia `preorder` y los rangos de índices de los subárboles en la secuencia `inorder`.

<p align="center"> Tabla <id> &nbsp; Índices del nodo raíz y subárboles en recorridos en preorden y en inorden </p>

|               | Índice del nodo raíz en `preorder` | Rango de índices del subárbol en `inorder`    |
| ------------- | ----------------------------- | ----------------------------------- |
| Árbol actual  | $i$                           | $[l, r]$                            |
| Subárbol izquierdo  | $i + 1$                       | $[l, m-1]$                          |
| Subárbol derecho | $i + 1 + (m - l)$             | $[m+1, r]$                          |

Tenga en cuenta que $(m-l)$ en el índice de la raíz del subárbol derecho representa "el número de nodos en el subárbol izquierdo". Puede ser útil consultar la figura a continuación para una comprensión más clara.

![Índices del nodo raíz y de los subárboles izquierdo y derecho](build_binary_tree_problem.assets/build_tree_division_pointers.png)

### Implementación del código

Para mejorar la eficiencia de la consulta de $m$, utilizamos una tabla hash `hmap` para almacenar el mapeo de los elementos en la secuencia `inorder` a sus índices:

```src
[file]{build_tree}-[class]{}-[func]{build_tree}
```

La figura a continuación muestra el proceso recursivo de construcción del árbol binario. Cada nodo se crea durante la fase de "descenso" de la recursión, y cada arista (referencia) se forma durante la fase de "ascenso".

=== "<1>"
    ![Proceso recursivo de construcción de un árbol binario](build_binary_tree_problem.assets/built_tree_step1.png)

=== "<2>"
    ![built_tree_step2](build_binary_tree_problem.assets/built_tree_step2.png)

=== "<3>"
    ![built_tree_step3](build_binary_tree_problem.assets/built_tree_step3.png)

=== "<4>"
    ![built_tree_step4](build_binary_tree_problem.assets/built_tree_step4.png)

=== "<5>"
    ![built_tree_step5](build_binary_tree_problem.assets/built_tree_step5.png)

=== "<6>"
    ![built_tree_step6](build_binary_tree_problem.assets/built_tree_step6.png)

=== "<7>"
    ![built_tree_step7](build_binary_tree_problem.assets/built_tree_step7.png)

=== "<8>"
    ![built_tree_step8](build_binary_tree_problem.assets/built_tree_step8.png)

=== "<9>"
    ![built_tree_step9](build_binary_tree_problem.assets/built_tree_step9.png)

La división de las secuencias `preorder` e `inorder` de cada función recursiva se ilustra en la figura a continuación.

![División en cada función recursiva](build_binary_tree_problem.assets/built_tree_overall.png)

Suponiendo que el árbol binario tiene $n$ nodos, la inicialización de cada nodo (llamando a la función recursiva `dfs()`) toma tiempo $O(1)$. **Por lo tanto, la complejidad temporal general es $O(n)$**.

Debido a que la tabla hash almacena el mapeo de los elementos `inorder` a sus índices, requiere espacio $O(n)$. En el peor de los casos, si el árbol binario degenera en una lista enlazada, la profundidad recursiva puede alcanzar $n$, consumiendo espacio de pila $O(n)$. **Por lo tanto, la complejidad espacial general es $O(n)$**.

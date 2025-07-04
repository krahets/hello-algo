# Operaciones básicas en grafos

Las operaciones básicas en grafos se pueden dividir en operaciones sobre "aristas" y operaciones sobre "vértices". Bajo los dos métodos de representación de "matriz de adyacencia" y "lista de adyacencia", las implementaciones son diferentes.

## Implementación basada en matriz de adyacencia

Dado un grafo no dirigido con $n$ vértices, las diversas operaciones se implementan como se muestra en la figura a continuación.

-   **Agregar o eliminar una arista**: Modifique directamente la arista especificada en la matriz de adyacencia, utilizando tiempo $O(1)$. Dado que es un grafo no dirigido, es necesario actualizar las aristas en ambas direcciones simultáneamente.
-   **Agregar un vértice**: Agregue una fila y una columna al final de la matriz de adyacencia y rellénelas todas con $0$s, utilizando tiempo $O(n)$.
-   **Eliminar un vértice**: Elimine una fila y una columna en la matriz de adyacencia. El peor caso es cuando se eliminan la primera fila y columna, lo que requiere que $(n-1)^2$ elementos se "muevan hacia arriba y hacia la izquierda", utilizando así tiempo $O(n^2)$.
-   **Inicialización**: Pase $n$ vértices, inicialice una lista de vértices `vertices` de longitud $n$, utilizando tiempo $O(n)$; inicialice una matriz de adyacencia `adjMat` de tamaño $n \times n$, utilizando tiempo $O(n^2)$.

=== "Inicializar matriz de adyacencia"
    ![Inicialización, adición y eliminación de aristas, adición y eliminación de vértices en la matriz de adyacencia](graph_operations.assets/adjacency_matrix_step1_initialization.png)

=== "Agregar una arista"
    ![adjacency_matrix_add_edge](graph_operations.assets/adjacency_matrix_step2_add_edge.png)

=== "Eliminar una arista"
    ![adjacency_matrix_remove_edge](graph_operations.assets/adjacency_matrix_step3_remove_edge.png)

=== "Agregar un vértice"
    ![adjacency_matrix_add_vertex](graph_operations.assets/adjacency_matrix_step4_add_vertex.png)

=== "Eliminar un vértice"
    ![adjacency_matrix_remove_vertex](graph_operations.assets/adjacency_matrix_step5_remove_vertex.png)

A continuación se muestra el código de implementación para grafos representados mediante una matriz de adyacencia:

```src
[file]{graph_adjacency_matrix}-[class]{graph_adj_mat}-[func]{}
```

## Implementación basada en lista de adyacencia

Dado un grafo no dirigido con un total de $n$ vértices y $m$ aristas, las diversas operaciones se pueden implementar como se muestra en la figura a continuación.

-   **Agregar una arista**: Simplemente agregue la arista al final de la lista enlazada del vértice correspondiente, utilizando tiempo $O(1)$. Debido a que es un grafo no dirigido, es necesario agregar aristas en ambas direcciones simultáneamente.
-   **Eliminar una arista**: Encuentre y elimine la arista especificada en la lista enlazada del vértice correspondiente, utilizando tiempo $O(m)$. En un grafo no dirigido, es necesario eliminar aristas en ambas direcciones simultáneamente.
-   **Agregar un vértice**: Agregue una lista enlazada en la lista de adyacencia y haga del nuevo vértice el nodo cabeza de la lista, utilizando tiempo $O(1)$.
-   **Eliminar un vértice**: Es necesario recorrer toda la lista de adyacencia, eliminando todas las aristas que incluyen el vértice especificado, utilizando tiempo $O(n + m)$.
-   **Inicialización**: Cree $n$ vértices y $2m$ aristas en la lista de adyacencia, utilizando tiempo $O(n + m)$.

=== "Inicializar lista de adyacencia"
    ![Inicialización, adición y eliminación de aristas, adición y eliminación de vértices en la lista de adyacencia](graph_operations.assets/adjacency_list_step1_initialization.png)

=== "Agregar una arista"
    ![adjacency_list_add_edge](graph_operations.assets/adjacency_list_step2_add_edge.png)

=== "Eliminar una arista"
    ![adjacency_list_remove_edge](graph_operations.assets/adjacency_list_step3_remove_edge.png)

=== "Agregar un vértice"
    ![adjacency_list_add_vertex](graph_operations.assets/adjacency_list_step4_add_vertex.png)

=== "Eliminar un vértice"
    ![adjacency_list_remove_vertex](graph_operations.assets/adjacency_list_step5_remove_vertex.png)

A continuación se muestra la implementación del código de la lista de adyacencia. En comparación con la figura anterior, el código real tiene las siguientes diferencias.

-   Para mayor comodidad al agregar y eliminar vértices, y para simplificar el código, usamos listas (arreglos dinámicos) en lugar de listas enlazadas.
-   Use una tabla hash para almacenar la lista de adyacencia, siendo la `clave` la instancia del vértice, el `valor` la lista (lista enlazada) de vértices adyacentes a ese vértice.

Además, usamos la clase `Vertex` para representar vértices en la lista de adyacencia. La razón de esto es: si, como con la matriz de adyacencia, se usaran índices de lista para distinguir diferentes vértices, entonces supongamos que desea eliminar el vértice en el índice $i$, necesitaría recorrer toda la lista de adyacencia y disminuir todos los índices mayores que $i$ en $1$, lo cual es muy ineficiente. Sin embargo, si cada vértice es una instancia `Vertex` única, entonces eliminar un vértice no requiere ningún cambio en otros vértices.

```src
[file]{graph_adjacency_list}-[class]{graph_adj_list}-[func]{}
```

## Comparación de eficiencia

Suponiendo que hay $n$ vértices y $m$ aristas en el grafo, la siguiente tabla compara la eficiencia temporal y la eficiencia espacial de la matriz de adyacencia y la lista de adyacencia.

<p align="center"> Tabla <id> &nbsp; Comparación de la matriz de adyacencia y la lista de adyacencia </p>

|                     | Matriz de adyacencia | Lista de adyacencia (Lista enlazada) | Lista de adyacencia (Tabla hash) |
| ------------------- | ---------------- | ---------------------------- | --------------------------- |
| Determinar adyacencia | $O(1)$           | $O(m)$                       | $O(1)$                      |
| Agregar una arista         | $O(1)$           | $O(1)$                       | $O(1)$                      |
| Eliminar una arista      | $O(1)$           | $O(m)$                       | $O(1)$                      |
| Agregar un vértice        | $O(n)$           | $O(1)$                       | $O(1)$                      |
| Eliminar un vértice     | $O(n^2)$         | $O(n + m)$                   | $O(n)$                      |
| Uso del espacio de memoria  | $O(n^2)$         | $O(n + m)$                   | $O(n + m)$                  |

Observando la tabla anterior, parece que la lista de adyacencia (tabla hash) tiene la mejor eficiencia temporal y espacial. Sin embargo, en la práctica, operar en aristas en la matriz de adyacencia es más eficiente, requiriendo solo una única operación de acceso o asignación de arreglo. En general, la matriz de adyacencia ejemplifica el principio de "espacio por tiempo", mientras que la lista de adyacencia ejemplifica "tiempo por espacio".

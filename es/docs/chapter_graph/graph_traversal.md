# Recorrido de grafos

Los árboles representan una relación de "uno a muchos", mientras que los grafos tienen un mayor grado de libertad y pueden representar cualquier relación de "muchos a muchos". Por lo tanto, podemos considerar el árbol como un caso especial de grafo. Claramente, **las operaciones de recorrido de árboles también son un caso especial de operaciones de recorrido de grafos**.

Tanto los grafos como los árboles requieren la aplicación de algoritmos de búsqueda para implementar operaciones de recorrido. El recorrido de grafos se puede dividir en dos tipos: <u>Búsqueda en amplitud (BFS)</u> y <u>Búsqueda en profundidad (DFS)</u>.

## Búsqueda en amplitud

**La búsqueda en amplitud es un método de recorrido de cerca a lejos, que comienza desde un cierto nodo, siempre priorizando la visita a los vértices más cercanos y expandiéndose hacia afuera capa por capa**. Como se muestra en la figura a continuación, comenzando desde el vértice superior izquierdo, primero recorra todos los vértices adyacentes a ese vértice, luego recorra todos los vértices adyacentes al siguiente vértice, y así sucesivamente, hasta que todos los vértices hayan sido visitados.

![Recorrido en amplitud de un grafo](graph_traversal.assets/graph_bfs.png)

### Implementación del algoritmo

BFS se implementa generalmente con la ayuda de una cola, como se muestra en el código a continuación. La cola es "primero en entrar, primero en salir", lo que se alinea con la idea de BFS de recorrer "de cerca a lejos".

1.  Agregue el vértice inicial `startVet` a la cola e inicie el bucle.
2.  En cada iteración del bucle, saque el vértice del frente de la cola y regístrelo como visitado, luego agregue todos los vértices adyacentes a ese vértice a la parte trasera de la cola.
3.  Repita el paso `2.` hasta que todos los vértices hayan sido visitados.

Para evitar volver a visitar vértices, usamos un conjunto hash `visited` para registrar qué nodos han sido visitados.

```src
[file]{graph_bfs}-[class]{}-[func]{graph_bfs}
```

El código es relativamente abstracto, puede compararlo con la figura a continuación para comprenderlo mejor.

=== "<1>"
    ![Pasos de la búsqueda en amplitud de un grafo](graph_traversal.assets/graph_bfs_step1.png)

=== "<2>"
    ![graph_bfs_step2](graph_traversal.assets/graph_bfs_step2.png)

=== "<3>"
    ![graph_bfs_step3](graph_traversal.assets/graph_bfs_step3.png)

=== "<4>"
    ![graph_bfs_step4](graph_traversal.assets/graph_bfs_step4.png)

=== "<5>"
    ![graph_bfs_step5](graph_traversal.assets/graph_bfs_step5.png)

=== "<6>"
    ![graph_bfs_step6](graph_traversal.assets/graph_bfs_step6.png)

=== "<7>"
    ![graph_bfs_step7](graph_traversal.assets/graph_bfs_step7.png)

=== "<8>"
    ![graph_bfs_step8](graph_traversal.assets/graph_bfs_step8.png)

=== "<9>"
    ![graph_bfs_step9](graph_traversal.assets/graph_bfs_step9.png)

=== "<10>"
    ![graph_bfs_step10](graph_traversal.assets/graph_bfs_step10.png)

=== "<11>"
    ![graph_bfs_step11](graph_traversal.assets/graph_bfs_step11.png)

!!! question "¿Es única la secuencia de recorrido en amplitud?"

    No es única. El recorrido en amplitud solo requiere recorrer en un orden "de cerca a lejos", **y el orden de recorrido de los vértices con la misma distancia puede ser arbitrario**. Por ejemplo, en la figura anterior, el orden de visita de los vértices $1$ y $3$ se puede intercambiar, al igual que el orden de los vértices $2$, $4$ y $6$.

### Análisis de complejidad

**Complejidad temporal**: Todos los vértices se encolarán y desencolarán una vez, utilizando tiempo $O(|V|)$; en el proceso de recorrer los vértices adyacentes, dado que es un grafo no dirigido, todas las aristas se visitarán $2$ veces, utilizando tiempo $O(2|E|)$; en general, utilizando tiempo $O(|V| + |E|)$.

**Complejidad espacial**: El número máximo de vértices en la lista `res`, el conjunto hash `visited` y la cola `que` es $|V|$, utilizando espacio $O(|V|)$.

## Búsqueda en profundidad

**La búsqueda en profundidad es un método de recorrido que prioriza ir lo más lejos posible y luego retrocede cuando no hay más camino disponible**. Como se muestra en la figura a continuación, comenzando desde el vértice superior izquierdo, visite algún vértice adyacente del vértice actual hasta que no haya más camino disponible, luego regrese y continúe hasta que se recorran todos los vértices.

![Recorrido en profundidad de un grafo](graph_traversal.assets/graph_dfs.png)

### Implementación del algoritmo

Este paradigma de algoritmo de "ir lo más lejos posible y luego regresar" se implementa generalmente basándose en la recursión. Similar a la búsqueda en amplitud, en la búsqueda en profundidad, también necesitamos la ayuda de un conjunto hash `visited` para registrar los vértices visitados y evitar volver a visitarlos.

```src
[file]{graph_dfs}-[class]{}-[func]{graph_dfs}
```

El proceso del algoritmo de búsqueda en profundidad se muestra en la figura a continuación.

-   **Las líneas discontinuas representan la recursión descendente**, lo que indica que se ha iniciado un nuevo método recursivo para visitar un nuevo vértice.
-   **Las líneas discontinuas curvas representan el retroceso ascendente**, lo que indica que este método recursivo ha regresado a la posición donde se inició este método.

Para profundizar la comprensión, se sugiere combinar la figura a continuación con el código para simular (o dibujar) todo el proceso DFS en su mente, incluyendo cuándo se inicia cada método recursivo y cuándo regresa.

=== "<1>"
    ![Pasos de la búsqueda en profundidad de un grafo](graph_traversal.assets/graph_dfs_step1.png)

=== "<2>"
    ![graph_dfs_step2](graph_traversal.assets/graph_dfs_step2.png)

=== "<3>"
    ![graph_dfs_step3](graph_traversal.assets/graph_dfs_step3.png)

=== "<4>"
    ![graph_dfs_step4](graph_traversal.assets/graph_dfs_step4.png)

=== "<5>"
    ![graph_dfs_step5](graph_traversal.assets/graph_dfs_step5.png)

=== "<6>"
    ![graph_dfs_step6](graph_traversal.assets/graph_dfs_step6.png)

=== "<7>"
    ![graph_dfs_step7](graph_traversal.assets/graph_dfs_step7.png)

=== "<8>"
    ![graph_dfs_step8](graph_traversal.assets/graph_dfs_step8.png)

=== "<9>"
    ![graph_dfs_step9](graph_traversal.assets/graph_dfs_step9.png)

=== "<10>"
    ![graph_dfs_step10](graph_traversal.assets/graph_dfs_step10.png)

=== "<11>"
    ![graph_dfs_step11](graph_traversal.assets/graph_dfs_step11.png)

!!! question "¿Es única la secuencia de recorrido en profundidad?"

    Similar al recorrido en amplitud, el orden de la secuencia de recorrido en profundidad tampoco es único. Dado un cierto vértice, es posible explorar en cualquier dirección primero, es decir, el orden de los vértices adyacentes se puede barajar arbitrariamente, siendo todos parte del recorrido en profundidad.

    Tomando el recorrido de árboles como ejemplo, "raíz $\rightarrow$ izquierda $\rightarrow$ derecha", "izquierda $\rightarrow$ raíz $\rightarrow$ derecha", "izquierda $\rightarrow$ derecha $\rightarrow$ raíz" corresponden a los recorridos en preorden, inorden y postorden, respectivamente. Muestran tres tipos de prioridades de recorrido, sin embargo, los tres se consideran recorridos en profundidad.

### Análisis de complejidad

**Complejidad temporal**: Todos los vértices se visitarán una vez, utilizando tiempo $O(|V|)$; todas las aristas se visitarán dos veces, utilizando tiempo $O(2|E|)$; en general, utilizando tiempo $O(|V| + |E|)$.

**Complejidad espacial**: El número máximo de vértices en la lista `res`, el conjunto hash `visited` es $|V|$, y la profundidad máxima de recursión es $|V|$, por lo tanto, utilizando espacio $O(|V|)$.

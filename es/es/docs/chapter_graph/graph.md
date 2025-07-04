# Grafo

Un <u>grafo</u> es un tipo de estructura de datos no lineal, que consta de <u>vértices</u> y <u>aristas</u>. Un grafo $G$ se puede representar abstractamente como una colección de un conjunto de vértices $V$ y un conjunto de aristas $E$. El siguiente ejemplo muestra un grafo que contiene 5 vértices y 7 aristas.

$$
\begin{aligned}
V & = \{ 1, 2, 3, 4, 5 \} \\
E & = \{ (1,2), (1,3), (1,5), (2,3), (2,4), (2,5), (4,5) \} \\
G & = \{ V, E \} \\
\end{aligned}
$$

Si los vértices se ven como nodos y las aristas como referencias (punteros) que conectan los nodos, los grafos pueden verse como una estructura de datos que se extiende a partir de las listas enlazadas. Como se muestra en la figura a continuación, **en comparación con las relaciones lineales (listas enlazadas) y las relaciones de divide y vencerás (árboles), las relaciones de red (grafos) son más complejas debido a su mayor grado de libertad**.

![Relación entre listas enlazadas, árboles y grafos](graph.assets/linkedlist_tree_graph.png)

## Tipos comunes y terminologías de grafos

Los grafos se pueden dividir en <u>grafos no dirigidos</u> y <u>grafos dirigidos</u> dependiendo de si las aristas tienen dirección, como se muestra en la figura a continuación.

- En grafos no dirigidos, las aristas representan una conexión "bidireccional" entre dos vértices, por ejemplo, los "amigos" en Facebook.
- En grafos dirigidos, las aristas tienen direccionalidad, es decir, las aristas $A \rightarrow B$ y $A \leftarrow B$ son independientes entre sí. Por ejemplo, la relación de "seguir" y "seguido" en Instagram o TikTok.

![Grafos dirigidos y no dirigidos](graph.assets/directed_graph.png)

Dependiendo de si todos los vértices están conectados, los grafos se pueden dividir en <u>grafos conectados</u> y <u>grafos desconectados</u>, como se muestra en la figura a continuación.

- Para grafos conectados, es posible llegar a cualquier otro vértice partiendo de un vértice arbitrario.
- Para grafos desconectados, hay al menos un vértice al que no se puede llegar desde un vértice inicial arbitrario.

![Grafos conectados y desconectados](graph.assets/connected_graph.png)

También podemos agregar una variable de peso a las aristas, lo que da como resultado <u>grafos ponderados</u> como se muestra en la figura a continuación. Por ejemplo, en Instagram, el sistema ordena su lista de seguidores y seguidos por el nivel de interacción entre usted y otros usuarios (me gusta, vistas, comentarios, etc.). Dicha red de interacción se puede representar mediante un grafo ponderado.

![Grafos ponderados y no ponderados](graph.assets/weighted_graph.png)

Las estructuras de datos de grafos incluyen los siguientes términos de uso común.

-   <u>Adyacencia</u>: Cuando hay una arista que conecta dos vértices, se dice que estos dos vértices son "adyacentes". En la figura anterior, los vértices adyacentes al vértice 1 son los vértices 2, 3 y 5.
-   <u>Ruta</u>: La secuencia de aristas que se pasan del vértice A al vértice B se denomina ruta de A a B. En la figura anterior, la secuencia de aristas 1-5-2-4 es una ruta del vértice 1 al vértice 4.
-   <u>Grado</u>: El número de aristas que tiene un vértice. Para grafos dirigidos, el <u>grado de entrada</u> se refiere a cuántas aristas apuntan al vértice, y el <u>grado de salida</u> se refiere a cuántas aristas apuntan desde el vértice.

## Representación de grafos

Las representaciones comunes de grafos incluyen "matriz de adyacencia" y "lista de adyacencia". Los siguientes ejemplos utilizan grafos no dirigidos.

### Matriz de adyacencia

Sea $n$ el número de vértices en el grafo, la <u>matriz de adyacencia</u> utiliza una matriz de $n \times n$ para representar el grafo, donde cada fila (columna) representa un vértice, y los elementos de la matriz representan aristas, con $1$ o $0$ indicando si hay una arista entre dos vértices.

Como se muestra en la figura a continuación, sea $M$ la matriz de adyacencia y $V$ la lista de vértices, entonces el elemento de la matriz $M[i, j] = 1$ indica que hay una arista entre el vértice $V[i]$ y el vértice $V[j]$, por el contrario $M[i, j] = 0$ indica que no hay una arista entre los dos vértices.

![Representación de un grafo con una matriz de adyacencia](graph.assets/adjacency_matrix.png)

Las matrices de adyacencia tienen las siguientes características.

- Un vértice no puede conectarse a sí mismo, por lo que los elementos de la diagonal principal de la matriz de adyacencia carecen de sentido.
- Para grafos no dirigidos, las aristas en ambas direcciones son equivalentes, por lo que la matriz de adyacencia es simétrica con respecto a la diagonal principal.
- Al reemplazar los elementos de la matriz de adyacencia de $1$ y $0$ por pesos, podemos representar grafos ponderados.

Al representar grafos con matrices de adyacencia, es posible acceder directamente a los elementos de la matriz para obtener aristas, lo que resulta en operaciones eficientes de adición, eliminación, búsqueda y modificación, todas con una complejidad temporal de $O(1)$. Sin embargo, la complejidad espacial de la matriz es $O(n^2)$, lo que consume más memoria.

### Lista de adyacencia

La <u>lista de adyacencia</u> utiliza $n$ listas enlazadas para representar el grafo, donde cada nodo de la lista enlazada representa un vértice. La $i$-ésima lista enlazada corresponde al vértice $i$ y contiene todos los vértices adyacentes (vértices conectados a ese vértice). La figura a continuación muestra un ejemplo de un grafo almacenado usando una lista de adyacencia.

![Representación de un grafo con una lista de adyacencia](graph.assets/adjacency_list.png)

La lista de adyacencia solo almacena aristas reales, y el número total de aristas suele ser mucho menor que $n^2$, lo que la hace más eficiente en espacio. Sin embargo, encontrar aristas en la lista de adyacencia requiere recorrer la lista enlazada, por lo que su eficiencia temporal no es tan buena como la de la matriz de adyacencia.

Observando la figura anterior, **la estructura de la lista de adyacencia es muy similar al "encadenamiento" en las tablas hash, por lo que podemos usar métodos similares para optimizar la eficiencia**. Por ejemplo, cuando la lista enlazada es larga, se puede transformar en un árbol AVL o un árbol rojo-negro, optimizando así la eficiencia temporal de $O(n)$ a $O(\log n)$; la lista enlazada también se puede transformar en una tabla hash, reduciendo así la complejidad temporal a $O(1)$.

## Aplicaciones comunes de los grafos

Como se muestra en la tabla a continuación, muchos sistemas del mundo real se pueden modelar con grafos, y los problemas correspondientes se pueden reducir a problemas de computación de grafos.

<p align="center"> Tabla <id> &nbsp; Grafos comunes en la vida real </p>

|                 | Vértices         | Aristas                                         | Problema de computación de grafos          |
| --------------- | ---------------- | --------------------------------------------- | -------------------------------- |
| Redes sociales | Usuarios            | Seguir / Seguido                                   | Recomendaciones de seguimiento potencial |
| Líneas de metro    | Estaciones         | Conectividad entre estaciones                 | Recomendaciones de ruta más corta   |
| Sistema solar    | Cuerpos celestes | Fuerzas gravitacionales entre cuerpos celestes | Cálculos de órbita planetaria     |
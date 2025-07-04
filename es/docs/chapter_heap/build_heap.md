# Operación de construcción de montículo

En algunos casos, queremos construir un montículo utilizando todos los elementos de una lista, y este proceso se conoce como "operación de construcción de montículo".

## Implementación con operación de inserción de montículo

Primero, creamos un montículo vacío y luego iteramos a través de la lista, realizando la "operación de inserción de montículo" en cada elemento a su vez. Esto significa agregar el elemento al final del montículo y luego "heapificarlo" de abajo hacia arriba.

Cada vez que se agrega un elemento al montículo, la longitud del montículo aumenta en uno. Dado que los nodos se agregan al árbol binario de arriba hacia abajo, el montículo se construye "de arriba hacia abajo".

Sea $n$ el número de elementos, y la operación de inserción de cada elemento toma $O(\log{n})$ tiempo, por lo tanto, la complejidad temporal de este método de construcción de montículo es $O(n \log n)$.

## Implementación mediante heapify a través del recorrido

De hecho, podemos implementar un método más eficiente de construcción de montículos en dos pasos.

1.  Agregue todos los elementos de la lista tal como están al montículo; en este punto, las propiedades del montículo aún no se satisfacen.
2.  Recorra el montículo en orden inverso (inverso del recorrido por niveles) y realice "heapify de arriba hacia abajo" en cada nodo no hoja.

**Después de heapificar un nodo, el subárbol con ese nodo como raíz se convierte en un submontículo válido**. Dado que el recorrido es en orden inverso, el montículo se construye "de abajo hacia arriba".

La razón para elegir el recorrido inverso es que asegura que el subárbol debajo del nodo actual ya es un submontículo válido, lo que hace que la heapificación del nodo actual sea efectiva.

Vale la pena mencionar que **dado que los nodos hoja no tienen hijos, naturalmente forman submontículos válidos y no necesitan ser heapificados**. Como se muestra en el siguiente código, el último nodo no hoja es el padre del último nodo; comenzamos desde él y recorremos en orden inverso para realizar la heapificación:

```src
[file]{my_heap}-[class]{max_heap}-[func]{__init__}
```

## Análisis de complejidad

A continuación, intentaremos calcular la complejidad temporal de este segundo método de construcción de montículos.

-   Suponiendo que el número de nodos en el árbol binario completo es $n$, entonces el número de nodos hoja es $(n + 1) / 2$, donde $/$ es la división entera. Por lo tanto, el número de nodos que necesitan ser heapificados es $(n - 1) / 2$.
-   En el proceso de "heapify de arriba hacia abajo", cada nodo se heapifica a los nodos hoja como máximo, por lo que el número máximo de iteraciones es la altura del árbol binario $\log n$.

Multiplicando los dos, obtenemos la complejidad temporal del proceso de construcción del montículo como $O(n \log n)$. **Pero esta estimación no es precisa, porque no tiene en cuenta la naturaleza del árbol binario que tiene muchos más nodos en los niveles inferiores que en la parte superior.**

Realicemos un cálculo más preciso. Para simplificar el cálculo, supongamos un "árbol binario perfecto" con $n$ nodos y altura $h$; esta suposición no afecta la corrección del resultado.

![Recuento de nodos en cada nivel de un árbol binario perfecto](build_heap.assets/heapify_operations_count.png)

Como se muestra en la figura anterior, el número máximo de iteraciones para que un nodo "sea heapificado de arriba hacia abajo" es igual a la distancia desde ese nodo hasta los nodos hoja, que es precisamente la "altura del nodo". Por lo tanto, podemos sumar el "número de nodos $\times$ altura del nodo" en cada nivel, **para obtener el número total de iteraciones de heapificación para todos los nodos**.

$$
T(h) = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{(h-1)}\times1
$$

Para simplificar la ecuación anterior, necesitamos usar el conocimiento de secuencias de la escuela secundaria, primero multiplicar $T(h)$ por $2$, para obtener:

$$
\begin{aligned}
T(h) & = 2^0h + 2^1(h-1) + 2^2(h-2) + \dots + 2^{h-1}\times1 \\
2T(h) & = 2^1h + 2^2(h-1) + 2^3(h-2) + \dots + 2^h\times1 \\
\end{aligned}
$$

Restando $T(h)$ de $2T(h)$ usando el método de desplazamiento, obtenemos:

$$
2T(h) - T(h) = T(h) = -2^0h + 2^1 + 2^2 + \dots + 2^{h-1} + 2^h
$$

Observando la ecuación, $T(h)$ es una serie geométrica, que se puede calcular directamente usando la fórmula de la suma, lo que resulta en una complejidad temporal de:

$$
\begin{aligned}
T(h) & = 2 \frac{1 - 2^h}{1 - 2} - h \\
& = 2^{h+1} - h - 2 \\
& = O(2^h)
\end{aligned}
$$

Además, un árbol binario perfecto con altura $h$ tiene $n = 2^{h+1} - 1$ nodos, por lo que la complejidad es $O(2^h) = O(n)$. Este cálculo muestra que **la complejidad temporal de introducir una lista y construir un montículo es $O(n)$, lo cual es muy eficiente**.

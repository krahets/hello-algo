# Problema de la mochila fraccionaria

!!! question

    Dados $n$ artículos, el peso del $i$-ésimo artículo es $wgt[i-1]$ y su valor es $val[i-1]$, y una mochila con una capacidad de $cap$. Cada artículo se puede elegir solo una vez, **pero se puede seleccionar una parte del artículo, con su valor calculado en función de la proporción del peso elegido**, ¿cuál es el valor máximo de los artículos en la mochila bajo la capacidad limitada? Un ejemplo se muestra en la figura a continuación.

![Datos de ejemplo del problema de la mochila fraccionaria](fractional_knapsack_problem.assets/fractional_knapsack_example.png)

El problema de la mochila fraccionaria es muy similar en general al problema de la mochila 0-1, involucrando el artículo actual $i$ y la capacidad $c$, con el objetivo de maximizar el valor dentro de la capacidad limitada de la mochila.

La diferencia es que, en este problema, solo se puede elegir una parte de un artículo. Como se muestra en la figura a continuación, **podemos dividir arbitrariamente los artículos y calcular el valor correspondiente en función de la proporción del peso**.

1.  Para el artículo $i$, su valor por unidad de peso es $val[i-1] / wgt[i-1]$, denominado valor unitario.
2.  Supongamos que ponemos una parte del artículo $i$ con peso $w$ en la mochila, entonces el valor agregado a la mochila es $w \times val[i-1] / wgt[i-1]$.

![Valor por unidad de peso del artículo](fractional_knapsack_problem.assets/fractional_knapsack_unit_value.png)

### Determinación de la estrategia codiciosa

Maximizar el valor total de los artículos en la mochila **esencialmente significa maximizar el valor por unidad de peso**. De esto, se puede deducir la estrategia codiciosa que se muestra en la figura a continuación.

1.  Ordene los artículos por su valor unitario de mayor a menor.
2.  Itere sobre todos los artículos, **eligiendo codiciosamente el artículo con el valor unitario más alto en cada ronda**.
3.  Si la capacidad restante de la mochila es insuficiente, use parte del artículo actual para llenar la mochila.

![Estrategia codiciosa del problema de la mochila fraccionaria](fractional_knapsack_problem.assets/fractional_knapsack_greedy_strategy.png)

### Implementación del código

Hemos creado una clase `Item` para ordenar los artículos por su valor unitario. Recorremos y tomamos decisiones codiciosas hasta que la mochila esté llena, luego salimos y devolvemos la solución:

```src
[file]{fractional_knapsack}-[class]{}-[func]{fractional_knapsack}
```

Además de la ordenación, en el peor de los casos, es necesario recorrer toda la lista de artículos, **por lo que la complejidad temporal es $O(n)$**, donde $n$ es el número de artículos.

Dado que se inicializa una lista de objetos `Item`, **la complejidad espacial es $O(n)$**.

### Prueba de corrección

Usando la prueba por contradicción. Supongamos que el artículo $x$ tiene el valor unitario más alto, y algún algoritmo produce un valor máximo `res`, pero la solución no incluye el artículo $x$.

Ahora retire una unidad de peso de cualquier artículo de la mochila y reemplácela con una unidad de peso del artículo $x$. Dado que el valor unitario del artículo $x$ es el más alto, el valor total después del reemplazo será definitivamente mayor que `res`. **Esto contradice la suposición de que `res` es la solución óptima, lo que demuestra que la solución óptima debe incluir el artículo $x$**.

Para otros artículos en esta solución, también podemos construir la contradicción anterior. En general, **los artículos con mayor valor unitario son siempre mejores opciones**, lo que demuestra que la estrategia codiciosa es efectiva.

Como se muestra en la figura a continuación, si el peso del artículo y el valor unitario se ven como los ejes horizontal y vertical de un gráfico bidimensional respectivamente, el problema de la mochila fraccionaria se puede transformar en "buscar el área más grande encerrada dentro de un rango de eje horizontal limitado". Esta analogía puede ayudarnos a comprender la efectividad de la estrategia codiciosa desde una perspectiva geométrica.

![Representación geométrica del problema de la mochila fraccionaria](fractional_knapsack_problem.assets/fractional_knapsack_area_chart.png)

